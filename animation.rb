MAX_POINTS = 100000
WIDTH = 120
HEIGHT = 16

def point(n, rounded = true)
    φ = n * @alpha * Math::PI / 180
    r = @scale * Math.sqrt(n)
    x = r * Math.cos(φ) + (WIDTH  / 2)
    y = r * Math.sin(φ) + (HEIGHT / 2)
    return rounded ? [x.round, y.round] : [x, y]
end

def within_bound(x, y)
    return !((x < 0) or (y < 0) or (x > WIDTH - 1) or (y > HEIGHT - 1))
end

(0...10000).each do |t|
    # Set values
    @alpha = 135.5 + (0.001 * t)
    @scale = 1.2
    # Create list of points
    points = Array.new(MAX_POINTS) { |n| point(n) }
    # Create canvas as an array of strings
    canvas = Array.new(HEIGHT) { " " * WIDTH }
    # Iterate through each point and add to canvas
    points.each { |x, y| canvas[y][x] = "#" if within_bound(x, y) }
    print `clear`, canvas.join("\n") + "\n"
    sleep(0.1)
end