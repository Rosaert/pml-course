{-
SCHERMEN, INSTANTIES EN ROLLEN
(Als je model niet zonder problemen compileert, neem dan de onderstaande versie over en probeer het opnieuw.)

In een model beschrijven we types. Maar als je MyContexts opent, heb je vooral te maken met instanties. 
Elk scherm geeft precies één context-instantie weer (en de rollen in die context). Je kunt een alleen een context openen als je er een rol in hebt.

Dus je kunt BoodschappenlijstenBeheer alleen openen als je de rol Beheerder hebt.
En je kunt een Boodschappenlijst alleen openen als je de rol Boodschapper hebt.

Hoe krijg je die rollen?

STANDAARD ROLLEN
Als je MyContexts installeert, geef je impliciet opdracht om namens jou al een aantal context-instanties aan te maken.
In die instanties maakt het programma dan direct een rol voor je. Zo ontstaat SocialMe.

In ons model hebben we aangegeven dat de Beheerder-rol en de Boodschapper-rol hetzelfde zijn als de SocialMe-rol. Kortom,
je hebt bij verstek een rol in de contexten BoodschappenlijstenBeheer en Boodschappenlijst.

PREFIXES
Je moest 'sys:SocialMe' intikken. Het 'sys' is een prefix. Het is een afkorting voor 'model://perspectives.domains#System', 
het basissysteem van MyContexts. Dus 'sys:SocialMe' betekent 'model://perspectives.domains#System$SocialMe'. 
Die hele mond vol had je moeten intikken in het model als we geen prefixes hadden.

Er is een aantal standaard prefixes dat je altijd kunt gebruiken. 'sys' is er een van. Je kunt ook een eigen prefix definiëren.
Tik onder de regel 'domain model://joopringelberg.nl#Boodschappenlijst' de volgende regel:

use bl for model://joopringelberg.nl#Boodschappenlijst

Upload je bestand. Lees de feedback. Ga naar de volgende opdracht.

-}

-------------------------------------------------------------------------------
-- MODEL TOT NOG TOE
-------------------------------------------------------------------------------
-- Firstname Lastname. mm/dd/yyyy.
domain model://joopringelberg.nl#Boodschappenlijst

  case BoodschappenlijstenBeheer
    user Beheerder = sys:SocialMe
      perspective on Boodschappenlijsten
        only (Create, Remove)
        props (Datum) verbs (Consult, SetPropertyValue)
    context Boodschappenlijsten filledBy Boodschappenlijst
      property Datum (Date)

  case Boodschappenlijst
    thing Boodschappen
      property Naam (String)
      property Aantal (Number)
    user Boodschapper
      perspective on Boodschappen
        props (Naam, Aantal) verbs (Consult, SetPropertyValue)
        only (Create, Remove)