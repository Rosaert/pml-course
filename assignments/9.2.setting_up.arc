{-
ROOT CONTEXTEN
Het zal je zijn opgevallen dat de compiler een foutmelding geeft. De strekking daarvan is dat je zou proberen om 
een instantie van BoodschappenlijstenBeheer aan te maken, maar dat type geen 'RootContext' is.

Ik heb eerder aangegeven dat elke context en rol is ingebed in een context. Toen had ik het over types, maar hetzelfde geldt voor instanties.
Als je een instantie van een context maakt, moet je aangeven in welke context die instantie moet worden aangemaakt.
Oftewel, je moet een context altijd inbedden in een andere context - door een contextrol te gebruiken (een rol met sleutelwoord 'context').
Dat doen we in de preambule inderdaad niet, althans niet in één keer. 
Het gaat te ver om deze kwestie hier in detail uit te leggen.
In plaats daarvan zullen we aangeven dat BoodschappenlijstenBeheer een RootContext is. Dat is een context die niet in een andere context is ingebed.

OPDRACHT
Voeg de volgende regel toe direct onder de regel 'case BoodschappenlijstenBeheer':

  aspect sys:RootContext

Daarmee geef je aan dat BoodschappenlijstenBeheer een RootContext is. 

Upload je model. Lees de feedback. Ga naar de volgende opdracht.
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
    user Boodschapper = sys:SocialMe
      perspective on Boodschappen
        props (Naam, Aantal) verbs (Consult, SetPropertyValue)
        only (Create, Remove)