minetest.register_on_chat_message(function(name, message)
    local player = minetest.get_player_by_name(name)
    if not player then
        return
    end

-- Vérifier si le joueur a le privilège "rainbowchat"
if not minetest.check_player_privs(name, {rainbowchat=true}) then
return
end

-- Tableau de couleurs à utiliser pour chaque lettre
local colors = {
"#FF0000", -- Rouge
"#FF6600", -- Orange foncé
"#FF9933", -- Orange clair
"#FFCC00", -- Jaune foncé
"#FFFF00", -- Jaune clair
"#CCFF00", -- Vert citron
"#66FF00", -- Vert clair
"#00FF00", -- Vert
"#00FF66", -- Vert bleu
"#00FFFF", -- Cyan
"#0066FF", -- Bleu clair
"#0000FF", -- Bleu
"#6600FF", -- Indigo
"#9933FF", -- Violet foncé
"#CC00FF", -- Violet
"#FF00FF", -- Rose
"#FF1493", -- Rose clair
"#00FF7F", -- Vert turquoise
"#FFD700", -- Or
"#8B008B", -- Magenta foncé
}

-- Convertir le message en une liste de caractères
local chars = {}
for char in message:gmatch(".") do
table.insert(chars, char)
end

-- Construire le nouveau message avec des couleurs différentes pour chaque caractère
local new_message = ""
for i, char in ipairs(chars) do
local color = colors[(i - 1) % #colors + 1]
new_message = new_message .. minetest.colorize(color, char)
end

-- Ajouter le nom du joueur au début du message
new_message = minetest.colorize("#ffffff", "<" .. name .. ">") .. " " .. new_message

-- Envoyer le nouveau message au joueur
minetest.chat_send_all(new_message)

-- Annuler l'envoi du message par défaut
return true
end)

-- Définir le privilège "rainbowchat"
minetest.register_privilege("rainbowchat", {
    description = "Permet de faire apparaître les messages de chat en couleurs arc-en-ciel.",
    give_to_singleplayer = false
})
