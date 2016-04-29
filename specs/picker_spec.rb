require('minitest/autorun')
require_relative('../Picker.rb')
class PickerTest < Minitest::Test

    def test_item_at_bay()
        test_result = item_at_bay("b5")
        actual_result = "nail filer"
        assert_equal(actual_result,test_result)
    end
    def test_bay_for_item()
        test_result = bay_for_item("nail filer")
        actual_result = "b5"
        assert_equal(actual_result,test_result)
    end
    def test_items_in_multibay()
        test_result = items_in_multibay("b5, b10, b6")
        actual_result = ["nail filer", "cookie jar", "tooth paste"]
        assert_equal(actual_result,test_result)
    end
    def test_bays_for_multiitems()
        test_result = bays_for_multiitems("shoe lace, rusty nail, leg warmers")
        actual_result = ["c1", "c9", "c10"]
        assert_equal(actual_result,test_result)
    end
    def test_array_sort()
        test_result = sort_arr(["b6", "b10", "b1", "c3", "c1", "c2", "c10"])
        actual_result = ["b1", "b6", "b10", "c1", "c2", "c3", "c10"]
        assert_equal(actual_result,test_result)
    end

end
