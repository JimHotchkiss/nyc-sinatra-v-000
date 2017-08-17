class Title <ActiveRecord::Base
  has_many :figures
  has_many :figure_titles, through: 'figures'

end
