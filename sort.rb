fname = "data.csv"
somefile = File.open(fname, "r")

data = {}

somefile.readlines.each { |line|
    tmp = line.chomp.split(",")

    for i in tmp
        data[tmp[1]] = tmp[0]
    end

}
somefile.close

puts data

data.sort_by { |a, b| a }

puts "*********"

puts data
