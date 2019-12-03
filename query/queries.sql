-- Number of team and players per split, league
SELECT GameMetadata.split, GameMetadata.league, COUNT(DISTINCT(Player.name)) as Players, COUNT(DISTINCT(Player.team)) as Teams
FROM Player
INNER JOIN Team ON Player.gameId=Team.gameId AND Player.platformId=Team.platformId AND Player.side=Team.side
INNER JOIN GameMetadata ON Team.gameId=GameMetadata.gameId AND Team.platformId=GameMetadata.platformId
GROUP BY GameMetadata.split, GameMetadata.league;

-- Players per team from World Championship
SELECT Player.team, COUNT(DISTINCT(Player.name)) AS "Amount", GROUP_CONCAT(DISTINCT(Player.name)) AS "Players"
FROM Player
INNER JOIN Team ON Player.gameId=Team.gameId AND Player.platformId=Team.platformId AND Player.side=Team.side
INNER JOIN GameMetadata ON Team.gameId=GameMetadata.gameId AND Team.platformId=GameMetadata.platformId
WHERE GameMetadata.league="WC"
GROUP BY Player.team
ORDER BY 2 DESC;

-- Stats per player
-- Players per team from World Championship
SELECT
  MAX(Player.team) as team,
  Player.name,
  MAX((Player.participantId-1)%5) as roleId,
  COUNT(*) as gamesPlayed,
  AVG(Team.win) as winRate,
  AVG(Game.duration/60) as gameDurationAVG,
  AVG(kills/(Game.duration/60)) as killsPM,
  AVG(deaths/(Game.duration/60)) as deathsPM,
  AVG(assists/(Game.duration/60)) as assistsPM,
  AVG((assists+kills)/(Game.duration/60)) as kpPM,
  AVG(totalDamageDealt/(Game.duration/60)) as dmgPM,
  AVG(damageDealtToTurrets/(Game.duration/60)) as turretDmgPM,
  AVG(damageDealtToObjectives/(Game.duration/60)) as turretDmgPM,
  AVG(totalDamageDealtToChampions/(Game.duration/60)) as champDmgPM,
  AVG(magicDamageDealtToChampions/totalDamageDealtToChampions) as magicDmgPART,
  AVG(physicalDamageDealtToChampions/totalDamageDealtToChampions) as physicalDmgPART,
  AVG(totalHeal/(Game.duration/60)) as healPM,
  AVG(visionScore/(Game.duration/60)) as visionPM,
  AVG(timeCCingOthers/(Game.duration)) as ccPART,
  AVG(goldEarned/(Game.duration/60)) as goldPM,
  AVG(goldEarned/(Game.duration/60)) as totalDamageTakenPM,
  AVG(turretKills) as turretsAVG,
  AVG(Player.inhibitorKills/(Game.duration/60)) as inhibPM,
  AVG((totalMinionsKilled+neutralMinionsKilled)/(Game.duration/60)) as csPM,
  AVG((neutralMinionsKilled)/(totalMinionsKilled+neutralMinionsKilled)) as jglPART,
  AVG((neutralMinionsKilledEnemyJungle)/(neutralMinionsKilled)) as counterJglPART,
  AVG(wardsPlaced/(Game.duration/60)) as wardPlacedPM,
  AVG(wardsKilled/(Game.duration/60)) as wardsKilledPM,
  AVG(firstBloodKill) as firstBloodAVG,
  AVG(firstBloodKill+firstBloodAssist) as firstBloodPresenceAVG
FROM Player
INNER JOIN Team ON Player.gameId=Team.gameId AND Player.platformId=Team.platformId AND Player.side=Team.side
INNER JOIN GameMetadata ON Team.gameId=GameMetadata.gameId AND Team.platformId=GameMetadata.platformId
INNER JOIN Game ON Team.gameId=Game.gameId AND Team.platformId=Game.platformId
WHERE GameMetadata.league="WC"
GROUP BY Player.name
HAVING COUNT(*)>=3
ORDER BY winRate DESC;
