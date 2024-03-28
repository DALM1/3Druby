require 'gosu'

class Globe < Gosu::Window
  def initialize
    super(1800, 600, false)
    self.caption = 'Globe 3D'
    @radius = 200
    @slices = 32
    @stacks = 16
    @rotation_x = 0
    @rotation_y = 0
  end

  # Charger la texture
  @texture = Gosu::Image.new('earth_texture.jpeg', retro: true)

  def update
    # Faire tourner le globe sur l'axe Y
    @rotation_y += 1

    # Faire tourner le globe sur l'axe X
    @rotation_x += 1
  end

  def draw
    draw_globe
  end

  private

  def draw_globe
    slices_step = 2 * Math::PI / @slices
    stacks_step = Math::PI / @stacks

    (0..@slices - 1).each do |i|
      theta1 = i * slices_step
      theta2 = (i + 1) * slices_step

      (0..@stacks - 1).each do |j|
        phi1 = j * stacks_step
        phi2 = (j + 1) * stacks_step

        x1, y1, z1 = rotate_point(@radius, theta1, phi1)
        x2, y2, z2 = rotate_point(@radius, theta2, phi1)
        x3, y3, z3 = rotate_point(@radius, theta1, phi2)
        x4, y4, z4 = rotate_point(@radius, theta2, phi2)

        # Dessiner les triangles
        draw_triangle(x1, y1, z1, x2, y2, z2, x3, y3, z3)
        draw_triangle(x2, y2, z2, x4, y4, z4, x3, y3, z3)
      end
    end
  end

  def rotate_point(radius, theta, phi)
    # Appliquer les rotations autour des axes Y et X
    x = radius * Math.cos(theta) * Math.sin(phi)
    y = radius * Math.sin(theta) * Math.sin(phi)
    z = radius * Math.cos(phi)

    # Centrer les coordonnées par rapport à la fenêtre
    x += width / 2
    y += height / 2

    # Retourner les nouvelles coordonnées
    [x, y, z]
  end

  def draw_triangle(x1, y1, z1, x2, y2, z2, x3, y3, z3)
    # Dessiner un triangle à partir de trois points
    Gosu.draw_triangle(x1, y1, Gosu::Color::WHITE, x2, y2, Gosu::Color::WHITE, x3, y3, Gosu::Color::WHITE)
  end
end

Globe.new.show
