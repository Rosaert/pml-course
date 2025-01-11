{-
Je kunt nu een Boodschappenlijst maken en openen. Maar in Boodschappenlijst speelt hetzelfde probleem als we 
in BoodschappenlijstenBeheer tegenkwamen: de rol Boodschappen is functioneel, terwijl we meerdere boodschappen willen kunnen toevoegen.

OPDRACHT
Vervander de rol 'Boodschappen' in een 'relationele' rol.

Compileer het model, actualiseer het in gebruik genomen model en maak nu in een Boodschappenlijst twee Boodschappen aan: brood en melk.

OPDRACHT
De eerste instanties van de rol Boodschappen in BoodschappenlijstenBeheer zijn niet gevuld met een context. 
Je hebt er niets aan. Verwijder ze (selecteer en klik op de backspace toets).

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
    thing Boodschappen
      property Naam (String)
      property Aantal (Number)
    user Boodschapper = sys:SocialMe
      perspective on Boodschappen
        props (Naam, Aantal) verbs (Consult, SetPropertyValue)
        only (Create, Remove)