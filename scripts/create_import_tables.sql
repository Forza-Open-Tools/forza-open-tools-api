-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.5.9-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE IF NOT EXISTS `carclasses` (
	`Id` TINYINT NULL,
	`DisplayName` VARCHAR(10) NOT NULL,
	`Description` VARCHAR(210) NOT NULL,
	`CarImagePath` VARCHAR(80) NOT NULL,
	`ClassColor` INT NOT NULL,
	`SecondaryColor` INT NULL,
	`MaxPerformanceIndex` DECIMAL(20,6) NOT NULL,
	`MaxDisplayPerformanceIndex` SMALLINT NOT NULL,
	`BadgeTexturePathPrefix` VARCHAR(10) NOT NULL,
	`CareerMinEligiblePI` VARCHAR(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping structure for table forzaopentunes.data_car
CREATE TABLE IF NOT EXISTS `data_car` (
  `Id` smallint(6) NOT NULL,
  `Year` smallint(6) NOT NULL,
  `MakeID` smallint(6) NOT NULL,
  `DisplayName` varchar(30) NOT NULL,
  `ModelShort` varchar(30) NOT NULL,
  `MediaName` varchar(40) NOT NULL,
  `ClassID` tinyint(4) DEFAULT NULL,
  `CarTypeID` tinyint(4) NOT NULL,
  `CarClassModifier` tinyint(4) DEFAULT NULL,
  `FamilyModelID` tinyint(4) DEFAULT NULL,
  `FamilyBodyID` tinyint(4) DEFAULT NULL,
  `EnginePlacementID` tinyint(4) NOT NULL,
  `MaterialTypeID` tinyint(4) NOT NULL,
  `PowertrainID` tinyint(4) DEFAULT NULL,
  `CurbWeight` decimal(20,6) NOT NULL,
  `WeightDistribution` decimal(20,6) NOT NULL,
  `NumGears` tinyint(4) NOT NULL,
  `TireBrandID` tinyint(4) DEFAULT NULL,
  `BaseRarity` tinyint(4) DEFAULT NULL,
  `FrontTireWidthMM` smallint(6) NOT NULL,
  `FrontTireAspect` tinyint(4) NOT NULL,
  `FrontWheelDiameterIN` tinyint(4) NOT NULL,
  `RearTireWidthMM` smallint(6) NOT NULL,
  `RearTireAspect` tinyint(4) NOT NULL,
  `RearWheelDiameterIN` tinyint(4) NOT NULL,
  `Time0-60-sec` decimal(20,6) DEFAULT NULL,
  `Time0-100-sec` decimal(20,6) DEFAULT NULL,
  `QuarterMileTime-sec` decimal(20,6) DEFAULT NULL,
  `QuarterMileSpeed-mph` smallint(6) DEFAULT NULL,
  `TopSpeed-mph` smallint(6) DEFAULT NULL,
  `SpeedLimiterID` tinyint(4) DEFAULT NULL,
  `BaseCost` int(11) NOT NULL,
  `PerformanceIndex` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table forzaopentunes.data_car_strings
CREATE TABLE IF NOT EXISTS `data_car_strings` (
  `Model` varchar(50) NOT NULL,
  `Id` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table forzaopentunes.data_engine
CREATE TABLE IF NOT EXISTS `data_engine` (
  `EngineID` smallint(6) NOT NULL,
  `EngineMass-kg` decimal(20,6) NOT NULL,
  `MediaName` varchar(40) NOT NULL,
  `ConfigID` tinyint(4) NOT NULL,
  `CylinderID` tinyint(4) NOT NULL,
  `Compression` decimal(20,6) NOT NULL,
  `VariableTimingID` tinyint(4) NOT NULL,
  `AspirationID_Stock` tinyint(4) NOT NULL,
  `StockBoost-bar` decimal(20,6) NOT NULL,
  `MomentInertia` decimal(20,6) NOT NULL,
  `GasTankSize` decimal(20,6) NOT NULL,
  `FuelBurnPerHorsepowerHour` decimal(20,6) NOT NULL,
  `TorqueSteerLeftSpeedScale` decimal(20,6) NOT NULL,
  `TorqueSteerRightSpeedScale` decimal(20,6) NOT NULL,
  `EngineGraphingMaxTorque` decimal(20,6) NOT NULL,
  `EngineGraphingMaxPower` decimal(20,6) NOT NULL,
  `EngineGraphingAspirationID` tinyint(4) NOT NULL,
  `EngineName` varchar(30) DEFAULT NULL,
  `EngineRotation` tinyint(4) DEFAULT NULL,
  `Carbureted` tinyint(4) DEFAULT NULL,
  `Diesel` tinyint(4) DEFAULT NULL,
  `Rotary` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table forzaopentunes.list_aspiration
CREATE TABLE IF NOT EXISTS `list_aspiration` (
  `AspirationID` tinyint(4) NOT NULL,
  `Aspiration` varchar(20) NOT NULL,
  `DisplayName` varchar(40) NOT NULL,
  `ShortDisplayName` varchar(10) NOT NULL,
  `KeyPartEnum` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table forzaopentunes.list_carmake
CREATE TABLE IF NOT EXISTS `list_carmake` (
  `ID` smallint(6) NOT NULL,
  `DisplayName` varchar(30) NOT NULL,
  `ManufacturerCode` varchar(10) NOT NULL,
  `CountryID` tinyint(4) NOT NULL,
  `IconPath` varchar(50) NOT NULL,
  `IconPathLarge` varchar(50) NOT NULL,
  `IconPathBase` varchar(20) NOT NULL,
  `Profile` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table forzaopentunes.list_carmake_strings
CREATE TABLE IF NOT EXISTS `list_carmake_strings` (
  `ID` varchar(20) NOT NULL,
  `Make` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table forzaopentunes.list_upgradebrakes
CREATE TABLE IF NOT EXISTS `list_upgradebrakes` (
  `Id` int(11) NOT NULL,
  `Ordinal` smallint(6) NOT NULL,
  `Level` tinyint(4) DEFAULT NULL,
  `IsStock` tinyint(4) DEFAULT NULL,
  `ManufacturerID` smallint(6) DEFAULT NULL,
  `MassDiff` varchar(10) NOT NULL,
  `Price` smallint(6) DEFAULT NULL,
  `FrontBrakeSize` tinyint(4) NOT NULL,
  `FrontBrakeSizeMM` decimal(20,6) NOT NULL,
  `FrontBrakeRotorThicknessMM` decimal(20,6) NOT NULL,
  `FrontBrakeDrumDepthMM` decimal(20,6) NOT NULL,
  `FrontBrakeNonSpinningMass` decimal(20,6) NOT NULL,
  `FrontBrakeTypeID` tinyint(4) NOT NULL,
  `FrontCaliperPistons` tinyint(4) DEFAULT NULL,
  `RearBrakeSize` tinyint(4) NOT NULL,
  `RearBrakeSizeMM` decimal(20,6) NOT NULL,
  `RearBrakeRotorThicknessMM` decimal(20,6) NOT NULL,
  `RearBrakeDrumDepthMM` decimal(20,6) NOT NULL,
  `RearBrakeNonSpinningMass` decimal(20,6) NOT NULL,
  `RearBrakeTypeID` tinyint(4) NOT NULL,
  `RearCaliperPistons` tinyint(4) DEFAULT NULL,
  `GameFrictionScaleBraking` decimal(20,6) NOT NULL,
  `BrakeTorqueSlider` decimal(20,6) NOT NULL,
  `BrakeBiasSlider` decimal(20,6) NOT NULL,
  `BiasHandbrake` decimal(20,6) NOT NULL,
  `ReleasePointABS` decimal(20,6) NOT NULL,
  `FrontBrakeTorqueClamp` decimal(20,6) NOT NULL,
  `RearBrakeTorqueClamp` decimal(20,6) NOT NULL,
  `DamageModDefID` tinyint(4) NOT NULL,
  `RequiresGraphics` tinyint(4) NOT NULL,
  `BrakesProfileID` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table forzaopentunes.list_upgradecarbody
CREATE TABLE IF NOT EXISTS `list_upgradecarbody` (
  `Id` int(11) NOT NULL,
  `Ordinal` smallint(6) NOT NULL,
  `Level` tinyint(4) DEFAULT NULL,
  `CarBodyID` int(11) NOT NULL,
  `IsStock` tinyint(4) DEFAULT NULL,
  `ManufacturerID` smallint(6) DEFAULT NULL,
  `MassDiff` varchar(10) NOT NULL,
  `Price` smallint(6) DEFAULT NULL,
  `RequiresGraphics` tinyint(4) NOT NULL,
  `releaseOrder` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table forzaopentunes.list_upgradecarbodyfrontbumper
CREATE TABLE IF NOT EXISTS `list_upgradecarbodyfrontbumper` (
  `Id` int(11) NOT NULL,
  `CarBodyID` int(11) NOT NULL,
  `Level` tinyint(4) DEFAULT NULL,
  `IsStock` tinyint(4) DEFAULT NULL,
  `Sequence` tinyint(4) NOT NULL,
  `ManufacturerId` smallint(6) NOT NULL,
  `PartsStringId` tinyint(4) DEFAULT NULL,
  `MassDiff` varchar(10) NOT NULL,
  `DragScale` decimal(20,6) NOT NULL,
  `WindInstabilityScale` decimal(20,6) NOT NULL,
  `Price` smallint(6) DEFAULT NULL,
  `AeroPhysicsID` int(11) NOT NULL,
  `RequiresGraphics` tinyint(4) DEFAULT NULL,
  `releaseOrder` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table forzaopentunes.list_upgradedrivetrain
CREATE TABLE IF NOT EXISTS `list_upgradedrivetrain` (
  `Id` int(11) NOT NULL,
  `Ordinal` smallint(6) NOT NULL,
  `DrivetrainID` smallint(6) NOT NULL,
  `PowertrainId` tinyint(4) DEFAULT NULL,
  `MassDiff` varchar(10) NOT NULL,
  `WeightDistDiff` varchar(10) NOT NULL,
  `Level` tinyint(4) DEFAULT NULL,
  `ManufacturerId` smallint(6) NOT NULL,
  `Price` smallint(6) DEFAULT NULL,
  `IsStock` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table forzaopentunes.list_upgradedrivetraindifferential
CREATE TABLE IF NOT EXISTS `list_upgradedrivetraindifferential` (
  `Id` int(11) NOT NULL,
  `DrivetrainID` smallint(6) NOT NULL,
  `Level` tinyint(4) DEFAULT NULL,
  `IsStock` tinyint(4) DEFAULT NULL,
  `ManufacturerID` smallint(6) DEFAULT NULL,
  `MassDiff` decimal(20,6) NOT NULL,
  `Price` smallint(6) DEFAULT NULL,
  `FrontLimitedSlipTorqueAccel` decimal(20,6) NOT NULL,
  `FrontLimitedSlipTorqueDecel` decimal(20,6) NOT NULL,
  `FrontLimitedSlipRelVelClamp` decimal(20,6) NOT NULL,
  `FrontLimitedSlipAccelDefInputTorque` decimal(20,6) NOT NULL,
  `RearLimitedSlipTorqueAccel` decimal(20,6) NOT NULL,
  `RearLimitedSlipTorqueDecel` decimal(20,6) NOT NULL,
  `RearLimitedSlipRelVelClamp` decimal(20,6) NOT NULL,
  `RearLimitedSlipAccelDefInputTorque` decimal(20,6) NOT NULL,
  `CenterLimitedSlipTorqueAccel` decimal(20,6) NOT NULL,
  `CenterLimitedSlipTorqueDecel` decimal(20,6) NOT NULL,
  `CenterLimitedSlipRelVelClamp` decimal(20,6) NOT NULL,
  `CenterLimitedSlipAccelDefInputTorque` decimal(20,6) NOT NULL,
  `RearToqueSplit` decimal(20,6) NOT NULL,
  `TCProfileID` tinyint(4) NOT NULL,
  `DifferentialProfileID` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table forzaopentunes.list_upgradedrivetraintransmission
CREATE TABLE IF NOT EXISTS `list_upgradedrivetraintransmission` (
  `Id` int(11) NOT NULL,
  `DrivetrainID` smallint(6) NOT NULL,
  `Level` tinyint(4) DEFAULT NULL,
  `IsStock` tinyint(4) DEFAULT NULL,
  `ManufacturerID` smallint(6) DEFAULT NULL,
  `MassDiff` varchar(10) NOT NULL,
  `Price` smallint(6) DEFAULT NULL,
  `MomentInertia` decimal(20,6) NOT NULL,
  `GearShiftTime` decimal(20,6) NOT NULL,
  `FinalDriveRatio` decimal(20,6) NOT NULL,
  `NumGears` tinyint(4) NOT NULL,
  `GearRatio0` varchar(10) NOT NULL,
  `GearRatio1` decimal(20,6) NOT NULL,
  `GearRatio2` varchar(10) NOT NULL,
  `GearRatio3` varchar(10) NOT NULL,
  `GearRatio4` varchar(10) NOT NULL,
  `GearRatio5` varchar(10) NOT NULL,
  `GearRatio6` varchar(10) NOT NULL,
  `GearRatio7` varchar(10) NOT NULL,
  `GearRatio8` varchar(10) NOT NULL,
  `CVTShiftTime` varchar(10) NOT NULL,
  `GearRatio9` varchar(10) NOT NULL,
  `GearRatio10` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table forzaopentunes.list_upgradeengine
CREATE TABLE IF NOT EXISTS `list_upgradeengine` (
  `Id` int(11) NOT NULL,
  `Ordinal` smallint(6) NOT NULL,
  `Level` tinyint(4) DEFAULT NULL,
  `EngineID` smallint(6) NOT NULL,
  `IsStock` tinyint(4) DEFAULT NULL,
  `ManufacturerID` smallint(6) NOT NULL,
  `Price` mediumint(9) DEFAULT NULL,
  `MassDiff` varchar(10) NOT NULL,
  `WeightDistDiff` varchar(10) NOT NULL,
  `DragScale` decimal(20,6) NOT NULL,
  `WindInstabilityScale` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table forzaopentunes.list_upgraderearwing
CREATE TABLE IF NOT EXISTS `list_upgraderearwing` (
  `Id` int(11) NOT NULL,
  `Ordinal` smallint(6) NOT NULL,
  `Level` tinyint(4) DEFAULT NULL,
  `IsStock` tinyint(4) DEFAULT NULL,
  `Sequence` tinyint(4) NOT NULL,
  `ManufacturerId` smallint(6) DEFAULT NULL,
  `PartsStringId` tinyint(4) DEFAULT NULL,
  `MassDiff` varchar(10) NOT NULL,
  `DragScale` decimal(20,6) NOT NULL,
  `WindInstabilityScale` decimal(20,6) NOT NULL,
  `Price` smallint(6) DEFAULT NULL,
  `AeroPhysicsID` int(11) NOT NULL,
  `RequiresGraphics` tinyint(4) DEFAULT NULL,
  `releaseOrder` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
