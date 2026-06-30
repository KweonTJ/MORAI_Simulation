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

class GripperState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.release_limit = null;
      this.grip_limit = null;
    }
    else {
      if (initObj.hasOwnProperty('release_limit')) {
        this.release_limit = initObj.release_limit
      }
      else {
        this.release_limit = false;
      }
      if (initObj.hasOwnProperty('grip_limit')) {
        this.grip_limit = initObj.grip_limit
      }
      else {
        this.grip_limit = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GripperState
    // Serialize message field [release_limit]
    bufferOffset = _serializer.bool(obj.release_limit, buffer, bufferOffset);
    // Serialize message field [grip_limit]
    bufferOffset = _serializer.bool(obj.grip_limit, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GripperState
    let len;
    let data = new GripperState(null);
    // Deserialize message field [release_limit]
    data.release_limit = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [grip_limit]
    data.grip_limit = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 2;
  }

  static datatype() {
    // Returns string type for a message object
    return 'morai_msgs/GripperState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'fc4558688d7d357989e10d3f6df1fa69';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool release_limit
    bool grip_limit
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GripperState(null);
    if (msg.release_limit !== undefined) {
      resolved.release_limit = msg.release_limit;
    }
    else {
      resolved.release_limit = false
    }

    if (msg.grip_limit !== undefined) {
      resolved.grip_limit = msg.grip_limit;
    }
    else {
      resolved.grip_limit = false
    }

    return resolved;
    }
};

module.exports = GripperState;
