// Auto-generated. Do not edit!

// (in-package hand_gesture_classifier.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class HandJointPos {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.t = null;
      this.x = null;
    }
    else {
      if (initObj.hasOwnProperty('t')) {
        this.t = initObj.t
      }
      else {
        this.t = 0.0;
      }
      if (initObj.hasOwnProperty('x')) {
        this.x = initObj.x
      }
      else {
        this.x = new Array(75).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type HandJointPos
    // Serialize message field [t]
    bufferOffset = _serializer.float64(obj.t, buffer, bufferOffset);
    // Check that the constant length array field [x] has the right length
    if (obj.x.length !== 75) {
      throw new Error('Unable to serialize array field x - length must be 75')
    }
    // Serialize message field [x]
    bufferOffset = _arraySerializer.float64(obj.x, buffer, bufferOffset, 75);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type HandJointPos
    let len;
    let data = new HandJointPos(null);
    // Deserialize message field [t]
    data.t = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [x]
    data.x = _arrayDeserializer.float64(buffer, bufferOffset, 75)
    return data;
  }

  static getMessageSize(object) {
    return 608;
  }

  static datatype() {
    // Returns string type for a message object
    return 'hand_gesture_classifier/HandJointPos';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '646eb86a127f34e71d16f8252e81874b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # This contains 3D locations of hand joints of length 75 and time .
    float64 t
    float64[75] x
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new HandJointPos(null);
    if (msg.t !== undefined) {
      resolved.t = msg.t;
    }
    else {
      resolved.t = 0.0
    }

    if (msg.x !== undefined) {
      resolved.x = msg.x;
    }
    else {
      resolved.x = new Array(75).fill(0)
    }

    return resolved;
    }
};

module.exports = HandJointPos;
