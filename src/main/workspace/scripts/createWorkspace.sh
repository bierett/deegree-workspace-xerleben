#!/bin/sh

echo "";

#JDBC
    echo "[$(date  +"%d/%m/%Y %T")] ""Starte JDBC Konfiguration.";
    dir="../jdbc/"
    echo "[$(date  +"%d/%m/%Y %T")] ""Lösche Verzeichnis '$dir'.";
    rm -rf $dir/*
    if [ "$(ls -A $dir)" ]; then
         echo "[$(date  +"%d/%m/%Y %T")] ""Löschen ist fehlgeschlagen."
    else
        echo "[$(date  +"%d/%m/%Y %T")] ""Löschen war erfolgreich."
    fi

    perl bin/01_createJdbc.pl
    if [ "$(ls -A $dir)" ]; then
         echo "[$(date +"%d/%m/%Y %T")] ""JDBC Konfiguration war erfolgreich.\n"
    else
        echo "[$(date +"%d/%m/%Y %T")] ""JDBC Konfiguration ist fehlgeschlagen.\n"
    fi

#Layers
    echo "[$(date  +"%d/%m/%Y %T")] ""Starte Layers Konfiguration.";
    dir="../layers/"
    echo "[$(date  +"%d/%m/%Y %T")] ""Lösche Verzeichnis '$dir'.";
    rm -rf $dir/*
    if [ "$(ls -A $dir)" ]; then
         echo "[$(date  +"%d/%m/%Y %T")] ""Löschen ist fehlgeschlagen."
    else
        echo "[$(date  +"%d/%m/%Y %T")] ""Löschen war erfolgreich."
    fi

    perl bin/04_createLayer.pl
    if [ "$(ls -A $dir)" ]; then
         echo "[$(date  +"%d/%m/%Y %T")] ""Layers Konfiguration war erfolgreich.\n"
    else
        echo "[$(date  +"%d/%m/%Y %T")] ""Layers Konfiguration ist fehlgeschlagen.\n"
    fi

#Services
    echo "[$(date  +"%d/%m/%Y %T")] ""Starte Services Konfiguration.";
    dir="../services/"
    echo "[$(date  +"%d/%m/%Y %T")] ""Lösche Verzeichnis '$dir'.";
    rm -rf $dir/*
    if [ "$(ls -A $dir)" ]; then
         echo "[$(date  +"%d/%m/%Y %T")] ""Löschen ist fehlgeschlagen."
    else
        echo "[$(date  +"%d/%m/%Y %T")] ""Löschen war erfolgreich."
    fi

    perl bin/02_createWfs.pl
    perl bin/07_createWms.pl
    perl bin/08_createMetada.pl
    if [ "$(ls -A $dir)" ]; then
         echo "[$(date  +"%d/%m/%Y %T")] ""Services Konfiguration war erfolgreich.\n"
    else
        echo "[$(date  +"%d/%m/%Y %T")] ""Services Konfiguration ist fehlgeschlagen.\n"
    fi

#Styles
#    echo "[$(date  +"%d/%m/%Y %T")] ""Starte Styles Konfiguration.";
#    dir="../styles/"
#    echo "[$(date  +"%d/%m/%Y %T")] ""Lösche Verzeichnis '$dir'.";
#    rm -rf $dir/*
#    if [ "$(ls -A $dir)" ]; then
#         echo "[$(date  +"%d/%m/%Y %T")] ""Löschen ist fehlgeschlagen."
#    else
#        echo "[$(date  +"%d/%m/%Y %T")] ""Löschen war erfolgreich."
#    fi

#    perl bin/06_createStyles.pl
#    if [ "$(ls -A $dir)" ]; then
#         echo "[$(date  +"%d/%m/%Y %T")] ""Styles Konfiguration war erfolgreich.\n"
#    else
#        echo "[$(date  +"%d/%m/%Y %T")] ""Styles Konfiguration ist fehlgeschlagen.\n"
#    fi

#Themes
    echo "[$(date  +"%d/%m/%Y %T")] ""Starte Themes Konfiguration.";
    dir="../themes/"
    echo "[$(date  +"%d/%m/%Y %T")] ""Lösche Verzeichnis '$dir'.";
    rm -rf $dir/*
    if [ "$(ls -A $dir)" ]; then
         echo "[$(date  +"%d/%m/%Y %T")] ""Löschen ist fehlgeschlagen."
    else
        echo "[$(date  +"%d/%m/%Y %T")] ""Löschen war erfolgreich."
    fi
    
    perl bin/05_createThemes.pl
    if [ "$(ls -A $dir)" ]; then
         echo "[$(date  +"%d/%m/%Y %T")] ""Themes Konfiguration war erfolgreich.\n"
    else
        echo "[$(date  +"%d/%m/%Y %T")] ""Themes Konfiguration ist fehlgeschlagen.\n"
    fi
