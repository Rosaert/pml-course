{-
WAAROM KAN IK GEEN BOODSCHAPPENLIJST OPENEN?
Hoewel je een instantie van de rol Boodschappenlijsten kunt aanmaken, wordt er niet meteen een instantie van de context Boodschappenlijst aangemaakt.
Dat komt vanwege de rol-werkwoorden die we in het perspectief van de Beheerder hebben opgenomen:

      perspective on Boodschappenlijsten
        only (Create, Remove)

Create betekent dat je een instantie van de rol kunt aanmaken, maar niet van de context die die rol kan vullen. 

OPDRACHT
Vervang het werkwoord Create door het werkwoord CreateAndFill.

Compileer het model, actualiseer het in gebruik genomen model en maak nu een nieuwe Boodschappenlijst aan.
Ga nu naar de volgende opdracht.
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
        only (Create, Remove)
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