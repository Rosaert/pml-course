{-
COMMENTS
Je heb intussen wel opgemerkt dat een .arc file commentaarteksten kan bevatten. 
Alle instructies die je tot nog toe hebt gekregen, zijn in de vorm van commentaarteksten.
Een multi-line commentaar begint met {-, en eindigt met -}.
Alle tekst op een regel na '--' wordt door de compiler genegeerd.

OPDRACHT
Voeg een commentaar toe aan je modeltekst in boodschappenlijst.arc. Schrijf daarin je eigen naam en de datum van vandaag.

Omdat een domain een context is (van het kind domain), heb je in feite je eerste context al gemaakt.
Maar nu is het tijd om in het domein zelf te duiken. Ik geef je een paar basisbegrippen:
  - het sleutelwoord 'case' wordt vaak gebruikt om een nieuwe context te definiëren. Het is een andere kind dan 'domain'.
  - het sleutelwoord 'thing' wordt gebruikt om een roltype te definiëren. Een rol is altijd ingebed in een context.
  - het sleutelwoord 'user' definieert een andere rol kind, namelijk een gebruiker.

Types zijn altijd ingebed in andere types (op het domain zelf na). Inbedding geef je aan in een modeltekst met behulp van 
indentering met spaties (nooit met tabs!). Het is echter goed mogelijk dat je editor een instelling heeft die tabs vervangt door spaties.

Tik nu in je eigen modeltekst een paar regels om aan te geven dat een boodschappenlijst bestaat uit boodschappen en dat 
er een gebruiker is die de boodschappenlijst maakt. Daarbij gebruik je case, thing en user.

Bewaar het bestand en upload het in versie 1.0 van je manifest. Onder de modeltekst verschijnt feedback. 
Lees die en open de volgende assignment.
{-
-}

-------------------------------------------------------------------------------
-- MODEL TOT NOG TOE
-------------------------------------------------------------------------------
domain model://joopringelberg.nl#Boodschappenlijst_jouwnaam