{-
Je hebt ongetwijfeld gemerkt dat de Perspectives Compiler een foutmelding heeft gegeven, 
die erop neerkomt dat je domain naam niet overeenkomst met de manifest naam. Dat zal je waarschijnlijk verbazen, zeker als 
je precies hebt ingetikt wat de opdracht was.
Wat is hier aan de hand? 
In MyContexts willen we dat je aan de naam van een type kunt zien wáár je de definitie van dat type kunt vinden, op het internet.
Met andere woorden: je moet weten waar het model is opgeslagen: in welke Perspectives Repository en onder welke naam.
Je hebt een manifest gemaakt in de repository joopringelberg_nl met de naam `Boodschappenlijst_jouwnaam`.
Het domein joopringelberg.nl is geregistreerd bij de Stichting Internet Domeinregistratie Nederland (SIDN). Dat betekent dat 
je vanaf elke computer in de wereld de server kunt vinden die met dat domein is verbonden.
We maken daarvan gebruik in Perspectives door de naam van de repository te gebruiken als een soort URL. Preciezer: net zoals 
je in een browser https://joopringelberg.nl intikt om de website van Joop Ringelberg te vinden, zo gebruik je in Perspectives 
model://joopringelberg.nl#Boodschappenlijst_jouwnaam om het manifest te vinden waarin het model is beschreven.

De opbouw is dus:
  - het schema: model://
  - de domeinnaam: joopringelberg.nl
  - het hekje: #
  - de naam van het manifest: Boodschappenlijst_jouwnaam

Tik nu in je boodschappenlijst.arc:
  
  domain model://joopringelberg.nl#Boodschappenlijst_jouwnaam

Bewaar het bestand en upload het in versie 1.0 van je manifest. Onder de modeltekst verschijnt feedback. 
Lees die en open de volgende assignment.
-}