// Auto-generated. Do not edit!

// (in-package morai_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class MSITCustomMessage {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.position_x = null;
      this.position_y = null;
      this.position_z = null;
      this.velocity_x = null;
      this.velocity_y = null;
      this.velocity_z = null;
      this.acceleration_x = null;
      this.acceleration_y = null;
      this.acceleration_z = null;
      this.max_lateral_acceleration = null;
      this.yaw_angle = null;
      this.front_wheel_angle = null;
      this.throttle = null;
      this.brake = null;
      this.TTC = null;
      this.width = null;
      this.height = null;
      this.fallback_trigger = null;
      this.MRM_select_info = null;
      this.is_collision = null;
      this.way_off_distance = null;
      this.sur_way_off_distance = null;
    }
    else {
      if (initObj.hasOwnProperty('position_x')) {
        this.position_x = initObj.position_x
      }
      else {
        this.position_x = 0.0;
      }
      if (initObj.hasOwnProperty('position_y')) {
        this.position_y = initObj.position_y
      }
      else {
        this.position_y = 0.0;
      }
      if (initObj.hasOwnProperty('position_z')) {
        this.position_z = initObj.position_z
      }
      else {
        this.position_z = 0.0;
      }
      if (initObj.hasOwnProperty('velocity_x')) {
        this.velocity_x = initObj.velocity_x
      }
      else {
        this.velocity_x = 0.0;
      }
      if (initObj.hasOwnProperty('velocity_y')) {
        this.velocity_y = initObj.velocity_y
      }
      else {
        this.velocity_y = 0.0;
      }
      if (initObj.hasOwnProperty('velocity_z')) {
        this.velocity_z = initObj.velocity_z
      }
      else {
        this.velocity_z = 0.0;
      }
      if (initObj.hasOwnProperty('acceleration_x')) {
        this.acceleration_x = initObj.acceleration_x
      }
      else {
        this.acceleration_x = 0.0;
      }
      if (initObj.hasOwnProperty('acceleration_y')) {
        this.acceleration_y = initObj.acceleration_y
      }
      else {
        this.acceleration_y = 0.0;
      }
      if (initObj.hasOwnProperty('acceleration_z')) {
        this.acceleration_z = initObj.acceleration_z
      }
      else {
        this.acceleration_z = 0.0;
      }
      if (initObj.hasOwnProperty('max_lateral_acceleration')) {
        this.max_lateral_acceleration = initObj.max_lateral_acceleration
      }
      else {
        this.max_lateral_acceleration = 0.0;
      }
      if (initObj.hasOwnProperty('yaw_angle')) {
        this.yaw_angle = initObj.yaw_angle
      }
      else {
        this.yaw_angle = 0.0;
      }
      if (initObj.hasOwnProperty('front_wheel_angle')) {
        this.front_wheel_angle = initObj.front_wheel_angle
      }
      else {
        this.front_wheel_angle = 0.0;
      }
      if (initObj.hasOwnProperty('throttle')) {
        this.throttle = initObj.throttle
      }
      else {
        this.throttle = 0.0;
      }
      if (initObj.hasOwnProperty('brake')) {
        this.brake = initObj.brake
      }
      else {
        this.brake = 0.0;
      }
      if (initObj.hasOwnProperty('TTC')) {
        this.TTC = initObj.TTC
      }
      else {
        this.TTC = 0.0;
      }
      if (initObj.hasOwnProperty('width')) {
        this.width = initObj.width
      }
      else {
        this.width = 0.0;
      }
      if (initObj.hasOwnProperty('height')) {
        this.height = initObj.height
      }
      else {
        this.height = 0.0;
      }
      if (initObj.hasOwnProperty('fallback_trigger')) {
        this.fallback_trigger = initObj.fallback_trigger
      }
      else {
        this.fallback_trigger = false;
      }
      if (initObj.hasOwnProperty('MRM_select_info')) {
        this.MRM_select_info = initObj.MRM_select_info
      }
      else {
        this.MRM_select_info = 0;
      }
      if (initObj.hasOwnProperty('is_collision')) {
        this.is_collision = initObj.is_collision
      }
      else {
        this.is_collision = false;
      }
      if (initObj.hasOwnProperty('way_off_distance')) {
        this.way_off_distance = initObj.way_off_distance
      }
      else {
        this.way_off_distance = 0.0;
      }
      if (initObj.hasOwnProperty('sur_way_off_distance')) {
        this.sur_way_off_distance = initObj.sur_way_off_distance
      }
      else {
        this.sur_way_off_distance = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MSITCustomMessage
    // Serialize message field [position_x]
    bufferOffset = _serializer.float32(obj.position_x, buffer, bufferOffset);
    // Serialize message field [position_y]
    bufferOffset = _serializer.float32(obj.position_y, buffer, bufferOffset);
    // Serialize message field [position_z]
    bufferOffset = _serializer.float32(obj.position_z, buffer, bufferOffset);
    // Serialize message field [velocity_x]
    bufferOffset = _serializer.float32(obj.velocity_x, buffer, bufferOffset);
    // Serialize message field [velocity_y]
    bufferOffset = _serializer.float32(obj.velocity_y, buffer, bufferOffset);
    // Serialize message field [velocity_z]
    bufferOffset = _serializer.float32(obj.velocity_z, buffer, bufferOffset);
    // Serialize message field [acceleration_x]
    bufferOffset = _serializer.float32(obj.acceleration_x, buffer, bufferOffset);
    // Serialize message field [acceleration_y]
    bufferOffset = _serializer.float32(obj.acceleration_y, buffer, bufferOffset);
    // Serialize message field [acceleration_z]
    bufferOffset = _serializer.float32(obj.acceleration_z, buffer, bufferOffset);
    // Serialize message field [max_lateral_acceleration]
    bufferOffset = _serializer.float32(obj.max_lateral_acceleration, buffer, bufferOffset);
    // Serialize message field [yaw_angle]
    bufferOffset = _serializer.float32(obj.yaw_angle, buffer, bufferOffset);
    // Serialize message field [front_wheel_angle]
    bufferOffset = _serializer.float32(obj.front_wheel_angle, buffer, bufferOffset);
    // Serialize message field [throttle]
    bufferOffset = _serializer.float32(obj.throttle, buffer, bufferOffset);
    // Serialize message field [brake]
    bufferOffset = _serializer.float32(obj.brake, buffer, bufferOffset);
    // Serialize message field [TTC]
    bufferOffset = _serializer.float32(obj.TTC, buffer, bufferOffset);
    // Serialize message field [width]
    bufferOffset = _serializer.float32(obj.width, buffer, bufferOffset);
    // Serialize message field [height]
    bufferOffset = _serializer.float32(obj.height, buffer, bufferOffset);
    // Serialize message field [fallback_trigger]
    bufferOffset = _serializer.bool(obj.fallback_trigger, buffer, bufferOffset);
    // Serialize message field [MRM_select_info]
    bufferOffset = _serializer.int32(obj.MRM_select_info, buffer, bufferOffset);
    // Serialize message field [is_collision]
    bufferOffset = _serializer.bool(obj.is_collision, buffer, bufferOffset);
    // Serialize message field [way_off_distance]
    bufferOffset = _serializer.float32(obj.way_off_distance, buffer, bufferOffset);
    // Serialize message field [sur_way_off_distance]
    bufferOffset = _arraySerializer.float32(obj.sur_way_off_distance, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MSITCustomMessage
    let len;
    let data = new MSITCustomMessage(null);
    // Deserialize message field [position_x]
    data.position_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [position_y]
    data.position_y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [position_z]
    data.position_z = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [velocity_x]
    data.velocity_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [velocity_y]
    data.velocity_y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [velocity_z]
    data.velocity_z = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [acceleration_x]
    data.acceleration_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [acceleration_y]
    data.acceleration_y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [acceleration_z]
    data.acceleration_z = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [max_lateral_acceleration]
    data.max_lateral_acceleration = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [yaw_angle]
    data.yaw_angle = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [front_wheel_angle]
    data.front_wheel_angle = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [throttle]
    data.throttle = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [brake]
    data.brake = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [TTC]
    data.TTC = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [width]
    data.width = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [height]
    data.height = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [fallback_trigger]
    data.fallback_trigger = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [MRM_select_info]
    data.MRM_select_info = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [is_collision]
    data.is_collision = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [way_off_distance]
    data.way_off_distance = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [sur_way_off_distance]
    data.sur_way_off_distance = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.sur_way_off_distance.length;
    return length + 82;
  }

  static datatype() {
    // Returns string type for a message object
    return 'morai_msgs/MSITCustomMessage';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8f4eb9640f94fd0ad3eb006965c55b6b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 position_x
    float32 position_y
    float32 position_z
    float32 velocity_x
    float32 velocity_y
    float32 velocity_z
    float32 acceleration_x
    float32 acceleration_y
    float32 acceleration_z
    float32 max_lateral_acceleration
    float32 yaw_angle
    float32 front_wheel_angle
    float32 throttle
    float32 brake
    float32 TTC
    float32 width
    float32 height
    bool fallback_trigger
    int32 MRM_select_info
    bool is_collision
    float32 way_off_distance
    float32[] sur_way_off_distance
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MSITCustomMessage(null);
    if (msg.position_x !== undefined) {
      resolved.position_x = msg.position_x;
    }
    else {
      resolved.position_x = 0.0
    }

    if (msg.position_y !== undefined) {
      resolved.position_y = msg.position_y;
    }
    else {
      resolved.position_y = 0.0
    }

    if (msg.position_z !== undefined) {
      resolved.position_z = msg.position_z;
    }
    else {
      resolved.position_z = 0.0
    }

    if (msg.velocity_x !== undefined) {
      resolved.velocity_x = msg.velocity_x;
    }
    else {
      resolved.velocity_x = 0.0
    }

    if (msg.velocity_y !== undefined) {
      resolved.velocity_y = msg.velocity_y;
    }
    else {
      resolved.velocity_y = 0.0
    }

    if (msg.velocity_z !== undefined) {
      resolved.velocity_z = msg.velocity_z;
    }
    else {
      resolved.velocity_z = 0.0
    }

    if (msg.acceleration_x !== undefined) {
      resolved.acceleration_x = msg.acceleration_x;
    }
    else {
      resolved.acceleration_x = 0.0
    }

    if (msg.acceleration_y !== undefined) {
      resolved.acceleration_y = msg.acceleration_y;
    }
    else {
      resolved.acceleration_y = 0.0
    }

    if (msg.acceleration_z !== undefined) {
      resolved.acceleration_z = msg.acceleration_z;
    }
    else {
      resolved.acceleration_z = 0.0
    }

    if (msg.max_lateral_acceleration !== undefined) {
      resolved.max_lateral_acceleration = msg.max_lateral_acceleration;
    }
    else {
      resolved.max_lateral_acceleration = 0.0
    }

    if (msg.yaw_angle !== undefined) {
      resolved.yaw_angle = msg.yaw_angle;
    }
    else {
      resolved.yaw_angle = 0.0
    }

    if (msg.front_wheel_angle !== undefined) {
      resolved.front_wheel_angle = msg.front_wheel_angle;
    }
    else {
      resolved.front_wheel_angle = 0.0
    }

    if (msg.throttle !== undefined) {
      resolved.throttle = msg.throttle;
    }
    else {
      resolved.throttle = 0.0
    }

    if (msg.brake !== undefined) {
      resolved.brake = msg.brake;
    }
    else {
      resolved.brake = 0.0
    }

    if (msg.TTC !== undefined) {
      resolved.TTC = msg.TTC;
    }
    else {
      resolved.TTC = 0.0
    }

    if (msg.width !== undefined) {
      resolved.width = msg.width;
    }
    else {
      resolved.width = 0.0
    }

    if (msg.height !== undefined) {
      resolved.height = msg.height;
    }
    else {
      resolved.height = 0.0
    }

    if (msg.fallback_trigger !== undefined) {
      resolved.fallback_trigger = msg.fallback_trigger;
    }
    else {
      resolved.fallback_trigger = false
    }

    if (msg.MRM_select_info !== undefined) {
      resolved.MRM_select_info = msg.MRM_select_info;
    }
    else {
      resolved.MRM_select_info = 0
    }

    if (msg.is_collision !== undefined) {
      resolved.is_collision = msg.is_collision;
    }
    else {
      resolved.is_collision = false
    }

    if (msg.way_off_distance !== undefined) {
      resolved.way_off_distance = msg.way_off_distance;
    }
    else {
      resolved.way_off_distance = 0.0
    }

    if (msg.sur_way_off_distance !== undefined) {
      resolved.sur_way_off_distance = msg.sur_way_off_distance;
    }
    else {
      resolved.sur_way_off_distance = []
    }

    return resolved;
    }
};

module.exports = MSITCustomMessage;
