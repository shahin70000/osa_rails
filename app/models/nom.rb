class Nom < ActiveRecord::Base
  has_many :lein_nommees, foreign_key: :nom_id, class_name: :lein
  has_many :lein_lunes, foreign_key: :lune_id, class_name: :lein
  has_many :lein_un_duexs, foreign_key: :un_duex_id, class_name: :lein
  has_many :lein_rangs, foreign_key: :rang_nom_id, class_name: :lein
  
  has_many :rang_nommees, foreign_key: :nom_id, class_name: :rang
end