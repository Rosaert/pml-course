{-
VERBINDING TUSSEN CONTEXTEN
In het model zoals we dat tot nog toe hebben opgebouwd, hebben we twee contexten: Boodschappenlijst en BoodschappenlijstenBeheer.
Misschien heb je niet precies hetzelfde gemaakt als wat hieronder staat. Bestudeer het model en probeer te begrijpen wat er staat.
BoodschappenlijstenBeheer is gemaakt met precies de taalmiddelen die we tot nog toe hebben behandeld.

Maar er ontbreekt iets aan het model. Namelijk: wat is de relatie tussen beide contexten? Het ligt voor de hand dat de rol BoodschappenlijstenBeheer$BoodschappenLijsten 
(merk op dat we hier de gedeeltelijk gekwalificeerde naam van de rol gebruiken) een relatie heeft met de case Boodschappenlijst.

Op dit punt aangekomen maak je kennis met een derde soort rol, de 'contextrol'. Je beschrijft een contextrol met het sleutelwoord 'context'. 

OPDRACHT
Verander in je eigen bestand de rol Boodschappenlijsten in een contextrol (vervang thing door context).

ROLLEN VULLEN ROLLEN
Weliswaar hebben we nu een contextrol, maar de relatie met Boodschappenlijst is nog niet gelegd. We moeten de contextrol vullen met de rol Boodschappenlijst.
Daar heb je het sleutelwoord 'filledBy' voor nodig.

OPDRACHT
Schrijf achter 'context Boodschappenlijsten' de tekst 'filledBy Boodschappenlijst'.
Upload je bestand. Lees de feedback. Ga naar de volgende opdracht.

-}

-------------------------------------------------------------------------------
-- MODEL TOT NOG TOE
-------------------------------------------------------------------------------
-- Firstname Lastname. mm/dd/yyyy.
domain model://joopringelberg.nl#Boodschappenlijst

  case BoodschappenlijstenBeheer
    user Beheerder
      perspective on Boodschappenlijsten
        only (Create, Remove)
        props (Datum) verbs (Consult, SetPropertyValue)
    thing Boodschappenlijsten
      property Datum (Date)

  case Boodschappenlijst
    thing Boodschappen
      property Naam (String)
      property Aantal (Number)
    user Boodschapper
      property Naam (String)
      perspective on Boodschappen
        props (Naam, Aantal) verbs (Consult, SetPropertyValue)
        only (Create, Remove)