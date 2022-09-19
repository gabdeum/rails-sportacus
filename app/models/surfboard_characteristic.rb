class SurfboardCharacteristic < ApplicationRecord
  SHAPES = ["Shortboard", "Fish", "Midlength", "Longboard", "Soft Top/Foamie",
    "Mini Mal/Funboard", "Egg/Mini Log", "Groveller", "Hybrid", "Retro",
    "Asymmetrical", "Finless", "Gun", "Semi Gun"].freeze
  FINS_SETUP = ["Single Fin", "Twinnie/2 Fin", "2+1/Sidebites", "Thruster/3 Fin", "Quad/4 Fin", "5 Fin"].freeze

  belongs_to :article

  validates :foot, :inch, :shape, presence: true
  validates :foot, :inch, :volume, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  enum :fins_setup, FINS_SETUP
  enum :shape, SHAPES
end
