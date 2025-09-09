Skrypt porownujacy zainstalowane pakiety sterownikow Mesa kart graficznych AMD na linuxie z najnowszymi dostepnymi w repozytorium, zglaszajacy powiadomienie w KDE zawierajace informacje o wersjach, w przypadku roznicy wersji zainstalowanej i dostepnej.

Przeznaczony do pracy w roli serwisu w autostarcie, wewnatrz skryptu instrukcja 'sleep' ustawiona domyslnie na 3 sekundy, aby system mogl polaczyc sie z internetem przed jego wykonaniem i pobrac informacje o najnowszych dostepnych wersjach z repozytorium.

Przetestowany na systemie Fedora 42.

Tryb testowy wymusza ustalenie roznych wartosci dla zmiennych (wersji zainstalowanej, wersji dostepnej), triggerujac wykonanie instrukcji warunkowej dla scenariusza gdy wersje sa rozne, wymuszajac wyswietlenie powiadomienia w KDE (test:'./amd_gpu_check.sh --test').

W przyszlosci planuje udoskonalenie logiki testu:
Teraz:
- Ustala stale wartosci dla zmiennych, wymuszajac scenariusz roznych wersji sterownikow,
- wyswietla powiadomienie o roznicach wersji.
Perspektywicznie:
- W trybie testu, wartosci zmiennych zainstalowanych i dostepnych wersji pobierane beda u zrodla, jak w trybie produkcyjnym,
- wyswiietli w powiadomieniu wartosci wersji w kazdym przypadku - gdy sa rozne, rowne sobie, jest null. 
