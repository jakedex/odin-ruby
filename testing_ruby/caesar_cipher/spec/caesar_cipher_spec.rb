require_relative '../lib/caesar_cipher'

describe '#caesar_cipher' do
  it 'takes two parameters' do
    expect(lambda {caesar_cipher("string", 1, 2)}).to raise_exception ArgumentError
  end

  it 'returns shifted string' do
    expect(caesar_cipher("What a string!", 5)).to eq("Bmfy f xywnsl!")
    expect(caesar_cipher("What a string!", 4)).to eq("Alex e wxvmrk!")
    expect(caesar_cipher("What a string!", 6)).to eq("Cngz g yzxotm!")
  end

  it 'retains capitalization of input' do
    expect(caesar_cipher("Caesar", 3)).to eq("Fdhvdu")
  end

  it "wraps characters past 'z'" do
    expect(caesar_cipher("caesar", 10)).to eq("mkockb")
  end

  it "doesn't shift non-alphabet characters" do
    expect(caesar_cipher("caesar, CAESAR!", 3)).to eql("fdhvdu, FDHVDU!")
  end
end
