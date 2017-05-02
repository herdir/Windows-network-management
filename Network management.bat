@echo off
title Windows Network management
netsh int ipv6 isatap set state disabled
netsh int ipv6 6to4 set state disabled
netsh interface teredo set state disable
netsh interface isatap state disable

:options
cls
echo MENU OPTIONS:
echo =====================
echo   1  ipconfig
echo   2  ipconfig all
echo   3  renew
echo   4  ping
echo   5  tracert
echo   6  IP Publique
echo =====================
echo   h pour l'aide
echo   q pour quitter
echo =====================
set /p input="Entrer l'option ici : "

if "%input%"=="1" goto:ipconfig
if "%input%"=="2" goto:ipconfigall
if "%input%"=="3" goto:renew
if "%input%"=="4" goto:ping
if "%input%"=="5" goto:tracert
if "%input%"=="6" goto:ippublique
if "%input%"=="h" goto:help
if "%input%"=="q" goto:exit

echo Merci de choisir une option de la liste ci-dessus
pause
goto:options

:ipconfig
ipconfig.exe
pause
goto:options


:ipconfigall
ipconfig.exe /all
pause
goto:options


:renew
ipconfig.exe /release
ipconfig.exe /flushdns
ipconfig.exe /renew
pause
goto:options


:ping
ping google.com
pause
goto:options


:tracert
tracert google.com
pause
goto:options

:help
echo   1  ipconfig
		echo ipconfig est une commande informatique propre a Microsoft Windows. Elle permet d'afficher et de modifier la configuration reseau d'un PC. Elle affiche : le nom de l'hote (le PC local), le domaine d'appartenance et pour chaque interface (en vrac) : le type d'interface, l'adresse physique (adresse MAC), l'adresse IPv4, IPv6, le masque de sous-reseau, l'adresse de la passerelle, les adresses des DNS, un indicateur (DHCP active) non/oui selon que l'adresse est fixe (imposee par l'utilisateur) ou dynamique (donnee par un serveur DHCP).
echo.
echo.
echo   2  ipconfig all
		echo Affiche la configuration TCP/IP complete de toutes les cartes. Sans ce parametre, ipconfig affiche uniquement l'adresse IP, le masque de sous-reseau et les valeurs de la passerelle par defaut de chaque carte. Les cartes peuvent representer des interfaces physiques, par exemple les cartes reseau installees, ou des interfaces logiques, par exemple les connexions d'acces a distance.
echo.
echo.
echo   3  renew
		echo Envoie un message DHCPRELEASE au serveur DHCP pour liberer la configuration DHCP actuelle et annuler la configuration d'adresse IP de toutes les cartes (si aucune carte n'est specifie) ou d'une carte specifique si le parametre Carte est inclus. Ce parametre desactive TCP/IP pour les cartes configurees de maniere a obtenir automatiquement une adresse IP. Pour specifier un nom de carte, tapez celui qui apparait quand vous utilisez ipconfig sans parametre.
		echo Vide et reinitialise le contenu du cache de resolution du client DNS. Au cours de la resolution des problemes DNS, vous pouvez utiliser cette procedure pour exclure les entrees de cache negatives ainsi que toutes les autres entrees ajoutees de facon dynamique.
		echo Renouvelle la configuration DHCP de tous les cartes (si aucune carte n'est specifiee) ou d'une carte specifique si le parametre Carte est inclus. Ce parametre est disponible uniquement sur les ordinateurs dont les cartes sont configurees de maniere a obtenir automatiquement une adresse IP. Pour specifier un nom de carte, tapez celui qui apparait quand vous utilisez ipconfig sans parametre.
echo.
echo.
echo   4  ping
		echo Il s'agit de l'un des outils les plus simples puisqu'il permet, grace a l'envoi de paquets, de verifier si une machine distante repond et, par extension, qu'elle est accessible par le reseau.
echo.
echo.
echo   5  tracert
		echo Il sagit d'un programme utilitaire qui permet de suivre les chemins qu'un paquet de donnees (paquet IP) va prendre pour aller de la machine locale a une autre machine connectee au reseau IP.
pause
goto:options

:ippublique
for /f "tokens=2 delims=: " %%A in (
  'nslookup myip.opendns.com. resolver1.opendns.com 2^>NUL^|find "Address:"'
) Do set ExtIP=%%A

Echo votre adresse IP publique est : %ExtIP%
pause
goto:options

:exit
exit