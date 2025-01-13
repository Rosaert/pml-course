{-
HET MODEL VERWIJDEREN EN WEER IN GEBRUIK NEMEN
Het model voorziet er nu in dat als het ergens wordt geïnstalleerd, de BoodschappenlijstenBeheer instantie de geïndexeerde naam 'BoodschappenApp' krijgt.
Helaas verandert het bestaande installaties niet! De geïndexeerde naam wordt geregistreerd als je een context aanmaakt.
Om dat te bewerkstelligen, moet je het model verwijderen en opnieuw installeren.
Maar voordat je kunt verwijderen, moeten we ervoor zorgen dat een en ander wordt opgeruimd.
Kijk eens naar de pre-ambule en let op deze regels:

          app <- create context BoodschappenlijstenBeheer
          start <- create role StartContexts in sys:MySystem

Je ziet dat de beheer-context wordt aangemaakt, en ook een instantie van 'StartContexts'. Je heb al gezien dat op de tab "Start contexts" de boodschappen app
erbij is gekomen. Dat komt door de tweede regel.
Maar als je het model verwijdert, blijft de instantie van 'StartContexts' bestaan. En dat willen we niet.
Daarom moeten we in de pre-ambule een aantal regels toevoegen die ervoor zorgen dat die instantie wordt verwijderd.

OPDRACHT
Voeg onderstaande regels aan de pre-ambule toe. Ik leg ze niet in detail, dat komt later. Neem ze gewoon over:

  on exit
    do for sys:PerspectivesSystem$Installer
      letA
        indexedcontext <- filter sys:MySystem >> IndexedContexts with filledBy (bl:BoodschappenApp >> extern)
        startcontext <- filter sys:MySystem >> StartContexts with filledBy (bl:BoodschappenApp >> extern)
      in
        remove context indexedcontext
        remove role startcontext

Zorg ervoor dat 'on exit' IN DEZELFDE KOLOM staat als 'state ReadyToInstall...' (dat is één keer indenteren).

Actualiseer het in gebruik genomen model.
Ga naar de systeem context. Klik op de tab "Manage new models".
Verwijder het model Boodschappenlijst.
Als alles goed is gegaan, zie je onder "Start contexts" niet langer "Boodschappen lijsten". Het model is weg.
Mocht je een peer installatie hebben waarin je ook al het model hebt geïnstalleerd, dan moet je dat daar ook verwijderen.

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
    indexed bl:BoodschappenApp
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
      perspective on Boodschappen
        props (Naam, Aantal) verbs (Consult, SetPropertyValue)
        only (Create, Remove)
      perspective on Boodschapper
        props (FirstName, LastName) verbs (Consult)
      perspective on Huisgenoten 
        props (FirstName, LastName) verbs (Consult)
    user Contacten = sys:TheWorld >> PerspectivesUsers