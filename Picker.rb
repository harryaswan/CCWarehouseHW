
require('pry-byebug')

INVENTORY = {
    a: ["needle", "stop sign", "blouse", "hanger", "rubber duck", "shovel", "bookmark", "model car", "glow stick", "rubber band"],
    b: ["tyre swing", "sharpie", "picture frame", "photo album", "nail filer", "tooth paste", "bath fizzers", "deodorant", "tissue box", "cookie jar"],
    c: ["rusty nail", "drill press", "chalk", "word search", "thermometer", "face wash", "paint brush", "candy wrapper", "shoe lace", "leg warmers"]
}


def item_at_bay(bay)
    bay_split = bay.split(//, 2)
    return INVENTORY[bay_split[0].to_sym][bay_split[1].to_i - 1]
end

def bay_for_item(item)

    for x in INVENTORY.keys
        if item_index = find_item_index(x, item)
            return "#{x}#{item_index+1}"
        end
    end

end

def find_item_index(sym, item_string)
    if index = INVENTORY[sym].index(item_string)
        return index
    end
    return false
end

def items_in_multibay(bays)
    items_arr = []
    for x in bays.split(", ")
        items_arr << item_at_bay(x)
    end

    return items_arr
end

def bays_for_multiitems(items, arrange=true)
    bays_arr = []
    for x in items.split(", ")
        bays_arr << bay_for_item(x)
    end

    return group_by_bay(bays_arr, arrange)
end

def group_by_bay(arr, arrange=true)

    #puts arr

    alpha = ("a".."z").to_a

    bays = Array.new(3) { Array.new() }

    for x in arr
        bays[alpha.index(x.split(//, 2)[0])] << x
    end


    grouped_arr = []
    text = []

    x = 0
    until x >= bays.length
        text[x] = []
        if bays[x] != nil && bays[x] != []
            bays[x] = sort_arr(bays[x])
            for a in bays[x]
                grouped_arr << a
                text[x] << a
            end

        end
        x += 1
    end

    if arrange
        text[0] = []
        for a in bays[0].reverse()
            text[0] << a
        end
        #arr_text = "#{text[0]}#{text[2]}#{text[1]}"[0...-2]

        return [text[0],text[2],text[1]].flatten()
    else
        return grouped_arr
    end

end

def sort_arr(arr)

    swapped = true
    while swapped do
        swapped = false
        i = 0
        loop do
            if arr[i].split(//, 2)[1].to_i > arr[i+1].split(//, 2)[1].to_i
                # if arr[i].split(//, 2)[0] == arr[i+1].split(//, 2)[0]
                tmp = arr[i]
                arr[i] = arr[i+1]
                arr[i+1] = tmp
                swapped = true
                # end
            end
            break if i == arr.length - 2
            i += 1
        end
    end

    return arr

end



    #
    # bays_list = []
    #
    # for l in ["a".."z"]
    #     for n in [0..9]
    #         bays_list << "#{l}#{n}"
    #     end
    # end
    #
    #



# group_by_bay(["a1", "b1", "c1"])
#puts group_by_bay(["a1", "b6", "c3", "b10", "b1", "c1", "c2", "c10"])
