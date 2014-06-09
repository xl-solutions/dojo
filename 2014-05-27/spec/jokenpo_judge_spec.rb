require_relative '../jokenpo_judge'

describe JokenpoJudge do

  subject {JokenpoJudge.new}

  it "papel deve ganhar de pedra" do
    expect(subject.judge("Pedra", "Papel")).to eq "Papel"
    expect(subject.judge("Papel", "Pedra")).to eq "Papel"
  end

  it "pedra deve ganhar de tesoura" do 
    expect(subject.judge("Pedra", "Tesoura")).to eq "Pedra"
    expect(subject.judge("Tesoura", "Pedra" )).to eq "Pedra"
  end

  it "tesoura deve ganhar de papel" do 
    expect(subject.judge("Papel", "Tesoura")).to eq "Tesoura"
    expect(subject.judge( "Tesoura", "Papel")).to eq "Tesoura"
  end

  it "deve dar empate com duas mãos iguais" do 
    expect(subject.judge("Pedra", "Pedra")).to eq "Empate"
  end

  it "só permite jogo com duas mãos" do
    expect{subject.judge("Pedra", "Pedra", "Tesoura")}.to raise_error InvalidParameterCountError
    expect{subject.judge("Pedra")}.to raise_error InvalidParameterCountError
    expect{subject.judge()}.to raise_error InvalidParameterCountError
  end

  it "não permite outros valores que não Pedra, Papel ou Tesoura" do
    expect{subject.judge("Preda", "Pepal")}.to raise_error InvalidHandError
    expect{subject.judge("Preda", "Papel")}.to raise_error InvalidHandError
  end

  it "deve desconsiderar capitalização" do
    expect(subject.judge("pedra", "papel")).to eq "Papel"
  end
end