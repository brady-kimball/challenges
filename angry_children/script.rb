# Code required to read in the values of k,n and candies.
lines = File.readlines('in.txt').map(&:to_i)
n = lines[0]
k = lines[1]
candy = lines[2..-1]

sorted = candy.sort
fairness = 1.0/0
window = []
max = []
min = []
p sorted
n.times do |i|
    num = sorted[i]
    window.push(num)
    if max.empty?
        max.push(num)
    end
    if min.empty?
        min.push(num)
    end
    until max.empty? || num <= max[-1]
        max.shift
    end
    min.shift until min.length <= k
    max.push(num)
    until num >= min[-1] || min.empty?
        min.shift
    end
    min.push(num)

    #pop

    if window.length > k
        num = window.shift
        if max[0] == num
            max.shift
        end
        if min[0] == num
            min.shift
        end
    end

    if window.length == k
        puts "--------"
        p "window: #{window}"
        p "min: #{min}"
        p "max: #{max}"
        temp = window.max - window.min
        fairness = temp if temp < fairness
    end

end

ans = fairness ## Compute answer from k, n, candies
puts ans
