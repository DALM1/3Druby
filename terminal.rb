require 'gosu'

class GameWindow < Gosu::Window
  def initialize
    super 800, 600, fullscreen: false
    self.caption = "Ma scène 3D"
    @camera_x = @camera_y = @camera_z = 0
  end

  def update
    # Logique de mise à jour de la scène (si nécessaire)
  end

  def draw
    draw_quad(
      100, 100, Gosu::Color::RED,     # Coin supérieur gauche
      700, 100, Gosu::Color::GREEN,   # Coin supérieur droit
      700, 500, Gosu::Color::BLUE,    # Coin inférieur droit
      100, 500, Gosu::Color::WHITE,   # Coin inférieur gauche
      0                             # Z-order, la profondeur des couches (par défaut, tout est dessiné au même niveau)
    )
  end
end

window = GameWindow.new
window.show
