// Auto-generated. Do not edit!

// (in-package morai_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class Competition {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.start_signal = null;
      this.team_name = null;
      this.mission_success = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('start_signal')) {
        this.start_signal = initObj.start_signal
      }
      else {
        this.start_signal = 0;
      }
      if (initObj.hasOwnProperty('team_name')) {
        this.team_name = initObj.team_name
      }
      else {
        this.team_name = '';
      }
      if (initObj.hasOwnProperty('mission_success')) {
        this.mission_success = initObj.mission_success
      }
      else {
        this.mission_success = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Competition
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [start_signal]
    bufferOffset = _serializer.uint8(obj.start_signal, buffer, bufferOffset);
    // Serialize message field [team_name]
    bufferOffset = _serializer.string(obj.team_name, buffer, bufferOffset);
    // Serialize message field [mission_success]
    bufferOffset = _serializer.bool(obj.mission_success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Competition
    let len;
    let data = new Competition(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [start_signal]
    data.start_signal = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [team_name]
    data.team_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [mission_success]
    data.mission_success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += _getByteLength(object.team_name);
    return length + 6;
  }

  static datatype() {
    // Returns string type for a message object
    return 'morai_msgs/Competition';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'bcb03cff40c27e30f70555863407010b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    uint8 start_signal
    string team_name 
    bool mission_success
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Competition(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.start_signal !== undefined) {
      resolved.start_signal = msg.start_signal;
    }
    else {
      resolved.start_signal = 0
    }

    if (msg.team_name !== undefined) {
      resolved.team_name = msg.team_name;
    }
    else {
      resolved.team_name = ''
    }

    if (msg.mission_success !== undefined) {
      resolved.mission_success = msg.mission_success;
    }
    else {
      resolved.mission_success = false
    }

    return resolved;
    }
};

module.exports = Competition;
