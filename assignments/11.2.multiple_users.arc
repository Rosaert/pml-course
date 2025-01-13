{-
USER ROLLEN
Als alles is gelukt, dan heb je gezien dat:
* het scherm voor Boodschappenlijst nu twee tabbladen heeft: één voor Boodschappen en één voor Huisgenoten en
* op het tabblad Huisgenoten een tabel te zien is.
Maar in de enige kolom in die tabel zie je een tekst zoals 'def:#kgtyafdq4j'. Wat is dat?
Het is de interne identifier van de instantie van de rol Huisgenoten die je hebt aangemaakt. MyContexts laat die zien omdat
er verder geen gegevens zijn over die Huisgenoot die het zou kunnen tonen.

Het is natuurlijk de bedoeling dat de Boodschapper een andere MyContexts gebruiker zou kunnen toevoegen in de rol van Huisgenoot.
Om daar naar toe te werken, voegen we eerst een lijst van alle bekende MyContexts gebruikers toe aan Boodschappenlijst.
Vervolgens maken we het mogelijk om een Huisgenoot toe te voegen door een gebruiker uit die lijst te selecteren.

OPDRACHT
1. Voeg aan Boodschappenlijst de volgende rol toe:

user Contacten = sys:TheWorld >> PerspectivesUsers

2. We willen we Huisgenoten vullen met gebruikers uit Contacten. Dat maken we kenbaar door achter user Huisgenoten toe te voegen: 

  filledBy sys:TheWorld$PerspectivesUsers.

3. Geef Boodschapper een perspectief op Contacten. Je hoeft geen rol-werkwoorden in dit perspectief op te nemen.

4. Omdat PerspectivesUsers de properties FirstName en LastName hebben, èn we hebben gezegd dat een Huisgenoot ook een PerspectivesUser is,
  mag je het mogelijk maken om die properties te raadplegen. Neem ze daarom op in het perspectief van Boodschapper op Contacten (gebruik werkwoord Consult).

5. Compileer het model en actualiseer het in gebruik genomen model. 
    Ga naar Boodschappenlijst en kijk of je de tab Contacten ziet. 
    Klik op de tab en kijk of je een lijst van MyContexts gebruikers ziet.
    Selecteer er één (niet jezelf; bij voorkeur de peer die je hebt opgezet om te testen) en sla ctrl-c aan. Deze rol verschijnt nu op het clipboard.
    Klik op de tab Huisgenoten.
    Klik op de + button om een nieuwe huisgenoot instantie toe te voegen.
    Merk op dat een clipboard button verschijnt. Beweeg de muis erboven en lees de popup-tekst.
    Klik op de clipboard button en de instantie van de geselecteerde gebruiker vult nu de nieuwe Huisgenoten instantie.
    Je ziet nu zijn voor- en achternaam.

Ga naar de volgende opdracht.
-}


-------------------------------------------------------------------------------
-- MODEL TOT NOG TOE
-------------------------------------------------------------------------------
-- Firstname Lastname. mm/dd/yyyy.
domain model://joopringelberg.nl#Boodschappenlijst
  use bl for model://joopringelberg.nl#Boodschappenlijst

  -------------------------------------------------------------------------------
  ---- PREAMBULE
  -------------------------------------------------------------------------------
  state ReadyToInstall = exists sys:PerspectivesSystem$Installer
    on entry
      do for sys:PerspectivesSystem$Installer
        letA
          app <- create context BoodschappenlijstenBeheer
          start <- create role StartContexts in sys:MySystem
        in
          bind_ app >> extern to start
          Name = "Boodschappen lijsten" for start

  aspect user sys:PerspectivesSystem$Installer  
  -------------------------------------------------------------------------------
  ---- END OF PREAMBULE
  -------------------------------------------------------------------------------
  
  case BoodschappenlijstenBeheer
    aspect sys:RootContext
    user Beheerder = sys:SocialMe
      perspective on Boodschappenlijsten
        only (CreateAndFill, Remove)
        props (Datum) verbs (Consult, SetPropertyValue)
    context Boodschappenlijsten (relational) filledBy Boodschappenlijst
      property Datum (Date)

  case Boodschappenlijst
    thing Boodschappen (relational)
      property Naam (String)
      property Aantal (Number)
    user Boodschapper = sys:SocialMe
      perspective on Boodschappen
        props (Naam, Aantal) verbs (Consult, SetPropertyValue)
        only (Create, Remove)
      perspective on Huisgenoten
        only (Create, Remove)
    user Huisgenoten (relational)