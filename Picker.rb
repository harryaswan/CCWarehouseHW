
require('pry-byebug')

INVENTORY = {
    a: ["needle", "stop sign", "blouse", "hanger", "rubber duck", "shovel", "bookmark", "model car", "glow stick", "rubber band"],
    b: ["tyre swing", "sharpie", "picture frame", "photo album", "nail filer", "tooth paste", "bath fizzers", "tissue box", "deodorant", "cookie jar"],
    c: ["rusty nail", "drill press", "chalk", "word search", "thermometer", "face wash", "paint brush", "candy wrapper", "shoe lace", "leg warmers"]
}


def item_at_bay(bay) # For task 1
    bay_split = bay.split(//, 2)
    return INVENTORY[bay_split[0].to_sym][bay_split[1].to_i - 1]
end

def bay_for_item(item) # For task 2
    for x in INVENTORY.keys
        if item_index = find_item_index(x, item)
            return "#{x}#{item_index+1}"
        end
    end
end

def items_in_multibay(bays) # For task 3
    items_arr = []
    if bays.is_a? String
        for x in bays.split(", ")
            items_arr << item_at_bay(x)
        end
    elsif bays.is_a? Array
        for x in bays
            items_arr << item_at_bay(x)
        end
    end
    return items_arr
end

def bays_for_multiitems(items) # For task 4
    bays_arr = []
    if items.is_a? String
        for x in items.split(", ")
            bays_arr << bay_for_item(x)
        end
    elsif items.is_a? Array
        for x in items
            bays_arr << bay_for_item(x)
        end
    end
    return bays_arr

    # could be grouped by bay by calling:
    # return group_by_bay(bays_arr, false)
end

def calculate_distance_between_bays(bays_as_string) # For task 5
    items = items_in_multibay(bays_as_string)
    bays = bays_for_multiitems(items)
    return [items, calc_dist_bays(bays)]
end

def order_bays_by_picking(items_as_string)
    bays = bays_for_multiitems(items_as_string)
    return group_by_bay(bays)
    return
end

# *************************
# Below is the extra function I created to aid in the functionality of the fucions above
# *************************

def group_by_bay(arr, arrange=true)
# the arrange value determines if the program is to output
# the values in the order that they are to be found or just grouped
# by the rack letter. The default action is to arrange them in the
# order you would find them (a10 - a1, c1 - c10, b1 - b10)

    alpha = ("a".."z").to_a

    bays = Array.new(3) { Array.new() }

    for x in arr
        bays[alpha.index(x.split(//, 2)[0])] << x
    end


    grouped_arr = []

    x = 0
    until x >= bays.length
        if bays[x] != nil && bays[x] != []
            bays[x] = sort_arr(bays[x])
            for a in bays[x]
                grouped_arr << a
            end

        end
        x += 1
    end

    if arrange
        temp_for_a = []
        for a in bays[0].reverse()
            temp_for_a << a
        end
        return [temp_for_a,bays[2],bays[1]].flatten()
    else
        return grouped_arr
    end

end


def find_item_index(sym, item_string)
    if index = INVENTORY[sym].index(item_string)
        return index
    end
    return false
end


def sort_arr(arr)

    swapped = true
    while swapped do
        swapped = false
        # i = 0
        # loop do
        for i in 0..(arr.length - 2)
            if arr[i].split(//, 2)[1].to_i > arr[i+1].split(//, 2)[1].to_i
                # if arr[i].split(//, 2)[0] == arr[i+1].split(//, 2)[0]
                tmp = arr[i]
                arr[i] = arr[i+1]
                arr[i+1] = tmp
                swapped = true
                # end
            end
            # break if i == arr.length - 2
        end
    end

    return arr

end





def calc_dist_bays(bays_list)
    bays_name_list = []

    for n in 1..10
        bays_name_list << "a#{n}"
    end

    bays_name_list = bays_name_list.reverse()

    for l in ["c", "b"]
        for n in 1..10
            bays_name_list << "#{l}#{n}"
        end
    end

    for l in "d".."z"
        for n in 1..10
            bays_name_list << "#{l}#{n}"
        end
    end


    bay_index_list = []

    for x in bays_list
        bay_index_list << bays_name_list.index(x)
    end

    return (bay_index_list.max - bay_index_list.min)

end
