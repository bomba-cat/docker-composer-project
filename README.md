# Images
- gitlab/gitlab-ce:laters
- mysql:latest
- nextcloud:latest
- mediawiki:latest
- portainer:latest

# Passwords
The passwords are set as a env variable on the host system so the guest systems can rely on those

# Plan
<a><img src="img/Networks.png" alt="Error Loading image" height="400"/></a>
<img src="img/System.png" alt="Error Loading image" height="400">

# Environment Variables
VARIABLE | VALUE | DESCRIPTION
-------- | ----- | -----------
MYSQL_ROOT_PASSWORD | KUZ35_:3434FEfwew*1 | Mysql root password
MYSQL_PASSWORD | KUZ35_:3434FEfwew*1 | Mysql user password


# Journal
. | Jan | Mykhaylo | Bledion
---- | --- | -------- | -------
17.06.2024 | Mein Ziel war es den Code für die Installation von Nextcloud zu schreiben. Ich habe den Code schon fast fertig. Ich muss noch den MySQL Server korrekt aufsetzen. Ich hatte Probleme beim erstellen des Codes, da er nicht richtig ausgeführt wurde. | Ich habe meine Ziele erreicht und eine Docker Compose Datei erstellt, die zwei Images umfasst: MySQL und MediaWiki. Zwar habe ich die Konfiguration noch nicht abschliessend überprüft, aber nach der ersten Ausführung in meiner Linux-Umgebung funktioniert sie einwandfrei.| Ich habe mich mit dem Gitlab auseinander gesetzt und weiss jetzt alles was ich dazu brauche. Ich habe auch einen Run script erstellt um die dockers zu ausführen und schemas gezeichnet

