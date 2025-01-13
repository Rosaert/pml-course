{-
EEN GEBRUIKER HEEFT EEN PERSPECTIEF NODIG OM MEE TE DOEN
Nu zou je verwachten dat de gebruiker (ook wel 'peer' genoemd) die je een rol hebt gegeven in Boodschappenlijst, 
daar op de één of andere manier wat van zou merken. Maar dat is niet zo.

De oorzaak daarvan is dat we nog niet hebben gemodelleerd dat Huisgenoot ook iets moet zien van Boodschappenlijst!
Deze rol heeft immers geen perspectief op Boodschappenlijst.
Dat gaan we nu veranderen.

OPDRACHT
Geef Huisgenoten een perspectief op Boodschappenlijst.
Je kunt je daarbij laten leiden door het perspectief van Boodschapper op Boodschappen.

Compileer het model en actualiseer het in gebruik genomen model.
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
        props (FirstName, LastName) verbs (Consult)
      perspective on Contacten
        props (FirstName, LastName) verbs (Consult)
    user Huisgenoten (relational) filledBy sys:TheWorld$PerspectivesUsers
    user Contacten = sys:TheWorld >> PerspectivesUsers