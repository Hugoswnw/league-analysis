
START TRANSACTION;

CREATE TABLE `GameMetadata` (
  `gameId` int(11) UNSIGNED NOT NULL,
  `platformId` varchar(255) DEFAULT NULL,
  `league` varchar(255) DEFAULT NULL,
  `split` varchar(255) DEFAULT NULL,
  `week` varchar(255) DEFAULT NULL,
  `nogame` varchar(255) DEFAULT NULL) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `GameMetadata`
  ADD PRIMARY KEY `gamemetadata_id` (`platformId`,`gameId`) USING BTREE;

CREATE TABLE `Game` (
  `gameId` int(11) UNSIGNED NOT NULL,
  `platformId` varchar(255) NOT NULL,
  `mode` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `duration` bigint(11) DEFAULT NULL,
  `created` bigint(11) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `patch` varchar(255) DEFAULT NULL,
  `seasonId` int(11) DEFAULT NULL,
  `mapId` int(11) DEFAULT NULL,
  `queueId` int(11) DEFAULT NULL) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `Game`
  ADD PRIMARY KEY `game_id` (`platformId`,`gameId`) USING BTREE;


CREATE TABLE `Team` (
  `gameId` int(11) UNSIGNED NOT NULL,
  `platformId` varchar(255) NOT NULL,
  `side` ENUM('BLU', 'RED') NOT NULL,
  `win` int(11) DEFAULT NULL,
  `firstBlood` int(11) DEFAULT NULL,
  `firstTower` int(11) DEFAULT NULL,
  `firstInhibitor` int(11) DEFAULT NULL,
  `firstBaron` int(11) DEFAULT NULL,
  `firstDragon` int(11) DEFAULT NULL,
  `firstRiftHerald` int(11) DEFAULT NULL,
  `towerKills` int(11) DEFAULT NULL,
  `inhibitorKills` int(11) DEFAULT NULL,
  `baronKills` int(11) DEFAULT NULL,
  `dragonKills` int(11) DEFAULT NULL,
  `riftHeraldKills` int(11) DEFAULT NULL) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `Team`
  ADD PRIMARY KEY `team_id` (`platformId`,`gameId`,`side`) USING BTREE;
CREATE INDEX `ix_team_game` ON `Team` (`platformId`,`gameId`);

CREATE TABLE `Ban` (
  `gameId` int(11) UNSIGNED NOT NULL,
  `platformId` varchar(255) NOT NULL,
  `side` ENUM('BLU', 'RED') NOT NULL,
  `championId` int(11) DEFAULT NULL,
  `pickTurn` int(11) NOT NULL) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `Ban`
  ADD PRIMARY KEY `ban_id` (`platformId`,`gameId`,`side`, `pickTurn`) USING BTREE;
CREATE INDEX `ix_ban_team` ON `Ban` (`platformId`,`gameId`,`side`);

CREATE TABLE `Player` (
  `gameId` int(11) UNSIGNED NOT NULL,
  `platformId` varchar(255) NOT NULL,
  `side` ENUM('BLU', 'RED') NOT NULL,
  `participantId` int(11) NOT NULL,
  `rawname` varchar(255) DEFAULT NULL,
  `team` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `championId` int(11) DEFAULT NULL,
  `summonerSpell1` int(11) DEFAULT NULL,
  `summonerSpell2` int(11) DEFAULT NULL,
  `win` int(11) DEFAULT NULL,
  `item0` int(11) DEFAULT NULL,
  `item1` int(11) DEFAULT NULL,
  `item2` int(11) DEFAULT NULL,
  `item3` int(11) DEFAULT NULL,
  `item4` int(11) DEFAULT NULL,
  `item5` int(11) DEFAULT NULL,
  `item6` int(11) DEFAULT NULL,
  `kills` int(11) DEFAULT NULL,
  `deaths` int(11) DEFAULT NULL,
  `assists` int(11) DEFAULT NULL,
  `largestKillingSpree` int(11) DEFAULT NULL,
  `largestMultiKill` int(11) DEFAULT NULL,
  `killingSprees` int(11) DEFAULT NULL,
  `longestTimeSpentLiving` int(11) DEFAULT NULL,
  `doubleKills` int(11) DEFAULT NULL,
  `tripleKills` int(11) DEFAULT NULL,
  `quadraKills` int(11) DEFAULT NULL,
  `pentaKills` int(11) DEFAULT NULL,
  `unrealKills` int(11) DEFAULT NULL,
  `totalDamageDealt` int(11) DEFAULT NULL,
  `magicDamageDealt` int(11) DEFAULT NULL,
  `physicalDamageDealt` int(11) DEFAULT NULL,
  `trueDamageDealt` int(11) DEFAULT NULL,
  `largestCriticalStrike` int(11) DEFAULT NULL,
  `totalDamageDealtToChampions` int(11) DEFAULT NULL,
  `magicDamageDealtToChampions` int(11) DEFAULT NULL,
  `physicalDamageDealtToChampions` int(11) DEFAULT NULL,
  `trueDamageDealtToChampions` int(11) DEFAULT NULL,
  `totalHeal` int(11) DEFAULT NULL,
  `totalUnitsHealed` int(11) DEFAULT NULL,
  `damageSelfMitigated` int(11) DEFAULT NULL,
  `damageDealtToObjectives` int(11) DEFAULT NULL,
  `damageDealtToTurrets` int(11) DEFAULT NULL,
  `visionScore` int(11) DEFAULT NULL,
  `timeCCingOthers` int(11) DEFAULT NULL,
  `totalDamageTaken` int(11) DEFAULT NULL,
  `magicalDamageTaken` int(11) DEFAULT NULL,
  `physicalDamageTaken` int(11) DEFAULT NULL,
  `trueDamageTaken` int(11) DEFAULT NULL,
  `goldEarned` int(11) DEFAULT NULL,
  `goldSpent` int(11) DEFAULT NULL,
  `turretKills` int(11) DEFAULT NULL,
  `inhibitorKills` int(11) DEFAULT NULL,
  `totalMinionsKilled` int(11) DEFAULT NULL,
  `neutralMinionsKilled` int(11) DEFAULT NULL,
  `neutralMinionsKilledTeamJungle` int(11) DEFAULT NULL,
  `neutralMinionsKilledEnemyJungle` int(11) DEFAULT NULL,
  `totalTimeCrowdControlDealt` int(11) DEFAULT NULL,
  `champLevel` int(11) DEFAULT NULL,
  `visionWardsBoughtInGame` int(11) DEFAULT NULL,
  `sightWardsBoughtInGame` int(11) DEFAULT NULL,
  `wardsPlaced` int(11) DEFAULT NULL,
  `wardsKilled` int(11) DEFAULT NULL,
  `firstBloodKill` int(11) DEFAULT NULL,
  `firstBloodAssist` int(11) DEFAULT NULL,
  `firstTowerKill` int(11) DEFAULT NULL,
  `firstTowerAssist` int(11) DEFAULT NULL,
  `firstInhibitorKill` int(11) DEFAULT NULL,
  `firstInhibitorAssist` int(11) DEFAULT NULL,
  `combatPlayerScore` int(11) DEFAULT NULL,
  `objectivePlayerScore` int(11) DEFAULT NULL,
  `totalPlayerScore` int(11) DEFAULT NULL,
  `totalScoreRank` int(11) DEFAULT NULL,
  `playerScore0` int(11) DEFAULT NULL,
  `playerScore1` int(11) DEFAULT NULL,
  `playerScore2` int(11) DEFAULT NULL,
  `playerScore3` int(11) DEFAULT NULL,
  `playerScore4` int(11) DEFAULT NULL,
  `playerScore5` int(11) DEFAULT NULL,
  `playerScore6` int(11) DEFAULT NULL,
  `playerScore7` int(11) DEFAULT NULL,
  `playerScore8` int(11) DEFAULT NULL,
  `playerScore9` int(11) DEFAULT NULL,
  `perk0` int(11) DEFAULT NULL,
  `perk0Var1` int(11) DEFAULT NULL,
  `perk0Var2` int(11) DEFAULT NULL,
  `perk0Var3` int(11) DEFAULT NULL,
  `perk1` int(11) DEFAULT NULL,
  `perk1Var1` int(11) DEFAULT NULL,
  `perk1Var2` int(11) DEFAULT NULL,
  `perk1Var3` int(11) DEFAULT NULL,
  `perk2` int(11) DEFAULT NULL,
  `perk2Var1` int(11) DEFAULT NULL,
  `perk2Var2` int(11) DEFAULT NULL,
  `perk2Var3` int(11) DEFAULT NULL,
  `perk3` int(11) DEFAULT NULL,
  `perk3Var1` int(11) DEFAULT NULL,
  `perk3Var2` int(11) DEFAULT NULL,
  `perk3Var3` int(11) DEFAULT NULL,
  `perk4` int(11) DEFAULT NULL,
  `perk4Var1` int(11) DEFAULT NULL,
  `perk4Var2` int(11) DEFAULT NULL,
  `perk4Var3` int(11) DEFAULT NULL,
  `perk5` int(11) DEFAULT NULL,
  `perk5Var1` int(11) DEFAULT NULL,
  `perk5Var2` int(11) DEFAULT NULL,
  `perk5Var3` int(11) DEFAULT NULL,
  `perkPrimaryStyle` int(11) DEFAULT NULL,
  `perkSubStyle` int(11) DEFAULT NULL,
  `statPerk0` int(11) DEFAULT NULL,
  `statPerk1` int(11) DEFAULT NULL,
  `statPerk2` int(11) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `Player`
  ADD PRIMARY KEY `player_id` (`platformId`,`gameId`,`side`, `participantId`) USING BTREE;
CREATE INDEX `ix_player_team` ON `Player` (`platformId`,`gameId`,`side`);

COMMIT;
