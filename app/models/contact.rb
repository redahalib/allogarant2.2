class Contact < ApplicationRecord
  validates :email, presence: true
  validates :message, presence: true

  AUTHORIZED_WORDS = %w(étude etude loyer budget neuveu niece nièce étudiant etudiant logement location appartement caution garant residence fils enfant fille pere père mère mere frere frère soeur ville universit université ecole école lycee lycée)

  def allowed_msg
		rslt = AUTHORIZED_WORDS.map do |word|
			self.message.split.include?(word)
		end.uniq
		allowed_msg = rslt.include?(true)
	end
end
