<div style="border: 1px solid black; padding: 10px;">

# Images
- `gitlab/gitlab-ce:latest`
- `mysql:latest`
- `nextcloud:latest`
- `mediawiki:latest`
- `portainer:latest`

# Passwords
The passwords are set as environment variables on the host system so the guest systems can rely on those.

# Plan
<a><img src="img/Networks.png" alt="Error Loading image" height="400"/></a>
<img src="img/System.png" alt="Error Loading image" height="400">

# Environment Variables

## System, Host

VARIABLE | VALUE | DESCRIPTION
-------- | ----- | -----------
MYSQL_ROOT_PASSWORD | `KUZ35_:3434FEfwew*1` | Mysql root password
MYSQL_PASSWORD | `KUZ35_:3434FEfwew*1` | Mysql user password

## Git

VARIABLE | VALUE | DESCRIPTION
-------- | ----- | -----------

## Mediawiki, Mysql

VARIABLE | VALUE | DESCRIPTION
-------- | ----- | -----------

## Nextcloud, Mysql

VARIABLE | VALUE | DESCRIPTION
-------- | ----- | -----------

</div>


# Arbeitsplanung und Aufgabenteilung
<img src="https://github.com/mykhaylo-zhovkevych/docker-composer-project/assets/148889468/63d281f2-4ace-41bf-8668-babc5c86171e" height="400" width="auto">


## Arbeitsplanung
In dem Systemdiagramm können wir sehen, dass wir die Anforderungen analysiert und alles auf vier Container aufgeteilt haben. Am Ende werden wir all diese Infrastruktur zusammenbauen, sodass wir sie auf einer Arbeitsmaschine testen können, was die endgültige Testung und Umsetzung des Ganzen vereinfacht.

## Aufgabenteilung
MediaWiki wurde von Mykhaylo realisiert und getestet, NextCloud von Jan und GitLab von Bledion. Portainer haben wir entschieden, am Ende gemeinsam zu machen, aber Mykhaylo hat es umgesetzt und die zugehörigen Datenbanken wird jeder für seinen Container selbst erstellen.
Das Testkonzept, das die Testprotokollierung und den Testplan umfasst, wurde von Jan ausgefühlt. Die Dokumentation wurde hauptsächlich von Bledion geführt und zusammengefasst, zusätzlich haben Jan und Mykhaylo die Umgebungsvariablen und Images zugeordnet. Die Journale hat jeder für sich selbst geführt und das Sicherheitskonzept wurde von Mykhaylo erstellt.



# Journal
. | Jan | Mykhaylo | Bledion
---- | --- | -------- | -------
17.06.2024 | Mein Ziel war es den Code für die Installation von Nextcloud zu schreiben. Ich habe den Code schon fast fertig. Ich muss noch den MySQL Server korrekt aufsetzen. Ich hatte Probleme beim erstellen des Codes, da er nicht richtig ausgeführt wurde. | Ich habe meine Ziele erreicht und eine Docker Compose Datei erstellt, die zwei Images umfasst: MySQL und MediaWiki. Zwar habe ich die Konfiguration noch nicht abschliessend überprüft, aber nach der ersten Ausführung in meiner Linux-Umgebung funktioniert sie einwandfrei. | Ich habe mich mit dem Gitlab auseinander gesetzt und weiss jetzt alles was ich dazu brauche. Ich habe auch einen Run script erstellt um die dockers zu ausführen und schemas gezeichnet
20.06.2024 | Mein Ziel war es, den Code von Nextcloud zu vervollständigen. Ich hatte heute keine Probleme mit meinem Teil. Wir müssen nun nur noch das Testkonzept fertig erstellen, sowie kleine Anpassungen an unserem Code vornehmen, damit dieser einwandfrei funktioniert und allen Anforderungen entspricht. | Heute habe ich meinen Code verbessert, indem ich eine Ressourcenbeschränkung eingeführt und einen neuen Container für Portainer erstellt habe, den ich allerdings noch nicht getestet habe. Solange das Docker Compose korrekt aussieht, sollte das in Ordnung sein. Zusäztlich habe ich die Vorlagen für das Testkonzept erstellt und den ersten Absatz ausgefüllt. Zudem habe ich einige kleine Commits mit Umbenennungen der Ordnerstruktur gemacht. | Text Bledion
24.06.2024 | Text Jan | Text Mykhaylo | Text Bledion


# Testkonzept

## 1. Testumfeld und Randbedingungen
Hardware | Netzwerkeinstellungen | Abhändigkeiten von anderen Systemen
-------- | --------------------- | -----------------------------------
Dieses Projekt erfordert eine Infrastruktur mit einem Server, in dem die mehreren VMs und Container nach Bedarf erstellt werden können. | Wir haben es so eingeebnet, dass es drei Netzwerke sein werden, der Grund dafür ist die Sicherheit, denn es gibt ein Brückennetzwerk, das MediaWiki Nextcloud und Gitlab umfasst, das die innere Kommunikation und zwischen Containern ermöglicht, aber die Datenbanken für MediaWiki und Nextcloud sind voneinander getrennt und können nur mit bestimmten Containern kommunizieren.| 

## 2. Testplan
Test-ID | Containername | Testinhalt
-------- | ----- | -----------
1 | ----- | -----------
2 | ----- | -----------
3 | ----- | -----------
4 | ----- | -----------

## 3. Testmittel und -methoden
Test-ID | Testmittel | Testmethoden
-------- | ----- | -----------
1 | ----- | -----------
2 | ----- | -----------
3 | ----- | -----------
4 | ----- | -----------

## 4. Erwartete Resultate
Test-ID | Eingabe | Erwartete Resultate
-------- | ----- | -----------
1 | ----- | -----------
2 | ----- | -----------
3 | ----- | -----------
4 | ----- | -----------

## 5. Durchführung und Protokollierung
Test-ID | Ausgeführt von | Datum | Resultat
-------- | ----- | ----- | -----------
1 | ----- | 24.06.2024 | -----------
2 | ----- | 24.06.2024 | -----------
3 | ----- | 24.06.2024 | -----------
4 | ----- | 24.06.2024 | -----------


# Sicherheitskonzept




