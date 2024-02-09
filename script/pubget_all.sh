#!/bin/bash

# Caminho para o diretório que contém todos os packages
DIRECTORY=$(pwd)

cd "$DIRECTORY"
cd micro_apps/

  echo "Processando micro_apps:"
for d in */ ; do
    echo "Processando package: $d"
    cd "$d"

    # Executar flutter pub cache repair
    echo "Executando flutter clean..."
    flutter clean

    # Deletar o arquivo pubspec.lock, se existir
    if [ -f "pubspec.lock" ]; then
        echo "Deletando pubspec.lock..."
        rm pubspec.lock
    fi

    # Executar flutter pub upgrade
    echo "Executando flutter pub upgrade..."
    flutter pub upgrade

    # Voltar para o diretório principal
    cd ..

    echo "Package $d processado."
done

cd "$DIRECTORY"
cd ..
cd base_app/

  echo "Processando base_app:"

    # Executar flutter pub cache repair
    echo "Executando flutter clean..."
    flutter clean

    # Deletar o arquivo pubspec.lock, se existir
    if [ -f "pubspec.lock" ]; then
        echo "Deletando pubspec.lock..."
        rm pubspec.lock
    fi

    # Executar flutter pub upgrade
    echo "Executando flutter pub upgrade..."
    flutter pub upgrade

    # Voltar para o diretório principal
    cd ..

    echo "Package $d processado."


echo "Todos os packages foram processados."


