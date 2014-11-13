require_relative 'treasure_trove'
   
describe Treasure do
  
  before do
    @treasure = Treasure.new(:shinygem, 50)
  end
  
  it "has a name attribute" do
    expect(@treasure.name).to eq(:shinygem)
  end
  
  it "has a points attribute" do
    expect(@treasure.points).to eq(50)
  end
  
end

describe TreasureTrove do
  
  it "has six treasures" do
    #TreasureTrove::TREASURES.size.should == 6
    expect(TreasureTrove::TREASURES.size).to eq(6)
  end
  
  it "has a gem worth 5 points" do
    expect(TreasureTrove::TREASURES[0]).to eq(Treasure.new(:gem, 5))
  end
  
  it "has a blue gem worth 25 points" do
    expect(TreasureTrove::TREASURES[1]).to eq(Treasure.new(:bluegem, 25))
  end
  
  it "has a shiny gem worth 50 points" do
    expect(TreasureTrove::TREASURES[2]).to eq(Treasure.new(:shinygem, 50))
  end
  
  it "has a dragongem worth 100 points" do
    expect(TreasureTrove::TREASURES[3]).to eq(Treasure.new(:dragongem, 100))
  end

  it "has a ultragem worth 200 points" do
    expect(TreasureTrove::TREASURES[4]).to eq(Treasure.new(:ultragem, 200))
  end
  
  it "has a megagem worth 400 points" do
    expect(TreasureTrove::TREASURES[5]).to eq(Treasure.new(:megagem, 400))
  end

end