# Maxim Tokenizer
Wil jij je server beveiligen tegen hackers die doormiddel van events triggeren geld/wapens ontvangen? Dan kunt u dit nu gratis en voor niks gaan beveiligen met mijn tokenizer die ervoor zorgt dat er telkens een token wordt mee gestuurd die later wordt gechecked in de event, wanneer de token niet klopt wordt de speler gebanned en wanneer de token wel klopt wordt die weer veranderd. Dit om event loggers tegen te gaan. 

Dit zal geen false bans geven aangezien het op spelerId/resourcenaam wordt gezet/gechecked/veranderd en niet alleen op resourcenaam zoals veel andere tokenizers! 

## Documentatie

### ClientSide

```lua
local SecurityToken = nil

Citizen.CreateThread(function()
    while SecurityToken == nil do
        Citizen.Wait(1500)
        TriggerServerEvent("maxim:request:servertoken", GetCurrentResourceName())
    end
end)

RegisterNetEvent('maxim:receive:servertoken', function(resourceName, token)
    if resourceName == GetCurrentResourceName() then
        SecurityToken = token
    end
end)
```

### Trigger een serverevent waarbij je de juiste token meestuurd 

```lua
TriggerServerEvent("maxim:secured:event", 1000, SecurityToken)
```

### ServerSide Export Check Token

```lua
exports['maxim-tokenizer']:checkToken(source, GetCurrentResourceName(), token)
```

### Voorbeeld

```lua
RegisterServerEvent("maxim:secured:event", function(geld, token)
    if exports['maxim-eventprotection']:checkToken(source, GetCurrentResourceName(), token) then
        print(geld)
    end
end)
```

Voor verdere vragen https://discord.gg/NN6EMzEuqt
