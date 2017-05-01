module ApplicationHelper
  def avatar_url
      if current_user.nil?
        "http://www.kozlowskiefaria.adv.br/wp-content/uploads/2014/12/pessoa-anonima-300x300.png"
      elsif current_user.facebook_picture_url.nil?
        "http://www.kozlowskiefaria.adv.br/wp-content/uploads/2014/12/pessoa-anonima-300x300.png"

      else
        "http://www.kozlowskiefaria.adv.br/wp-content/uploads/2014/12/pessoa-anonima-300x300.png"
      end
  end
end
