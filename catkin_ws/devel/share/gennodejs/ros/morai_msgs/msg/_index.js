
"use strict";

let EgoNoisyStatus = require('./EgoNoisyStatus.js');
let GPSMessage = require('./GPSMessage.js');
let SyncModeRemoveObject = require('./SyncModeRemoveObject.js');
let FaultInjection_Response = require('./FaultInjection_Response.js');
let ShipCtrlCmd = require('./ShipCtrlCmd.js');
let NpcGhostInfo = require('./NpcGhostInfo.js');
let EventInfo = require('./EventInfo.js');
let GeoVector3Message = require('./GeoVector3Message.js');
let Transforms = require('./Transforms.js');
let SyncModeScenarioLoad = require('./SyncModeScenarioLoad.js');
let MoraiSimProcStatus = require('./MoraiSimProcStatus.js');
let SetTrafficLight = require('./SetTrafficLight.js');
let ObjectStatus = require('./ObjectStatus.js');
let FaultStatusInfo = require('./FaultStatusInfo.js');
let MoraiTLInfo = require('./MoraiTLInfo.js');
let FaultStatusInfo_Overall = require('./FaultStatusInfo_Overall.js');
let ObjectStatusListExtended = require('./ObjectStatusListExtended.js');
let MultiPlayEventResponse = require('./MultiPlayEventResponse.js');
let CollisionData = require('./CollisionData.js');
let FaultInjection_Controller = require('./FaultInjection_Controller.js');
let EgoVehicleStatus = require('./EgoVehicleStatus.js');
let RobotState = require('./RobotState.js');
let VehicleSpecIndex = require('./VehicleSpecIndex.js');
let IntscnTL = require('./IntscnTL.js');
let RobotPose = require('./RobotPose.js');
let SensorPosControl = require('./SensorPosControl.js');
let PREvent = require('./PREvent.js');
let FaultInjection_Tire = require('./FaultInjection_Tire.js');
let RadarDetections = require('./RadarDetections.js');
let IntersectionControl = require('./IntersectionControl.js');
let GetTrafficLightStatus = require('./GetTrafficLightStatus.js');
let GripperState = require('./GripperState.js');
let MSITCustomMessage = require('./MSITCustomMessage.js');
let ObjectStatusExtended = require('./ObjectStatusExtended.js');
let SkateboardCtrlCmd = require('./SkateboardCtrlCmd.js');
let PRStatus = require('./PRStatus.js');
let NpcGhostCmd = require('./NpcGhostCmd.js');
let DillyCmd = require('./DillyCmd.js');
let ScenarioLoad = require('./ScenarioLoad.js');
let SyncModeResultResponse = require('./SyncModeResultResponse.js');
let GVStateCmd = require('./GVStateCmd.js');
let MoraiSrvResponse = require('./MoraiSrvResponse.js');
let SVADC = require('./SVADC.js');
let DdCtrlCmd = require('./DdCtrlCmd.js');
let GhostMessage = require('./GhostMessage.js');
let WaitForTick = require('./WaitForTick.js');
let Obstacles = require('./Obstacles.js');
let FaultInjection_Sensor = require('./FaultInjection_Sensor.js');
let CtrlCmd = require('./CtrlCmd.js');
let ShipState = require('./ShipState.js');
let FaultStatusInfo_Vehicle = require('./FaultStatusInfo_Vehicle.js');
let RobotOutput = require('./RobotOutput.js');
let SyncModeSetGear = require('./SyncModeSetGear.js');
let FaultStatusInfo_Sensor = require('./FaultStatusInfo_Sensor.js');
let ExternalForce = require('./ExternalForce.js');
let VehicleSpec = require('./VehicleSpec.js');
let RPY = require('./RPY.js');
let IntersectionStatus = require('./IntersectionStatus.js');
let WheelControl = require('./WheelControl.js');
let SaveSensorData = require('./SaveSensorData.js');
let EgoDetailStatus = require('./EgoDetailStatus.js');
let SkidSteer6wUGVCtrlCmd = require('./SkidSteer6wUGVCtrlCmd.js');
let TOF = require('./TOF.js');
let ReplayInfo = require('./ReplayInfo.js');
let ManipulatorControl = require('./ManipulatorControl.js');
let CMDConveyor = require('./CMDConveyor.js');
let VehicleCollisionData = require('./VehicleCollisionData.js');
let XYZ = require('./XYZ.js');
let Lamps = require('./Lamps.js');
let MultiEgoSetting = require('./MultiEgoSetting.js');
let AttachmentDeviceState = require('./AttachmentDeviceState.js');
let SyncModeInfo = require('./SyncModeInfo.js');
let TrafficLight = require('./TrafficLight.js');
let VelocityCmd = require('./VelocityCmd.js');
let SyncModeAddObject = require('./SyncModeAddObject.js');
let SyncModeCmd = require('./SyncModeCmd.js');
let SkidSteer6wUGVStatus = require('./SkidSteer6wUGVStatus.js');
let PRCtrlCmd = require('./PRCtrlCmd.js');
let WaitForTickResponse = require('./WaitForTickResponse.js');
let VehicleCollision = require('./VehicleCollision.js');
let EgoVehicleStatusExtended = require('./EgoVehicleStatusExtended.js');
let WoowaDillyStatus = require('./WoowaDillyStatus.js');
let MoraiTLIndex = require('./MoraiTLIndex.js');
let ERP42Info = require('./ERP42Info.js');
let EgoDdVehicleStatus = require('./EgoDdVehicleStatus.js');
let GVDirectCmd = require('./GVDirectCmd.js');
let SyncModeCmdResponse = require('./SyncModeCmdResponse.js');
let Conveyor = require('./Conveyor.js');
let ENU = require('./ENU.js');
let Competition = require('./Competition.js');
let ObjectStatusList = require('./ObjectStatusList.js');
let SyncModeCtrlCmd = require('./SyncModeCtrlCmd.js');
let DillyCmdResponse = require('./DillyCmdResponse.js');
let Obstacle = require('./Obstacle.js');
let MapSpecIndex = require('./MapSpecIndex.js');
let MapSpec = require('./MapSpec.js');
let MultiPlayEventRequest = require('./MultiPlayEventRequest.js');
let MoraiSimProcHandle = require('./MoraiSimProcHandle.js');
let SkateboardStatus = require('./SkateboardStatus.js');
let UGVServeSkidCtrlCmd = require('./UGVServeSkidCtrlCmd.js');
let RadarDetection = require('./RadarDetection.js');

module.exports = {
  EgoNoisyStatus: EgoNoisyStatus,
  GPSMessage: GPSMessage,
  SyncModeRemoveObject: SyncModeRemoveObject,
  FaultInjection_Response: FaultInjection_Response,
  ShipCtrlCmd: ShipCtrlCmd,
  NpcGhostInfo: NpcGhostInfo,
  EventInfo: EventInfo,
  GeoVector3Message: GeoVector3Message,
  Transforms: Transforms,
  SyncModeScenarioLoad: SyncModeScenarioLoad,
  MoraiSimProcStatus: MoraiSimProcStatus,
  SetTrafficLight: SetTrafficLight,
  ObjectStatus: ObjectStatus,
  FaultStatusInfo: FaultStatusInfo,
  MoraiTLInfo: MoraiTLInfo,
  FaultStatusInfo_Overall: FaultStatusInfo_Overall,
  ObjectStatusListExtended: ObjectStatusListExtended,
  MultiPlayEventResponse: MultiPlayEventResponse,
  CollisionData: CollisionData,
  FaultInjection_Controller: FaultInjection_Controller,
  EgoVehicleStatus: EgoVehicleStatus,
  RobotState: RobotState,
  VehicleSpecIndex: VehicleSpecIndex,
  IntscnTL: IntscnTL,
  RobotPose: RobotPose,
  SensorPosControl: SensorPosControl,
  PREvent: PREvent,
  FaultInjection_Tire: FaultInjection_Tire,
  RadarDetections: RadarDetections,
  IntersectionControl: IntersectionControl,
  GetTrafficLightStatus: GetTrafficLightStatus,
  GripperState: GripperState,
  MSITCustomMessage: MSITCustomMessage,
  ObjectStatusExtended: ObjectStatusExtended,
  SkateboardCtrlCmd: SkateboardCtrlCmd,
  PRStatus: PRStatus,
  NpcGhostCmd: NpcGhostCmd,
  DillyCmd: DillyCmd,
  ScenarioLoad: ScenarioLoad,
  SyncModeResultResponse: SyncModeResultResponse,
  GVStateCmd: GVStateCmd,
  MoraiSrvResponse: MoraiSrvResponse,
  SVADC: SVADC,
  DdCtrlCmd: DdCtrlCmd,
  GhostMessage: GhostMessage,
  WaitForTick: WaitForTick,
  Obstacles: Obstacles,
  FaultInjection_Sensor: FaultInjection_Sensor,
  CtrlCmd: CtrlCmd,
  ShipState: ShipState,
  FaultStatusInfo_Vehicle: FaultStatusInfo_Vehicle,
  RobotOutput: RobotOutput,
  SyncModeSetGear: SyncModeSetGear,
  FaultStatusInfo_Sensor: FaultStatusInfo_Sensor,
  ExternalForce: ExternalForce,
  VehicleSpec: VehicleSpec,
  RPY: RPY,
  IntersectionStatus: IntersectionStatus,
  WheelControl: WheelControl,
  SaveSensorData: SaveSensorData,
  EgoDetailStatus: EgoDetailStatus,
  SkidSteer6wUGVCtrlCmd: SkidSteer6wUGVCtrlCmd,
  TOF: TOF,
  ReplayInfo: ReplayInfo,
  ManipulatorControl: ManipulatorControl,
  CMDConveyor: CMDConveyor,
  VehicleCollisionData: VehicleCollisionData,
  XYZ: XYZ,
  Lamps: Lamps,
  MultiEgoSetting: MultiEgoSetting,
  AttachmentDeviceState: AttachmentDeviceState,
  SyncModeInfo: SyncModeInfo,
  TrafficLight: TrafficLight,
  VelocityCmd: VelocityCmd,
  SyncModeAddObject: SyncModeAddObject,
  SyncModeCmd: SyncModeCmd,
  SkidSteer6wUGVStatus: SkidSteer6wUGVStatus,
  PRCtrlCmd: PRCtrlCmd,
  WaitForTickResponse: WaitForTickResponse,
  VehicleCollision: VehicleCollision,
  EgoVehicleStatusExtended: EgoVehicleStatusExtended,
  WoowaDillyStatus: WoowaDillyStatus,
  MoraiTLIndex: MoraiTLIndex,
  ERP42Info: ERP42Info,
  EgoDdVehicleStatus: EgoDdVehicleStatus,
  GVDirectCmd: GVDirectCmd,
  SyncModeCmdResponse: SyncModeCmdResponse,
  Conveyor: Conveyor,
  ENU: ENU,
  Competition: Competition,
  ObjectStatusList: ObjectStatusList,
  SyncModeCtrlCmd: SyncModeCtrlCmd,
  DillyCmdResponse: DillyCmdResponse,
  Obstacle: Obstacle,
  MapSpecIndex: MapSpecIndex,
  MapSpec: MapSpec,
  MultiPlayEventRequest: MultiPlayEventRequest,
  MoraiSimProcHandle: MoraiSimProcHandle,
  SkateboardStatus: SkateboardStatus,
  UGVServeSkidCtrlCmd: UGVServeSkidCtrlCmd,
  RadarDetection: RadarDetection,
};
