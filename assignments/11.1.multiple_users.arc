{-
MEERDERE GEBRUIKERS
Het model functioneert nu als een persoonlijk boodschappenlijstje. Iedereen met een MyContexts installatie kan het gebruiken, maar 
die gebruikers hebben elk hun eigen lijstjes en er is geen onderlinge interactie.

Nu gaan we het model aanpassen voor een situatie van meerdere mensen die een gezamenlijk huishouden voeren, zoals een gezin of een studentenhuis.
We beschouwen de rol Boodschapper als degene die de boodschappen doet. Daarnaast maken we een nieuwe rol aan voor huisgenoten die wel items op 
de lijst kunnen zetten, maar niet de boodschappen doen. We noemen deze rol Huisgenoten.

CONVENTIE: een relationele rol geven we een naam die een meervoud aangeeft.

TWEEDE TESTINSTALLATIE
Het is handig, als je een tweede installatie maakt die je kunt gebruiken als peer om mee te testen.
Ik leg het hier niet in detail uit, maar je kunt in Chrome een profile aanmaken en daarin opnieuw installeren.
Je moet wel die tweede installatie verbinden met je ontwikkelinstallatie, door een uitnodiging te sturen.
In het vervolg ga ik ervan uit dat je dat gedaan hebt. Als ik het over 'een peer' heb, bedoel ik die tweede installatie.

OPDRACHT
Maak de relationele rol Huisgenoten aan in Boodschappenlijst.
Geef Boodschapper een perspectief op Huisgenoten waarmee hij een Huisgenoot kan toevoegen en verwijderen.

Compileer het model en actualiseer het in gebruik genomen model.
Voeg aan je boodschappenlijst een Huisgenoot toe.
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