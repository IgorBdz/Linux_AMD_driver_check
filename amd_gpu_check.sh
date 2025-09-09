#!/bin/bash

# Skrypt porownujacy pakiety Mesa i wyświetlający powiadomienie w KDE.
# (./amd_gpu_check.sh --test) wymusza powiadomienie (wymusza inne wartosci zmiennych).
# Przetestowany na Fedorze 42 z karta graficzna AMD.

# Opcjonalne opóźnienie przy autostarcie:
sleep 3

# Obsługa testu
test_mode=0
if [ "$1" == "--test" ]; then
    test_mode=1
fi

# Pakiety Mesa do porownania
all_mesa_pkgs="mesa-dri-drivers mesa-libGL mesa-libEGL mesa-vulkan-drivers"

updates=""

for pkg in $all_mesa_pkgs; do
    # Sprawdz czy pakiet jest zainstalowany
    if rpm -q $pkg >/dev/null 2>&1; then
        installed=$(rpm -q --qf "%{VERSION}-%{RELEASE}" $pkg)
    else
        installed="brak"
    fi

    # Pobierz wersje dostepna w repozytorium lub wymus w trybie testowym
    if [ $test_mode -eq 1 ]; then
        available="99.9.9-1.test"
    else
        available=$(dnf info $pkg 2>/dev/null | awk '/Version/ {v=$3} /Release/ {r=$3} END{if(v && r) print v "-" r}')
    fi

    # Jesli jest roznica lub pakiet brakujacy, dodaj do powiadomienia
    if [ -n "$available" ] && [ "$available" != "$installed" ]; then
        updates="$updates$pkg: $installed -> $available\n"
    fi
done

# Wyswietl powiadomienie w KDE, jesli sa aktualizacje
if [ -n "$updates" ]; then
    kdialog --title "Aktualizacja Mesa" --passivepopup "Dostępne aktualizacje pakietów Mesa:\n$updates" 15
fi
