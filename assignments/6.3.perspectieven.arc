{-
PERSPECTIEVEN
Mogelijkerwijs kreeg je een foutmelding bij je vorige opdracht. 
Een veelgemaakte fout is dat je de properties in het perspectief niet van elkaar hebt gescheiden met een komma.

OPDRACHT
Neem het model hieronder over. Upload het. De compiler moet het foutloos verwerken.
Verwijder dan de komma tussen Naam en Aantal. Bewaar je bestand en upload het. Lees de feedback. Merk op dat de compiler
niet zegt dat je een komma moet toevoegen. In plaats daarvan zegt hij dat hij op deze plek het einde van de lijst properties had verwacht.
Hetzelfde zou gebeuren als je de komma tussen Consult en SetPropertyValue zou verwijderen.

TYPES EN INSTANTIES
Op dit punt aangekomen moeten we even stilstaan bij het verschil tussen 'typen' en 'instanties'.
Een rol als Boodschappen is een type. Maar, bijvoorbeeld, 'brood' zou een instantie van het type Boodschappen kunnen zijn. Of 'melk'. 
In MyContexts noemen we een concreet ding zoals een brood een 'instantie' van het type Boodschappen. Die instantie heeft eigenschappen, zoals Naam en Aantal.
Waar verwarring mogelijk is zullen we 'rol' gebruiken voor het type en 'instantie' voor één van de voorbeelden van dat type.

ROL-WERKWOORDEN
Tot nog toe hebben we alleen werkwoorden gezien waarmee je de properties van een instantie kunt veranderen.
Nu voegen we werkwoorden toe waarmee je instanties kunt toevoegen en verwijderen.
Voorlopig werken we alleen maar met de werkwoorden Create, Remove en Delete. Het verschil tussen de laatste twee is dat Remove één instantie verwijdert 
en Delete alle instanties van een type.
Je hebt daarvoor het sleutelwoord 'only' nodg, gevolgd door een lijst tussen haakjes van de werkwoorden die je wilt toestaan, gescheiden door komma's.

OPDRACHT 
Zorg ervoor dat de Boodschapper instanties van Boodschappen kan toevoegen en stuk voor stuk kan verwijderen.

Corrigeer je bestand en upload het. Ga naar de volgende opdracht.

-}
-------------------------------------------------------------------------------
-- MODEL TOT NOG TOE
-------------------------------------------------------------------------------
-- Firstname Lastname. mm/dd/yyyy.
domain model://joopringelberg.nl#Boodschappenlijst

  case Boodschappenlijst
    thing Boodschappen
      property Naam (String)
      property Aantal (Number)
    user Boodschapper
      property Naam (String)
      perspective on Boodschappen
        props (Naam, Aantal) verbs (Consult, SetPropertyValue)