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
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class EgoDetailStatus {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.unique_id = null;
      this.front_left_location = null;
      this.front_right_location = null;
      this.rear_left_location = null;
      this.rear_right_location = null;
      this.turn_signal_lamp = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('unique_id')) {
        this.unique_id = initObj.unique_id
      }
      else {
        this.unique_id = 0;
      }
      if (initObj.hasOwnProperty('front_left_location')) {
        this.front_left_location = initObj.front_left_location
      }
      else {
        this.front_left_location = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('front_right_location')) {
        this.front_right_location = initObj.front_right_location
      }
      else {
        this.front_right_location = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('rear_left_location')) {
        this.rear_left_location = initObj.rear_left_location
      }
      else {
        this.rear_left_location = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('rear_right_location')) {
        this.rear_right_location = initObj.rear_right_location
      }
      else {
        this.rear_right_location = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('turn_signal_lamp')) {
        this.turn_signal_lamp = initObj.turn_signal_lamp
      }
      else {
        this.turn_signal_lamp = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type EgoDetailStatus
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [unique_id]
    bufferOffset = _serializer.int32(obj.unique_id, buffer, bufferOffset);
    // Serialize message field [front_left_location]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.front_left_location, buffer, bufferOffset);
    // Serialize message field [front_right_location]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.front_right_location, buffer, bufferOffset);
    // Serialize message field [rear_left_location]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.rear_left_location, buffer, bufferOffset);
    // Serialize message field [rear_right_location]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.rear_right_location, buffer, bufferOffset);
    // Serialize message field [turn_signal_lamp]
    bufferOffset = _serializer.uint8(obj.turn_signal_lamp, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type EgoDetailStatus
    let len;
    let data = new EgoDetailStatus(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [unique_id]
    data.unique_id = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [front_left_location]
    data.front_left_location = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [front_right_location]
    data.front_right_location = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [rear_left_location]
    data.rear_left_location = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [rear_right_location]
    data.rear_right_location = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [turn_signal_lamp]
    data.turn_signal_lamp = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 101;
  }

  static datatype() {
    // Returns string type for a message object
    return 'morai_msgs/EgoDetailStatus';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd27a205035704912eadcd8056b5dd496';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    int32 unique_id
    geometry_msgs/Point front_left_location
    geometry_msgs/Point front_right_location
    geometry_msgs/Point rear_left_location
    geometry_msgs/Point rear_right_location
    uint8 turn_signal_lamp
    
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
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new EgoDetailStatus(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.unique_id !== undefined) {
      resolved.unique_id = msg.unique_id;
    }
    else {
      resolved.unique_id = 0
    }

    if (msg.front_left_location !== undefined) {
      resolved.front_left_location = geometry_msgs.msg.Point.Resolve(msg.front_left_location)
    }
    else {
      resolved.front_left_location = new geometry_msgs.msg.Point()
    }

    if (msg.front_right_location !== undefined) {
      resolved.front_right_location = geometry_msgs.msg.Point.Resolve(msg.front_right_location)
    }
    else {
      resolved.front_right_location = new geometry_msgs.msg.Point()
    }

    if (msg.rear_left_location !== undefined) {
      resolved.rear_left_location = geometry_msgs.msg.Point.Resolve(msg.rear_left_location)
    }
    else {
      resolved.rear_left_location = new geometry_msgs.msg.Point()
    }

    if (msg.rear_right_location !== undefined) {
      resolved.rear_right_location = geometry_msgs.msg.Point.Resolve(msg.rear_right_location)
    }
    else {
      resolved.rear_right_location = new geometry_msgs.msg.Point()
    }

    if (msg.turn_signal_lamp !== undefined) {
      resolved.turn_signal_lamp = msg.turn_signal_lamp;
    }
    else {
      resolved.turn_signal_lamp = 0
    }

    return resolved;
    }
};

module.exports = EgoDetailStatus;
