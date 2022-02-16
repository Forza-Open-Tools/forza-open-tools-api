select * from data_car;
select *, CONVERT(REPLACE(Id, 'IDS_DisplayName_', ''), int) from data_car_strings;
select * from data_car_strings;

insert into car_classes (id, display_name, description, class_color, secondary_color, max_performance_index, max_display_performance_index, badge_texture_path_prefix, career_min_eligible_pi)
select Id,
  DisplayName,
  Description,
  ClassColor,
  SecondaryColor,
  MaxPerformanceIndex,
  MaxDisplayPerformanceIndex,
  BadgeTexturePathPrefix,
  CareerMinEligiblePI
from carclasses;

select ID
DisplayName
ManufacturerCode
CountryID
IconPath
IconPathLarge
IconPathBase
Profile
from list_carmake;

select * from list_carmake_strings;

insert into makes (
  id,
  display_name,
  manufacturer_code,
  country_id,
  icon_path,
  icon_path_large,
  icon_path_base,
  profile
)
select
  c.ID,
  s.Make,
  c.ManufacturerCode,
  c.CountryID,
  c.IconPath,
  c.IconPathLarge,
  c.IconPathBase,
  c.Profile
from list_carmake c
  left join (select CONVERT(Id, int) Id, Make from list_carmake_strings) s on c.Id = s.Id;

update list_carmake_strings set ID = REPLACE(Id, 'IDS_DisplayName_', '');
update data_car_strings set Id = REPLACE(Id, 'IDS_DisplayName_', '');
update data_car_strings set Id = convert(Id, int);
update data_car_strings_ModelShort set Id = convert(REPLACE(Id, 'IDS_ModelShort_', ''), int);
select * from data_car_strings_ModelShort;
CREATE TABLE IF NOT EXISTS `data_car_strings_ModelShort` (
  `Model` varchar(50) NOT NULL,
  `Id` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `data_car_strings_Other` (
  `Model` varchar(50) NOT NULL,
  `Id` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into data_car_strings_ModelShort (Model, Id)
select Model, Id from data_car_strings where Id like 'IDS_ModelShort%';
select Model, Id from data_car_strings where Id like '%\r';
select Model, Id from data_car_strings_ModelShort where Id like '%\r';
select Model, Id from data_car_strings_Other where Id like '%\r';
update data_car_strings set Id = trim(TRAILING '\r' FROM Id);
update data_car_strings_ModelShort set Id = trim(TRAILING '\r' FROM Id);
update data_car_strings_Other set Id = trim(TRAILING '\r' FROM Id);

insert into data_car_strings_ModelShort (Model, Id)
select Model, Id from data_car_strings where convert(Id, int) = 0;


select Model, Id, convert(Id, int) from data_car_strings where convert(Id, int) != 0 order by Id; where Id != '
' and Id != '
' order by Id;
delete from data_car_strings where Id = '';

insert into cars (
  id,
  year,
  make_id,
  display_name,
  model_short,
  media_name,
  class_id,
  car_type_id,
  car_class_modifier,
  family_model_id,
  family_body_id,
  engine_placement_id,
  material_type_id,
  powertrain_id,
  curb_weight,
  weight_distribution,
  num_gears,
  tire_brand_id,
  base_rarity,
  front_tire_width_mm,
  front_tire_aspect,
  front_wheel_diameter_in,
  rear_tire_width_mm,
  rear_tire_aspect,
  rear_wheel_diameter_in,
  zero_to_sixy_sec,
  zero_to_hundred_sec,
  quarter_mile_sec,
  quarter_mile_mph,
  top_speed_mph,
  speed_limiter_id,
  base_cost,
  performance_index
)
select
  c.`Id`,
  c.`Year`,
  c.`MakeID`,
  s.Model,
  short.Model,
  c.`MediaName`,
  c.`ClassID`,
  c.`CarTypeID`,
  c.`CarClassModifier`,
  c.`FamilyModelID`,
  c.`FamilyBodyID`,
  c.`EnginePlacementID`,
  c.`MaterialTypeID`,
  c.`PowertrainID`,
  c.`CurbWeight`,
  c.`WeightDistribution`,
  c.`NumGears`,
  c.`TireBrandID`,
  c.`BaseRarity`,
  c.`FrontTireWidthMM`,
  c.`FrontTireAspect`,
  c.`FrontWheelDiameterIN`,
  c.`RearTireWidthMM`,
  c.`RearTireAspect`,
  c.`RearWheelDiameterIN`,
  c.`Time0-60-sec`,
  c.`Time0-100-sec`,
  c.`QuarterMileTime-sec`,
  c.`QuarterMileSpeed-mph`,
  c.`TopSpeed-mph`,
  c.`SpeedLimiterID`,
  convert(c.`BaseCost`, int),
  convert(c.`PerformanceIndex`, decimal(20,6))
from data_car c
  join (select CONVERT(Id, int) Id, Model from data_car_strings where convert(Id, int) != 0) s on c.Id = s.Id
  join (select convert(Id, int) Id, Model from data_car_strings_ModelShort) short on c.Id = short.Id
where c.Id not in (select id from cars);

insert into engines (
  id,
  engine_mass_kg,
  media_name,
  config_id,
  cylinder_id,
  compression,
  variable_timing_id,
  aspiration_id_stock,
  stockboost_bar,
  moment_inertia,
  gas_tank_size,
  fuel_burn_per_horsepower_hour,
  torque_steer_left_speed_scale,
  torque_steer_right_speed_scale,
  engine_graphing_max_torque,
  engine_graphing_max_power,
  engine_graphing_aspiration_id,
  engine_name,
  engine_rotation,
  carbureted,
  diesel,
  rotary
)
select
`EngineID`,
`EngineMass-kg`,
`MediaName`,
`ConfigID`,
`CylinderID`,
`Compression`,
`VariableTimingID`,
`AspirationID_Stock`,
`StockBoost-bar`,
`MomentInertia`,
`GasTankSize`,
`FuelBurnPerHorsepowerHour`,
`TorqueSteerLeftSpeedScale`,
`TorqueSteerRightSpeedScale`,
`EngineGraphingMaxTorque`,
`EngineGraphingMaxPower`,
`EngineGraphingAspirationID`,
`EngineName`,
case when `EngineRotation` = 1 then true else false end,
case when `Carbureted` = 1 then true else false end,
case when `Diesel` = 1 then true else false end,
case when `Rotary` = '1' then true else false end
from data_engine;

insert into aspiration (
  id,
  aspiration,
  display_name,
  short_display_name,
  key_part_enum
)
select
from list_aspiration;

insert into brake_upgrades (
  id,
  ordinal,
  level,
  is_stock,
  manufacturer_id,
  mass_diff,
  price,
  front_brake_size,
  front_brake_size_mm,
  front_brake_rotor_thickness_mm,
  front_brake_drum_depth_mm,
  front_brake_non_spinning_mass,
  front_brake_type_id,
  front_caliper_pistons,
  rear_brake_size,
  rear_brake_size_mm,
  rear_brake_rotor_thickness_mm,
  rear_brake_drum_depth_mm,
  rear_brake_non_spinning_mass,
  rear_brake_type_id,
  rear_caliper_pistons,
  game_friction_scale_braking,
  brake_torque_slider,
  brake_bias_slider,
  bias_handbrake,
  release_point_abs,
  front_brake_torque_clamp,
  rear_brake_torque_clamp,
  damage_mod_def_id,
  brakes_profile_id
)
select
  Id,
  Ordinal,
  Level,
  IsStock,
  ManufacturerID,
  MassDiff,
  Price,
  FrontBrakeSize,
  FrontBrakeSizeMM,
  FrontBrakeRotorThicknessMM,
  FrontBrakeDrumDepthMM,
  FrontBrakeNonSpinningMass,
  FrontBrakeTypeID,
  FrontCaliperPistons,
  RearBrakeSize,
  RearBrakeSizeMM,
  RearBrakeRotorThicknessMM,
  RearBrakeDrumDepthMM,
  RearBrakeNonSpinningMass,
  RearBrakeTypeID,
  RearCaliperPistons,
  GameFrictionScaleBraking,
  BrakeTorqueSlider,
  BrakeBiasSlider,
  BiasHandbrake,
  ReleasePointABS,
  FrontBrakeTorqueClamp,
  RearBrakeTorqueClamp,
  DamageModDefID,
  BrakesProfileID
from list_upgradebrakes;

insert into car_body_upgrades (
  id,
  ordinal,
  level,
  car_body_id,
  is_stock,
  manufacturer_id,
  mass_diff,
  price
)
select
  Id,
  Ordinal,
  Level,
  CarBodyId,
  IsStock,
  ManufacturerId,
  MassDiff,
  Price
from list_upgradecarbody;

insert into car_body_front_bumper_upgrades (
  id,
  car_body_id,
  level,
  is_stock,
  sequence,
  manufacturer_id,
  parts_string_id,
  mass_diff,
  drag_scale,
  wind_instability_scale,
  price,
  aero_physics_id
)
select
  Id,
  CarBodyId,
  Level,
  IsStock,
  Sequence,
  ManufacturerId,
  PartsStringId,
  MassDiff,
  DragScale,
  WindInstabilityScale,
  Price,
  AeroPhysicsId
from list_upgradecarbodyfrontbumper;

insert into drivetrain_upgrades (
  id,
  ordinal,
  drivetrain_id,
  powertrain_id,
  mass_diff,
  weight_dist_diff,
  level,
  manufacturer_id,
  price,
  is_stock
)
select
  Id,
  Ordinal,
  DrivetrainId,
  PowertrainId,
  MassDiff,
  WeightDistDiff,
  Level,
  ManufacturerId,
  Price,
  IsStock
from list_upgradedrivetrain;

insert into differential_upgrades (
  id,
  drivetrain_id,
  level,
  is_stock,
  manufacturer_id,
  mass_diff,
  price,
  front_limited_slip_torque_accel,
  front_limited_slip_torque_decel,
  front_limited_slip_rel_vel_clamp,
  front_limited_slip_accel_def_input_torque,
  rear_limited_slip_torque_accel,
  rear_limited_slip_torque_decel,
  rear_limited_slip_rel_vel_clamp,
  rear_limited_slip_accel_def_input_torque,
  center_limited_slip_torque_accel,
  center_limited_slip_torque_decel,
  center_limited_slip_rel_vel_clamp,
  center_limited_slip_accel_def_input_torque,
  rear_toque_split,
  tc_profile_id,
  differential_profile_id
)
select
  Id,
  DrivetrainId,
  Level,
  IsStock,
  ManufacturerId,
  MassDiff,
  Price,
  FrontLimitedSlipTorqueAccel,
  FrontLimitedSlipTorqueDecel,
  FrontLimitedSlipRelVelClamp,
  FrontLimitedSlipAccelDefInputTorque,
  RearLimitedSlipTorqueAccel,
  RearLimitedSlipTorqueDecel,
  RearLimitedSlipRelVelClamp,
  RearLimitedSlipAccelDefInputTorque,
  CenterLimitedSlipTorqueAccel,
  CenterLimitedSlipTorqueDecel,
  CenterLimitedSlipRelVelClamp,
  CenterLimitedSlipAccelDefInputTorque,
  RearToqueSplit,
  TcProfileId,
  DifferentialProfileId
from list_upgradedrivetraindifferential;

insert into transmission_upgrades (
  id,
  drivetrain_id,
  level,
  is_stock,
  manufacturer_id,
  mass_diff,
  price,
  moment_inertia,
  gear_shift_time,
  final_drive_ratio,
  num_gears,
  cvt_shift_time,
  gear_ratio0,
  gear_ratio1,
  gear_ratio2,
  gear_ratio3,
  gear_ratio4,
  gear_ratio5,
  gear_ratio6,
  gear_ratio7,
  gear_ratio8,
  gear_ratio9,
  gear_ratio10
)
select
  Id,
  DrivetrainId,
  Level,
  IsStock,
  ManufacturerId,
  MassDiff,
  Price,
  MomentInertia,
  GearShiftTime,
  FinalDriveRatio,
  NumGears,
  CvtShiftTime,
  GearRatio0,
  GearRatio1,
  GearRatio2,
  GearRatio3,
  GearRatio4,
  GearRatio5,
  GearRatio6,
  GearRatio7,
  GearRatio8,
  GearRatio9,
  GearRatio10
from list_upgradedrivetraintransmission;

insert into engine_upgrades (
  id,
  ordinal,
  level,
  engine_id,
  is_stock,
  manufacturer_id,
  price,
  mass_diff,
  weight_dist_diff,
  drag_scale,
  wind_instability_scale
)
select
  Id,
  Ordinal,
  Level,
  EngineId,
  IsStock,
  ManufacturerId,
  Price,
  MassDiff,
  WeightDistDiff,
  DragScale,
  WindInstabilityScale
from list_upgradeengine;

insert into rear_wing_upgrades (
  id,
  ordinal,
  level,
  is_stock,
  sequence,
  manufacturer_id,
  parts_string_id,
  mass_diff,
  drag_scale,
  wind_instability_scale,
  price,
  aero_physics_id
)
select
  Id,
  Ordinal,
  Level,
  IsStock,
  Sequence,
  ManufacturerId,
  PartsStringId,
  MassDiff,
  DragScale,
  WindInstabilityScale,
  Price,
  AeroPhysicsId
from list_upgraderearwing;


update `carclasses` set CareerMinEligiblePI = trim(trailing '\r' from CareerMinEligiblePI) where 1=1;
update `data_car` set PerformanceIndex = trim(trailing '\r' from PerformanceIndex) where 1=1;
update `data_engine` set Rotary = trim(trailing '\r' from Rotary) where 1=1;
update `list_aspiration` set KeyPartEnum = trim(trailing '\r' from KeyPartEnum) where 1=1;
update `list_carmake` set Profile = trim(trailing '\r' from Profile) where 1=1;
update `list_carmake_strings` set Make = trim(trailing '\r' from Make) where 1=1;
update `list_upgradebrakes` set BrakesProfileID = trim(trailing '\r' from BrakesProfileID) where 1=1;
update `list_upgradecarbody` set releaseOrder = trim(trailing '\r' from releaseOrder) where 1=1;
update `list_upgradecarbodyfrontbumper` set releaseOrder = trim(trailing '\r' from releaseOrder) where 1=1;
update `list_upgradedrivetrain` set IsStock = trim(trailing '\r' from IsStock) where 1=1;
update `list_upgradedrivetraindifferential` set DifferentialProfileID = trim(trailing '\r' from DifferentialProfileID) where 1=1;
update `list_upgradedrivetraintransmission` set GearRatio10 = trim(trailing '\r' from GearRatio10) where 1=1;
update `list_upgradeengine` set WindInstabilityScale = trim(trailing '\r' from WindInstabilityScale) where 1=1;
update `list_upgraderearwing` set releaseOrder = trim(trailing '\r' from releaseOrder) where 1=1;

select dc.*, s.Model
from data_car dc
left join (select CONVERT(Id, int) Id, Model from data_car_strings where convert(Id, int) != 0) s on dc.Id = s.Id
where dc.Id not in (select id from cars)
limit 1;

-- 2262
select * from makes where id = 8;
select convert(`PerformanceIndex`, decimal(20,6)), performanceIndex from data_car where convert(`PerformanceIndex`, decimal(20,6)) = 0;
select CONVERT(Id, int) Id, Model from data_car_strings where Id = ''; convert(Id, int) = 0;



delete from cars where 1=1;

select * from cars;
select count(*) from cars;
select * from data_car where id not in ;
select count(*) from data_car; where MakeID not in (select id from makes);
select * from data_car where ClassID not in (select id from car_classes);
select * from makes;
select * from car_classes;
select CONVERT(Id, int) Id, Model from data_car_strings where Id = '2262';

select *, convert(Id, int) from data_car_strings;
select * from data_car_strings where Id = 2262;
select * from data_car_strings where Id = '2262
';
select * from data_car_strings order by Model;
update data_car_strings set Id = convert(Id, int);
'2262'
select * from data_car where MakeId < 0;
select * from cars;

MakeID < 0 OR MakeID IS NULL OR
ClassID < 0 OR ClassID IS NULL OR
CarTypeID < 0 OR CarTypeID IS NULL OR
FamilyModelID < 0 OR FamilyModelID IS NULL OR
FamilyBodyID < 0 OR FamilyBodyID IS NULL OR
EnginePlacementID < 0 OR EnginePlacementID IS NULL OR
MaterialTypeID < 0 OR MaterialTypeID IS NULL OR
PowertrainID < 0 OR PowertrainID IS NULL OR
TireBrandID < 0 OR TireBrandID IS NULL OR
SpeedLimiterID < 0 OR SpeedLimiterID IS NULL;
select * from car_classes;
