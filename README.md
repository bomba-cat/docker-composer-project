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
Test-ID | Container-, Volume-, Netzwerkname | Was wird getestet
-------- | ----- | -----------
1 | gitlab_config (Gitlab) | Persistenz testen (Volumes)
2 | gitlab_log (Gitlab) | Persistenz testen (Volumes)
3 | gitlab_data (Gitlab) | Persistenz testen (Volumes)
4 | gitlab_db (Gitlab) | Persistenz testen (Volumes)
5 | gitlab_redis (Gitlab) | Persistenz testen (Volumes)
6 | nextcloud (Nextcloud) | Persistenz testen (Volumes)
7 | nextcloud_db (Nextcloud) | Persistenz testen (Volumes)
8 | mediawiki (Mediawiki) | Persistenz testen (Volumes)
9 | mediawiki_db (Mediawiki) | Persistenz testen (Volumes)
10 | portainer_data (Portainer) | Persistenz testen (Volumes)
11 | main | Netzwerke testen
12 | gitlab | Netzwerke testen
13 | nextcloud | Netzwerke testen
14 | mediawiki | Netzwerke testen
15 | Gitlab | App testen
16 | Nextcloud | App testen
17 | Mediawiki | App testen
18 | Portainer | App testen
19 | Gitlab | Benutzer testen (Login)
20 | Nextcloud | Benutzer testen (Login)
21 | Mediawiki | Benutzer testen (Login)
22 | Portainer | Benutzer testen (Login)
23 | Gitlab | Sicherheit testen (Passwörter)
24 | Nextcloud | Sicherheit testen (Passwörter)
25 | Mediawiki | Sicherheit testen (Passwörter)
26 | Portainer | Sicherheit testen (Passwörter)
27 | gitlab_db (postgres) | Berechtigungen testen (DB)
28 | nextcloud_db (MySQL) | Berechtigungen testen (DB)
29 | mediawiki_db (MySQL) | Berechtigungen testen (DB)
30 | Gitlab | Ressourcen testen
31 | Nextcloud | Ressourcen testen
32 | Mediawiki | Ressourcen testen
33 | Portainer | Ressourcen testen

## 3. Testmittel und -methoden
Test-ID | Testmittel | Testmethoden
-------- | ----- | -----------
1 | ----- | -----------
2 | ----- | -----------
3 | ----- | -----------
4 | ----- | -----------
5 | ----- | -----------
6 | ----- | -----------
7 | ----- | -----------
8 | ----- | -----------
9 | ----- | -----------
10 | ----- | -----------
11 | ----- | -----------
12 | ----- | -----------
13 | ----- | -----------
14 | ----- | -----------
15 | ----- | -----------
16 | ----- | -----------
17 | ----- | -----------
18 | ----- | -----------
19 | ----- | -----------
20 | ----- | -----------
21 | ----- | -----------
22 | ----- | -----------
23 | ----- | -----------
24 | ----- | -----------
25 | ----- | -----------
26 | ----- | -----------
27 | ----- | -----------
28 | ----- | -----------
29 | ----- | -----------
30 | ----- | -----------
31 | ----- | -----------
32 | ----- | -----------
33 | ----- | -----------

## 4. Erwartete Resultate
Test-ID | Eingabe | Erwartete Resultate
-------- | ----- | -----------
1 | ----- | -----------
2 | ----- | -----------
3 | ----- | -----------
4 | ----- | -----------
5 | ----- | -----------
6 | ----- | -----------
7 | ----- | -----------
8 | ----- | -----------
9 | ----- | -----------
10 | ----- | -----------
11 | ----- | -----------
12 | ----- | -----------
13 | ----- | -----------
14 | ----- | -----------
15 | ----- | -----------
16 | ----- | -----------
17 | ----- | -----------
18 | ----- | -----------
19 | ----- | -----------
20 | ----- | -----------
21 | ----- | -----------
22 | ----- | -----------
23 | ----- | -----------
24 | ----- | -----------
25 | ----- | -----------
26 | ----- | -----------
27 | ----- | -----------
28 | ----- | -----------
29 | ----- | -----------
30 | ----- | -----------
31 | ----- | -----------
32 | ----- | -----------
33 | ----- | -----------

## 5. Durchführung und Protokollierung
Test-ID | Ausgeführt von | Datum | Protokollierung | Resultat
-------- | ----- | ----- | ----------- | -----------
1 | ----- | 24.06.2024 | ----------- | -----------
2 | ----- | 24.06.2024 | ----------- | -----------
3 | ----- | 24.06.2024 | ----------- | -----------
4 | ----- | 24.06.2024 | ----------- | -----------
5 | ----- | 24.06.2024 | ----------- | -----------
6 | ----- | 24.06.2024 | ----------- | -----------
7 | ----- | 24.06.2024 | ----------- | -----------
8 | ----- | 24.06.2024 | ----------- | -----------
9 | ----- | 24.06.2024 | ----------- | -----------
10 | ----- | 24.06.2024 | ----------- | -----------
11 | ----- | 24.06.2024 | ----------- | -----------
12 | ----- | 24.06.2024 | ----------- | -----------
13 | ----- | 24.06.2024 | ----------- | -----------
14 | ----- | 24.06.2024 | ----------- | -----------
15 | ----- | 24.06.2024 | ----------- | -----------
16 | ----- | 24.06.2024 | ----------- | -----------
17 | ----- | 24.06.2024 | ----------- | -----------
18 | ----- | 24.06.2024 | ----------- | -----------
19 | ----- | 24.06.2024 | ----------- | -----------
20 | ----- | 24.06.2024 | ----------- | -----------
21 | ----- | 24.06.2024 | ----------- | -----------
22 | ----- | 24.06.2024 | ----------- | -----------
23 | ----- | 24.06.2024 | ----------- | -----------
24 | ----- | 24.06.2024 | ----------- | -----------
25 | ----- | 24.06.2024 | ----------- | -----------
26 | ----- | 24.06.2024 | ----------- | -----------
27 | ----- | 24.06.2024 | ----------- | -----------
28 | ----- | 24.06.2024 | ----------- | -----------
29 | ----- | 24.06.2024 | ----------- | -----------
30 | ----- | 24.06.2024 | ----------- | -----------
31 | ----- | 24.06.2024 | ----------- | -----------
32 | ----- | 24.06.2024 | ----------- | -----------
33 | ----- | 24.06.2024 | ----------- | -----------

# Sicherkeitskonzept

## Einleitung
- **Zweck und Umfang**: Der Zweck dieses Sicherheitskonzepts ist es, die Bedrohungen in den Diensten des Informatik-KMU zu minimieren.
- **Hintergrund**: Informatik-KMU will eine Infrastruktur mit MediaWiki, Nextcloud und Gitlab aufbauen, die mit Portainer verwaltet werden kann und eine persistente Datenspeicherung gewährleistet.

## Risikobewertung und Analyse

### Bedrohungsanalyse

| Bedrohung            | Beschreibung |
|----------------------|--------------|
| Unbefugter Zugriff   | Unbefugte Personen könnten versuchen, auf MediaWiki, Nextcloud oder Gitlab zuzugreifen. |
| Datenverlust         | Daten könnten durch Hardware-Ausfälle, Software-Fehler oder menschliches Versagen verloren gehen. |
| Malware und Viren    | Schadsoftware könnte in die Systeme eindringen und Daten korrumpieren oder stehlen. |
| Schwache Authentifizierung | Schwache Passwörter könnten es Angreifern ermöglichen, Zugang zu den Systemen zu erlangen. |

### Risikobewertung

| Risiko              | Wahrscheinlichkeit | Potenzieller Schaden |
|---------------------|--------------------|----------------------|
| Unbefugter Zugriff  | Hoch               | Hoch                 |
| Datenverlust        | Niedrig            | Sehr Hoch            |
| Malware und Viren   | Mittel             | Hoch                 |
| Netzwerkangriffe    | Mittel bis Hoch    | Hoch                 |
| Schwache Authentifizierung | Hoch        | Hoch                 |

## Sicherheitsrichtlinien und -verfahren

### Richtlinien

Die folgenden Sicherheitsrichtlinien sollen die Infrastruktur des Informatik-KMU schützen:

1. **Zugriffskontrollen**: Implementierung strenger Zugriffskontrollen für alle Dienste.
2. **Datensicherung**: Regelmässige Backups aller wichtigen Daten und Konfigurationen.
3. **Malwareschutz**: Installation und regelmäßige Aktualisierung von Antiviren- und Antimalware-Software.
4. **Sicherheitsupdates**: Regelmässige Updates und Patches für alle Systeme und Anwendungen.

### Verfahren

Die Verfahren zur Umsetzung der Sicherheitsrichtlinien umfassen:

1. **Einrichtung von Zugriffskontrollen**:
    - Verwendung starker Passwörter und Zwei-Faktor-Authentifizierung (2FA).

2. **Datensicherung**:
    - Einrichtung eines automatisierten Backup-Systems mit Cronjob für Linux.
    - Regelmässige Überprüfung der Backups auf Vollständigkeit und Integrität.

3. **Malwareschutz**:
    - Installation von Antiviren-Software auf WM.
    - Regelmässige Durchführung von Malware-Scans und Überprüfung der Systeme.

4. **Sicherheitsupdates**:
    - Regelmässige Überprüfung auf verfügbare Updates und Patches.
    - Testen und Einspielen von Updates in einer kontrollierten Umgebung, bevor sie auf die Produktionssysteme angewendet werden.


Durch die Umsetzung dieser Sicherheitsrichtlinien und -verfahren kann das Informatik-KMU eine robuste und sichere Infrastruktur für MediaWiki, Nextcloud und Gitlab gewährleisten, die mit Portainer überwacht und verwaltet wird.





