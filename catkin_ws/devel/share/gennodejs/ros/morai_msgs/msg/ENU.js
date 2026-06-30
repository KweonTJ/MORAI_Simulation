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

class ENU {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.east = null;
      this.north = null;
      this.up = null;
    }
    else {
      if (initObj.hasOwnProperty('east')) {
        this.east = initObj.east
      }
      else {
        this.east = 0.0;
      }
      if (initObj.hasOwnProperty('north')) {
        this.north = initObj.north
      }
      else {
        this.north = 0.0;
      }
      if (initObj.hasOwnProperty('up')) {
        this.up = initObj.up
      }
      else {
        this.up = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ENU
    // Serialize message field [east]
    bufferOffset = _serializer.float32(obj.east, buffer, bufferOffset);
    // Serialize message field [north]
    bufferOffset = _serializer.float32(obj.north, buffer, bufferOffset);
    // Serialize message field [up]
    bufferOffset = _serializer.float32(obj.up, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ENU
    let len;
    let data = new ENU(null);
    // Deserialize message field [east]
    data.east = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [north]
    data.north = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [up]
    data.up = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'morai_msgs/ENU';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c90797f354fb2a735756281dc238dc87';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 east
    float32 north
    float32 up
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ENU(null);
    if (msg.east !== undefined) {
      resolved.east = msg.east;
    }
    else {
      resolved.east = 0.0
    }

    if (msg.north !== undefined) {
      resolved.north = msg.north;
    }
    else {
      resolved.north = 0.0
    }

    if (msg.up !== undefined) {
      resolved.up = msg.up;
    }
    else {
      resolved.up = 0.0
    }

    return resolved;
    }
};

module.exports = ENU;
