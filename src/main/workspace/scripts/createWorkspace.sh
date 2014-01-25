#!/bin/sh

#Löschen von JDBC
    dir="../jdbc/"
    echo "Lösche Verzeichnis '$dir'.";
    rm -rf $dir/*
    if [ "$(ls -A $dir)" ]; then
         echo "Löschen ist fehlgeschlagen.\n"
    else
        echo "Löschen war erfolgreich.\n"
    fi

#Löschen von Layers
    dir="../layers/"
    echo "Lösche Verzeichnis '$dir'.";
    rm -rf $dir/*
    if [ "$(ls -A $dir)" ]; then
         echo "Löschen ist fehlgeschlagen.\n"
    else
        echo "Löschen war erfolgreich.\n"
    fi

#Löschen von Services
    dir="../services/"
    echo "Lösche Verzeichnis '$dir'.";
    rm -rf $dir/*
    if [ "$(ls -A $dir)" ]; then
         echo "Löschen ist fehlgeschlagen.\n"
    else
        echo "Löschen war erfolgreich.\n"
    fi

#Löschen von Styles
    dir="../styles/"
    echo "Lösche Verzeichnis '$dir'.";
    rm -rf $dir/*
    if [ "$(ls -A $dir)" ]; then
         echo "Löschen ist fehlgeschlagen.\n"
    else
        echo "Löschen war erfolgreich.\n"
    fi

#Löschen von Themes
    dir="../themes/"
    echo "Lösche Verzeichnis '$dir'.";
    rm -rf $dir/*
    if [ "$(ls -A $dir)" ]; then
         echo "Löschen ist fehlgeschlagen.\n"
    else
        echo "Löschen war erfolgreich.\n"
    fi

perl bin/01_createJdbc.pl
perl bin/02_createWfs.pl
perl bin/04_createLayer.pl
perl bin/05_createThemes.pl
perl bin/06_createStyles.pl
perl bin/07_createWms.pl
perl bin/08_createMetada.pl
