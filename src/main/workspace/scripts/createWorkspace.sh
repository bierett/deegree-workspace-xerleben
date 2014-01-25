#!/bin/sh

echo "";

#JDBC
    dir="../jdbc/"
    echo "[$(date)] ""Lösche Verzeichnis '$dir'.";
    rm -rf $dir/*
    if [ "$(ls -A $dir)" ]; then
         echo "[$(date)] ""Löschen ist fehlgeschlagen."
    else
        echo "[$(date)] ""Löschen war erfolgreich."
    fi

    echo "[$(date)] ""Starte JDBC Konfiguration.";
    perl bin/01_createJdbc.pl
    if [ "$(ls -A $dir)" ]; then
         echo "[$(date)] ""JDBC Konfiguration war erfolgreich.\n"
    else
        echo "[$(date)] ""JDBC Konfiguration ist fehlgeschlagen.\n"
    fi

#Layers
    dir="../layers/"
    echo "[$(date)] ""Lösche Verzeichnis '$dir'.";
    rm -rf $dir/*
    if [ "$(ls -A $dir)" ]; then
         echo "[$(date)] ""Löschen ist fehlgeschlagen."
    else
        echo "[$(date)] ""Löschen war erfolgreich."
    fi

    echo "[$(date)] ""Starte Layers Konfiguration.";
    perl bin/04_createLayer.pl
    if [ "$(ls -A $dir)" ]; then
         echo "[$(date)] ""Layers Konfiguration war erfolgreich.\n"
    else
        echo "[$(date)] ""Layers Konfiguration ist fehlgeschlagen.\n"
    fi

#Services
    dir="../services/"
    echo "[$(date)] ""Lösche Verzeichnis '$dir'.";
    rm -rf $dir/*
    if [ "$(ls -A $dir)" ]; then
         echo "[$(date)] ""Löschen ist fehlgeschlagen."
    else
        echo "[$(date)] ""Löschen war erfolgreich."
    fi

    echo "[$(date)] ""Starte Services Konfiguration.";
    perl bin/02_createWfs.pl
    perl bin/07_createWms.pl
    perl bin/08_createMetada.pl
    if [ "$(ls -A $dir)" ]; then
         echo "[$(date)] ""Services Konfiguration war erfolgreich.\n"
    else
        echo "[$(date)] ""Services Konfiguration ist fehlgeschlagen.\n"
    fi

#Styles
    dir="../styles/"
    echo "[$(date)] ""Lösche Verzeichnis '$dir'.";
    rm -rf $dir/*
    if [ "$(ls -A $dir)" ]; then
         echo "[$(date)] ""Löschen ist fehlgeschlagen."
    else
        echo "[$(date)] ""Löschen war erfolgreich."
    fi

    echo "[$(date)] ""Starte Styles Konfiguration.";
    perl bin/06_createStyles.pl
    if [ "$(ls -A $dir)" ]; then
         echo "[$(date)] ""Styles Konfiguration war erfolgreich.\n"
    else
        echo "[$(date)] ""Styles Konfiguration ist fehlgeschlagen.\n"
    fi

#Themes
    dir="../themes/"
    echo "[$(date)] ""Lösche Verzeichnis '$dir'.";
    rm -rf $dir/*
    if [ "$(ls -A $dir)" ]; then
         echo "[$(date)] ""Löschen ist fehlgeschlagen."
    else
        echo "[$(date)] ""Löschen war erfolgreich."
    fi
    
    echo "[$(date)] ""Starte Themes Konfiguration.";
    perl bin/05_createThemes.pl
    if [ "$(ls -A $dir)" ]; then
         echo "[$(date)] ""Themes Konfiguration war erfolgreich.\n"
    else
        echo "[$(date)] ""Themes Konfiguration ist fehlgeschlagen.\n"
    fi
