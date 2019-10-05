extends Node

var frames = []
var powers = []

#warning-ignore:unused_class_variable
var SUPER_STRENGTH = "strength"
#warning-ignore:unused_class_variable
var JUMP = "jump"
#warning-ignore:unused_class_variable
var LASER = "laser"

var has_trident = false


func give_power(pwr):
	powers.append(pwr)

func has_power(pwr):
	return pwr in powers



func tie_together_frames():
    frames.remove(0)

    if len(frames) < 1:
        return

    var current = frames[0]
    if not current["target"].is_connected("finished_displaying", self, "tie_together_frames"):
      current["target"].connect("finished_displaying", self, "tie_together_frames")
    current["target"].callv(current["method"], current["args"])


func animated_scene(structure):
    # structure is
    # {target: [method, arg1, arg2, ...]}
    # Every animation must emit finished_displaying upon completion to be included in this chain

    frames = structure

    var current = frames[0]

    current["target"].connect("finished_displaying", self, "tie_together_frames")

    # begin executing the chain by calling the first item's method
    current["target"].callv(current["method"], current["args"])