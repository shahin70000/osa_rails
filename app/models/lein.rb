class Lein < ActiveRecord::Base
  belongs_to :lein_nom, foreign_key: :nom_id ,class_name: :nom
  belongs_to :lune, foreign_key: :lune_id, class_name: :nom
  belongs_to :un_duex, foreign_key: :un_duex_id, class_name: :nom
  
  belongs_to :rang, foreign_key: :rang_nom_id, class_name: :rang
end
