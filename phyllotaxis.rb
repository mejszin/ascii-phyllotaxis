ALPHA = 135.5
SCALE = 1.3
MAX_POINTS = 1000000
WIDTH = 800
HEIGHT = 800

def point(n, rounded = true)
    φ = n * ALPHA * Math::PI / 180
    r = SCALE * Math.sqrt(n)
    x = r * Math.cos(φ) + (WIDTH  / 2)
    y = r * Math.sin(φ) + (HEIGHT / 2)
    return rounded ? [x.round, y.round] : [x, y]
end

def within_bound(x, y)
    return !((x < 0) or (y < 0) or (x > WIDTH - 1) or (y > HEIGHT - 1))
end

# Create list of points
points = Array.new(MAX_POINTS) { |n| point(n) }

# Create canvas as an array of strings
canvas = Array.new(HEIGHT) { " " * WIDTH }

# Iterate through each point and add to canvas
points.each { |x, y| canvas[y][x] = "#" if within_bound(x, y) }

# Write canvas to file
path = "./phyllotaxis_A#{ALPHA.to_s.gsub(".", "")}S#{SCALE.to_s.gsub(".", "")}.txt"
File.write(path, canvas.join("\n"))
puts "Successfully created file \"#{path}\""
