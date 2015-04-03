Mod Minetest : Back
===================

Description :
-------------
Ce mod ajout la commande /back qui vous permettra de vous téléporter à la dernière position sauvegardée.
La dernière position connue est enregistrée dans le fichier ./worlds/[world_name]/back_positions.
Elle est enregistrée dans ce fichier quand vous utilisez les commandes ci-dessous :
- /spawn (si celle-ci est disponible)
- /home (si celle-ci est disponible)
- /warp -> module simple_warp
    - https://forum.minetest.net/viewtopic.php?f=9&t=10681
    - https://github.com/indriApollo/simple_warp

Pour ces trois commandes il faut ajouter le bout de code ci-dessous qui permettra d'enregistrer la position :

<pre>
if minetest.get_modpath("back") then
	back.save_position(name)
end
</pre>

Il faut le placer avant l'appel à <strong>player:setpos()</strong>

Contact :
---------
Pour toutes demandes, suggestions, bugs, etc... Merci de m'envoyer un mail : minetest@akiba.fr
