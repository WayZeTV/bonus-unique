ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand("bonus", function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    local identifier = xPlayer.getIdentifier()

    MySQL.Async.fetchScalar('SELECT 1 FROM bonus_claims WHERE identifier = @identifier', {
        ['@identifier'] = identifier
    }, function(result)
        if result then
            -- Envoie notification "déjà utilisé"
            TriggerClientEvent('bonus:notification', source, "❌ Tu as déjà reçu ton bonus.")
        else
            -- Donne l'argent
            xPlayer.addMoney(5000)

            -- Enregistre l'identifiant
            MySQL.Async.execute('INSERT INTO bonus_claims (identifier) VALUES (@identifier)', {
                ['@identifier'] = identifier
            })

            -- Envoie notification "bonus reçu"
            TriggerClientEvent('bonus:notification', source, "✅ Tu as reçu 5000$ de bonus. Utilisable une seule fois !")
        end
    end)
end, false)
