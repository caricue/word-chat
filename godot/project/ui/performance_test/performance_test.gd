extends CanvasLayer


func _test() -> void:
	var start_time: float = Time.get_ticks_usec()
	
	var words: Array = ["1", "2", "3", "4", "5"]
	
	var end_time: float = Time.get_ticks_usec()
	
	var TOTAL_MILLISEONDS: float = (end_time - start_time) / 1000
	print("Found 5 nearest words " + str(words) + " in " + String.num(TOTAL_MILLISEONDS) + " ms.")

func _ready() -> void:
	_test()
