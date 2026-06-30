// Auto-generated. Do not edit!

// (in-package morai_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let ENU = require('./ENU.js');
let RPY = require('./RPY.js');
let XYZ = require('./XYZ.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class EgoNoisyStatus {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.noisy_position = null;
      this.noisy_orientation = null;
      this.noisy_enu_velocity = null;
      this.noisy_velocity = null;
      this.noisy_angularVelocity = null;
      this.noisy_acceleration = null;
      this.accel = null;
      this.brake = null;
      this.steer = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('noisy_position')) {
        this.noisy_position = initObj.noisy_position
      }
      else {
        this.noisy_position = new ENU();
      }
      if (initObj.hasOwnProperty('noisy_orientation')) {
        this.noisy_orientation = initObj.noisy_orientation
      }
      else {
        this.noisy_orientation = new RPY();
      }
      if (initObj.hasOwnProperty('noisy_enu_velocity')) {
        this.noisy_enu_velocity = initObj.noisy_enu_velocity
      }
      else {
        this.noisy_enu_velocity = new ENU();
      }
      if (initObj.hasOwnProperty('noisy_velocity')) {
        this.noisy_velocity = initObj.noisy_velocity
      }
      else {
        this.noisy_velocity = new XYZ();
      }
      if (initObj.hasOwnProperty('noisy_angularVelocity')) {
        this.noisy_angularVelocity = initObj.noisy_angularVelocity
      }
      else {
        this.noisy_angularVelocity = new RPY();
      }
      if (initObj.hasOwnProperty('noisy_acceleration')) {
        this.noisy_acceleration = initObj.noisy_acceleration
      }
      else {
        this.noisy_acceleration = new XYZ();
      }
      if (initObj.hasOwnProperty('accel')) {
        this.accel = initObj.accel
      }
      else {
        this.accel = 0.0;
      }
      if (initObj.hasOwnProperty('brake')) {
        this.brake = initObj.brake
      }
      else {
        this.brake = 0.0;
      }
      if (initObj.hasOwnProperty('steer')) {
        this.steer = initObj.steer
      }
      else {
        this.steer = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type EgoNoisyStatus
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [noisy_position]
    bufferOffset = ENU.serialize(obj.noisy_position, buffer, bufferOffset);
    // Serialize message field [noisy_orientation]
    bufferOffset = RPY.serialize(obj.noisy_orientation, buffer, bufferOffset);
    // Serialize message field [noisy_enu_velocity]
    bufferOffset = ENU.serialize(obj.noisy_enu_velocity, buffer, bufferOffset);
    // Serialize message field [noisy_velocity]
    bufferOffset = XYZ.serialize(obj.noisy_velocity, buffer, bufferOffset);
    // Serialize message field [noisy_angularVelocity]
    bufferOffset = RPY.serialize(obj.noisy_angularVelocity, buffer, bufferOffset);
    // Serialize message field [noisy_acceleration]
    bufferOffset = XYZ.serialize(obj.noisy_acceleration, buffer, bufferOffset);
    // Serialize message field [accel]
    bufferOffset = _serializer.float32(obj.accel, buffer, bufferOffset);
    // Serialize message field [brake]
    bufferOffset = _serializer.float32(obj.brake, buffer, bufferOffset);
    // Serialize message field [steer]
    bufferOffset = _serializer.float32(obj.steer, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type EgoNoisyStatus
    let len;
    let data = new EgoNoisyStatus(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [noisy_position]
    data.noisy_position = ENU.deserialize(buffer, bufferOffset);
    // Deserialize message field [noisy_orientation]
    data.noisy_orientation = RPY.deserialize(buffer, bufferOffset);
    // Deserialize message field [noisy_enu_velocity]
    data.noisy_enu_velocity = ENU.deserialize(buffer, bufferOffset);
    // Deserialize message field [noisy_velocity]
    data.noisy_velocity = XYZ.deserialize(buffer, bufferOffset);
    // Deserialize message field [noisy_angularVelocity]
    data.noisy_angularVelocity = RPY.deserialize(buffer, bufferOffset);
    // Deserialize message field [noisy_acceleration]
    data.noisy_acceleration = XYZ.deserialize(buffer, bufferOffset);
    // Deserialize message field [accel]
    data.accel = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [brake]
    data.brake = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [steer]
    data.steer = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 84;
  }

  static datatype() {
    // Returns string type for a message object
    return 'morai_msgs/EgoNoisyStatus';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '93b556ef5e38f8da38c67217e4fe4664';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    
    morai_msgs/ENU noisy_position
    morai_msgs/RPY noisy_orientation
    morai_msgs/ENU noisy_enu_velocity
    morai_msgs/XYZ noisy_velocity
    morai_msgs/RPY noisy_angularVelocity
    morai_msgs/XYZ noisy_acceleration
    
    float32 accel
    float32 brake
    float32 steer
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    ================================================================================
    MSG: morai_msgs/ENU
    float32 east
    float32 north
    float32 up
    
    ================================================================================
    MSG: morai_msgs/RPY
    float32 roll
    float32 pitch
    float32 yaw
    
    ================================================================================
    MSG: morai_msgs/XYZ
    float32 x
    float32 y
    float32 z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new EgoNoisyStatus(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.noisy_position !== undefined) {
      resolved.noisy_position = ENU.Resolve(msg.noisy_position)
    }
    else {
      resolved.noisy_position = new ENU()
    }

    if (msg.noisy_orientation !== undefined) {
      resolved.noisy_orientation = RPY.Resolve(msg.noisy_orientation)
    }
    else {
      resolved.noisy_orientation = new RPY()
    }

    if (msg.noisy_enu_velocity !== undefined) {
      resolved.noisy_enu_velocity = ENU.Resolve(msg.noisy_enu_velocity)
    }
    else {
      resolved.noisy_enu_velocity = new ENU()
    }

    if (msg.noisy_velocity !== undefined) {
      resolved.noisy_velocity = XYZ.Resolve(msg.noisy_velocity)
    }
    else {
      resolved.noisy_velocity = new XYZ()
    }

    if (msg.noisy_angularVelocity !== undefined) {
      resolved.noisy_angularVelocity = RPY.Resolve(msg.noisy_angularVelocity)
    }
    else {
      resolved.noisy_angularVelocity = new RPY()
    }

    if (msg.noisy_acceleration !== undefined) {
      resolved.noisy_acceleration = XYZ.Resolve(msg.noisy_acceleration)
    }
    else {
      resolved.noisy_acceleration = new XYZ()
    }

    if (msg.accel !== undefined) {
      resolved.accel = msg.accel;
    }
    else {
      resolved.accel = 0.0
    }

    if (msg.brake !== undefined) {
      resolved.brake = msg.brake;
    }
    else {
      resolved.brake = 0.0
    }

    if (msg.steer !== undefined) {
      resolved.steer = msg.steer;
    }
    else {
      resolved.steer = 0.0
    }

    return resolved;
    }
};

module.exports = EgoNoisyStatus;
