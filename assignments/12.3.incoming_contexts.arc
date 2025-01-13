{-
EEN BINNENKOMENDE CONTEXT INHANGEN
Even recapituleren:
* als een peer een Boodschappenlijst binnenkrijgt, werd die nog niet in zijn eigen beheer-instantie gehangen.
* we hebben inmiddels de beheer-instantie geïndexeerd met de naam bl:BoodschappenApp.
* en we hebben ervoor gezorgd (door het model weg te gooien en opnieuw te installeren) dat in onze installaties die naam ook toegekend is aan de beheer-instantie.

Nu moeten we ervoor zorgen dat een binnenkomende Boodschappenlijst ook in de eigen beheer-instantie wordt gehangen. Opnieuw moet je een stukje code toevoegen dat je 
waarschijnlijk nog niet helemaal begrijpt.

OPDRACHT
Voeg direct onder de declaratie van boodschappenlijst (d.w.z. de zin 'case Boodschappenlijst') de volgende regels toe (met ten opzichte van 'case' een indentatie):

    external
      state AddIncoming = not exists filter bl:BoodschappenApp with filledBy origin
        perspective of Boodschapper
          perspective on extern >> binder Boodschappenlijsten
            only (Create, Fill, CreateAndFill)
        on entry
          do for Boodschapper
            bind origin to Boodschappenlijsten in bl:BoodschappenApp

Informele toelichting: als er nog geen Boodschappenlijst in de beheer-instantie zit die gevuld is door de binnenkomende context, dan moet de Boodschapper dat doen.
En dat kan hij doen door de een instantie van Boodschappenlijsten in de beheer-instantie te maken en te vullen met een Boodschappenlijst.
Hij heeft daar wel een geschikt perspectief voor nodig, maar dat hoeft ie alleen maar in deze toestand te hebben.

Compileer het model en actualiseer het in gebruik genomen model, in je eigen installatie en die van de peer.

Maak dan in je eigen installatie een nieuwe Boodschappenlijst aan.
Open hem en voeg de peer toe in de rol Huisgenoten.
Voeg ook een boodschap toe en geef die een naam.
Als alles is gelukt, zie je nu in de peer-installatie de lijst en de boodschap verschijnen.
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
  on exit
    do for sys:PerspectivesSystem$Installer
      letA
        indexedcontext <- filter sys:MySystem >> IndexedContexts with filledBy (bl:BoodschappenApp >> extern)
        startcontext <- filter sys:MySystem >> StartContexts with filledBy (bl:BoodschappenApp >> extern)
      in
        remove context indexedcontext
        remove role startcontext

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
    external
      state AddIncoming = not exists filter bl:BoodschappenApp with filledBy origin
        perspective of Boodschapper
          perspective on extern >> binder Boodschappenlijsten
            only (Create, Fill, CreateAndFill)
        on entry
          do for Boodschapper
            bind origin to Boodschappenlijsten in bl:BoodschappenApp
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