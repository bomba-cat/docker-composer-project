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
## System, Host
VARIABLE | VALUE | DESCRIPTION
-------- | ----- | -----------
MYSQL_ROOT_PASSWORD | KUZ35_:3434FEfwew*1 | Mysql root password
MYSQL_PASSWORD | KUZ35_:3434FEfwew*1 | Mysql user password
## Git
VARIABLE | VALUE | DESCRIPTION
-------- | ----- | -----------
## Mediawiki, Mysql
VARIABLE | VALUE | DESCRIPTION
-------- | ----- | -----------
## Nextcloud, Mysql
VARIABLE | VALUE | DESCRIPTION
-------- | ----- | -----------

# Arbeitsplanung und Aufgabenteilung

## Arbeitsplanung
In dem Systemdiagramm können wir sehen, dass wir die Anforderungen analysiert und alles auf vier Container aufgeteilt haben. 
Am Ende werden wir all diese Infrastruktur zusammenbauen, sodass wir sie auf einer Arbeitsmaschine testen können, was die endgültige Testung und Umsetzung des Ganzen vereinfacht.

## Aufgabenteilung
MediaWiki wurde von Mykhaylo realisiert, NextCloud von Jan und GitLab von Bledion. Portainer haben wir entschieden, am Ende gemeinsam zu machen, und die zugehörigen Datenbanken wird jeder für seinen Container selbst erstellen. 



# Journal
. | Jan | Mykhaylo | Bledion
---- | --- | -------- | -------
17.06.2024 | Mein Ziel war es den Code für die Installation von Nextcloud zu schreiben. Ich habe den Code schon fast fertig. Ich muss noch den MySQL Server korrekt aufsetzen. Ich hatte Probleme beim erstellen des Codes, da er nicht richtig ausgeführt wurde. | Ich habe meine Ziele erreicht und eine Docker Compose Datei erstellt, die zwei Images umfasst: MySQL und MediaWiki. Zwar habe ich die Konfiguration noch nicht abschliessend überprüft, aber nach der ersten Ausführung in meiner Linux-Umgebung funktioniert sie einwandfrei. | Ich habe mich mit dem Gitlab auseinander gesetzt und weiss jetzt alles was ich dazu brauche. Ich habe auch einen Run script erstellt um die dockers zu ausführen und schemas gezeichnet
20.06.2024 | Mein Ziel war es, den Code von Nextcloud zu vervollständigen. Ich hatte heute keine Probleme mit meinem Teil. Wir müssen nun nur noch das Testkonzept fertig erstellen, sowie kleine Anpassungen an unserem Code vornehmen, damit dieser einwandfrei funktioniert und allen Anforderungen entspricht. | Text Mykhaylo | Text Bledion
24.06.2024 | Text Jan | Text Mykhaylo | Text Bledion


# Testkonzept

## 1. Testumfeld und Randbedingungen
Hardware | Netzwerkeinstellungen | Abhändigkeiten von anderen Systemen
-------- | --------------------- | -----------------------------------
Dieses Projekt erfordert eine Infrastruktur mit einem Server, in dem die mehreren VMs und Container nach Bedarf erstellt werden können. | Wir haben es so eingeebnet, dass es drei Netzwerke sein werden, der Grund dafür ist die Sicherheit, denn es gibt ein Brückennetzwerk, das MediaWiki Nextcloud und Gitlab umfasst, das die innere Kommunikation und zwischen Containern ermöglicht, aber die Datenbanken für MediaWiki und Nextcloud sind voneinander getrennt und können nur mit bestimmten Containern kommunizieren.| 

## 2. Testplan
... | ... | ...
-------- | ----- | -----------

## 3. Testmittel und -methoden
... | ... | ...
-------- | ----- | -----------

## 4. Erwartete Resultate
... | ... | ...
-------- | ----- | -----------

## 5. Durchführung und Protokollierung
... | ... | ...
-------- | ----- | -----------


# Sicherheitskonzept




