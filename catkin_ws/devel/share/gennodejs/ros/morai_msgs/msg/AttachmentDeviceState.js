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

class AttachmentDeviceState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.sensor1 = null;
      this.sensor2 = null;
      this.sensor3 = null;
      this.sensor4 = null;
    }
    else {
      if (initObj.hasOwnProperty('sensor1')) {
        this.sensor1 = initObj.sensor1
      }
      else {
        this.sensor1 = 0;
      }
      if (initObj.hasOwnProperty('sensor2')) {
        this.sensor2 = initObj.sensor2
      }
      else {
        this.sensor2 = 0;
      }
      if (initObj.hasOwnProperty('sensor3')) {
        this.sensor3 = initObj.sensor3
      }
      else {
        this.sensor3 = 0;
      }
      if (initObj.hasOwnProperty('sensor4')) {
        this.sensor4 = initObj.sensor4
      }
      else {
        this.sensor4 = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type AttachmentDeviceState
    // Serialize message field [sensor1]
    bufferOffset = _serializer.int32(obj.sensor1, buffer, bufferOffset);
    // Serialize message field [sensor2]
    bufferOffset = _serializer.int32(obj.sensor2, buffer, bufferOffset);
    // Serialize message field [sensor3]
    bufferOffset = _serializer.int32(obj.sensor3, buffer, bufferOffset);
    // Serialize message field [sensor4]
    bufferOffset = _serializer.int32(obj.sensor4, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type AttachmentDeviceState
    let len;
    let data = new AttachmentDeviceState(null);
    // Deserialize message field [sensor1]
    data.sensor1 = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [sensor2]
    data.sensor2 = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [sensor3]
    data.sensor3 = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [sensor4]
    data.sensor4 = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'morai_msgs/AttachmentDeviceState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '28db62a0887dae3362a1a7153c82b912';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 sensor1
    int32 sensor2
    int32 sensor3
    int32 sensor4
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new AttachmentDeviceState(null);
    if (msg.sensor1 !== undefined) {
      resolved.sensor1 = msg.sensor1;
    }
    else {
      resolved.sensor1 = 0
    }

    if (msg.sensor2 !== undefined) {
      resolved.sensor2 = msg.sensor2;
    }
    else {
      resolved.sensor2 = 0
    }

    if (msg.sensor3 !== undefined) {
      resolved.sensor3 = msg.sensor3;
    }
    else {
      resolved.sensor3 = 0
    }

    if (msg.sensor4 !== undefined) {
      resolved.sensor4 = msg.sensor4;
    }
    else {
      resolved.sensor4 = 0
    }

    return resolved;
    }
};

module.exports = AttachmentDeviceState;
