require('minitest/autorun')
require('minitest/rg')
require('pry-byebug')
require('colorize')
require_relative('../Picker.rb')

class PickerTest < Minitest::Test

    # *************** TASK 1 ***************

    def test_item_at_bay() # task 1
        test_result = item_at_bay("b5")
        actual_result = "nail filer"
        assert_equal(actual_result,test_result)
    end

    # *************** TASK 2 ***************

    def test_bay_for_item() # task 2
        test_result = bay_for_item("nail filer")
        actual_result = "b5"
        assert_equal(actual_result,test_result)
    end

    # *************** TASK 3 ***************

    def test_items_in_multibay() # task 3
        test_result = items_in_multibay("b5, b10, b6")
        actual_result = ["nail filer", "cookie jar", "tooth paste"]
        assert_equal(actual_result,test_result)
    end

    # *************** TASK 4 ***************

    def test_bays_for_multiitems() # task 4
        test_result = bays_for_multiitems("shoe lace, sharpie, hanger, rusty nail, leg warmers")
        actual_result = ["c9", "b2", "a4", "c1", "c10"]
        assert_equal(actual_result,test_result)
    end

    # *************** TASK 5 ***************

    def test_calculate_distance_between_bays() # task 5
        test_result = calculate_distance_between_bays("b5, b10, b6")
        actual_result = [["nail filer", "cookie jar", "tooth paste"], 5]
        assert_equal(actual_result,test_result)
    end

    def test_calculate_distance_between_bays2() # task 5
        test_result = calculate_distance_between_bays("b3, c7, c9, a3")
        actual_result = [["picture frame", "paint brush", "shoe lace", "blouse"], 15]
        assert_equal(actual_result,test_result)
    end

    # *************** TASK 6 ***************

    def test_order_bays_by_picking() # task 6
        test_result = order_bays_by_picking_from_items("shoe lace, rusty nail, leg warmers")
        actual_result = ["c1", "c9", "c10"]
        assert_equal(actual_result,test_result)
    end

    def test_order_bays_by_picking2() # task 6
        test_result = order_bays_by_picking_from_items("hanger, deodorant, candy wrapper, rubber band")
        actual_result = ["a10", "a4", "c8", "b9"]
        assert_equal(actual_result,test_result)
    end

    # *************** EXTRA ***************

    def test_print_collection_map() # task 5
        test_result = print_collection_map("b3, c7, c9, a3")
        actual_result = [["picture frame", "paint brush", "shoe lace", "blouse"], 15]
        assert_equal(actual_result,test_result)
    end

end
