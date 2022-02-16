export interface Car {
  id: number;
  year: number;
  makeId: number;
  displayName: string;
  modelShort: string;
  mediaName: string;
  classId?: number;
  carTypeId?: number;
  carClassModifier?: number;
  familyModelId?: number;
  familyBodyId?: number;
  enginePlacementId?: number,
  materialTypeId?: number,
  powertrainId?: number;
  curbWeight?: number;
  weightDistribution?: number;
  numGears?: number;
  tireBrandId?: number;
  baseRarity?: number;
  frontTireWidthMM?: number;
  frontTireAspect?: number;
  frontWheelDiameterIN?: number;
  rearTireWidthMM?: number,
  rearTireAspect?: number,
  rearWheelDiameterIN?: number,
  zeroSixtyTimeSec?: number;
  zeroOneHundredTimeSec?: number;
  quarterMileTimeSec?: number;
  quarterMileSpeedMPH?: number;
  topSpeedMPH?: number;
  speedLimiterId?: number;
  baseCost?: number;
  performanceIndex?: number;
}

export interface Make {
  id: number;
  displayName: string;
  manufacturerCode: string;
  countryId?: number;
}

export interface Engine {
  id: number;
  engineMassKg: number;
  mediaName: string;
  configId: number;
  cylinderId: number;
  compression: number;
  variableTimingId: number;
  aspirationIdStock: number;
  stockboostBar: number;
  momentInertia: number;
  gasTankSize: number;
  fuelBurnPerHorsepowerHour: number;
  torqueSteerLeftSpeedScale: number;
  torqueSteerRightSpeedScale: number;
  engineGraphingMaxTorque: number;
  engineGraphingMaxPower: number;
  engineGraphingAspirationId: number;
  engineName: string;
  engineRotation: boolean;
  carbureted: boolean;
  diesel: boolean;
  rotary: boolean;
}

export interface BrakeUpgrade {
  id: number;
  ordinal: number;
  level: number;
  isStock: boolean
  manufacturerId: number;
  massDiff: number;
  price: number;
  frontBrakeSize: number;
  frontBrakeSizeMm: number;
  frontBrakeRotorThicknessMm: number;
  frontBrakeDrumDepthMm: number;
  frontBrakeNonSpinningMass: number;
  frontBrakeTypeId: number;
  frontCaliperPistons: number;
  rearBrakeSize: number;
  rearBrakeSizeMm: number;
  rearBrakeRotorThicknessMm: number;
  rearBrakeDrumDepthMm: number;
  rearBrakeNonSpinningMass: number;
  rearBrakeTypeId: number;
  rearCaliperPistons: number;
  gameFrictionScaleBraking: number;
  brakeTorqueSlider: number;
  brakeBiasSlider: number;
  biasHandbrake: number;
  releasePointAbs: number;
  frontBrakeTorqueClamp: number;
  rearBrakeTorqueClamp: number;
  damageModDefId: number;
  brakesProfileId: number;
}

export interface CarBodyUpgrade {
  id: number;
  ordinal: number;
  level: number;
  carBodyId: number;
  isStock: boolean;
  manufacturerId: number;
  massDiff: number;
  price: number;
}

export interface Aspiration {
  id: number;
  aspiration: string;
  displayName: string;
  shortDisplayName: string;
  keyPartEnum: string;
}

export interface CarBodyFrontBumperUpgrade {
  id: number;
  carBodyId: number;
  level: number;
  isStock: boolean;
  sequence: number;
  manufacturerId: number;
  partsStringId: number;
  massDiff: number;
  dragScale: number;
  windInstabilityScale: number;
  price: number;
  aeroPhysicsId: number;
}

export interface DrivetrainUpgrade {
  id: number;
  ordinal: number;
  drivetrainId: number;
  powertrainId: number;
  massDiff: number;
  weightDistDiff: number;
  level: number;
  manufacturerId: number;
  price: number;
  isStock: string;
}

export interface DifferentialUpgrade {
  id: number;
  drivetrainId: number;
  level: number;
  isStock: boolean;
  manufacturerId: number;
  massDiff: number;
  price: number;
  frontLimitedSlipTorqueAccel: number;
  frontLimitedSlipTorqueDecel: number;
  frontLimitedSlipRelVelClamp: number;
  frontLimitedSlipAccelDefInputTorque: number;
  rearLimitedSlipTorqueAccel: number;
  rearLimitedSlipTorqueDecel: number;
  rearLimitedSlipRelVelClamp: number;
  rearLimitedSlipAccelDefInputTorque: number;
  centerLimitedSlipTorqueAccel: number;
  centerLimitedSlipTorqueDecel: number;
  centerLimitedSlipRelVelClamp: number;
  centerLimitedSlipAccelDefInputTorque: number;
  rearToqueSplit: number;
  tcProfileId: number;
  differentialProfileId: number;
}

export interface TransmissionUpgrade {
  id: number;
  drivetrainId: number;
  level: number;
  isStock: boolean;
  manufacturerId: number;
  massDiff: number;
  price: number;
  momentInertia: number;
  gearShiftTime: number;
  finalDriveRatio: number;
  numGears: number;
  cvtShiftTime: number;
  gearRatio0: number;
  gearRatio1: number;
  gearRatio2: number;
  gearRatio3: number;
  gearRatio4: number;
  gearRatio5: number;
  gearRatio6: number;
  gearRatio7: number;
  gearRatio8: number;
  gearRatio9: number;
  gearRatio10: number;
}

export interface EngineUpgrade {
  id: number;
  ordinal: number;
  level: number;
  engineId: number;
  isStock: boolean;
  manufacturerId: number;
  price: number;
  massDiff: number;
  weightDistDiff: number;
  dragScale: number;
  windInstabilityScale: string;
}

export interface RearWingUpgrade {
  id: number;
  ordinal: number;
  level: number;
  isStock: boolean;
  sequence: number;
  manufacturerId: number;
  partsStringId: number;
  massDiff: number;
  dragScale: number;
  windInstabilityScale: number;
  price: number;
  aeroPhysicsId: number;
}
