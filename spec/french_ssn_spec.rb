# spec/french_ssn_spec.rb
require_relative "../french_ssn"

describe "#french_ssn_info" do
  it "returns 'The number is invalid' when passed an empty string" do
    actual = french_ssn_info("")
    expected = "The number is invalid"
    expect(actual).to eq(expected)
  end

  it "returns 'The number is invalid' when passed an invalid ssn" do
    actual = french_ssn_info("677891 84 12 76 451 089 461238")
    expected = "The number is invalid"
    expect(actual).to eq(expected)
  end

  it "returns 'a man, born in December, 1984 in zipcode 76.' when passed '1 84 12 76 451 089 46'" do
    actual = french_ssn_info("1 84 12 76 451 089 46")
    expected = "a man, born in December, 1984 in zipcode 76."
    expect(actual).to eq(expected)
  end

  it "returns 'not a valid key' when passed an ssn with invalid digits" do
    actual = french_ssn_info("1 84 12 76 451 089 42")
    expected = "not a valid key"
    expect(actual).to eq(expected)
  end


end
