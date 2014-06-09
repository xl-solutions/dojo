class InvalidHandError < StandardError; end

class InvalidParameterCountError < StandardError; end


class JokenpoJudge

  VALID_OPTIONS = %w(papel pedra tesoura)
  RESULTS = {
    pedra:   :tesoura,
    tesoura: :papel,
    papel:   :pedra
  }


  def judge(*hands)
    hands.collect!(&:downcase)

    raise InvalidParameterCountError, "Deve conter 2 parâmetros" if hands.size != 2
    
    hands.each do |h| 
      raise InvalidHandError, "Hand #{h} is not defined" if !VALID_OPTIONS.include? h
    end

    if hands.first == hands.last
      'Empate'
    elsif RESULTS[hands[0].to_sym] == hands[1].to_sym
      hands[0].capitalize
    else 
      hands[1].capitalize
    end

  end

end