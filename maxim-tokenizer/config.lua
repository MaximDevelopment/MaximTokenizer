Maxim = {}

Maxim.Ban = function(spelerId, data) -- data is een table waarin alle informatie wordt meegestuurd over de resource/parameter (token)
    print(spelerId, json.encode(data))
    DropPlayer(spelerId, "Heeft een event getriggered met een executor")
end