require_relative 'helper'

class TestCheersIntegration < MiniTest::Unit::TestCase

  def test_1_name_with_no_vowel_like_characters
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts "BQT"
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's your name?
Give me a... B
Give me a... Q
Give me a... T
BQT's just GRAND!
EOS
    assert_equal expected_output, shell_output
  end

  def test_2_name_with_only_vowel_like_characters
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts "AHE"
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's your name?
Give me an.. A
Give me an.. H
Give me an.. E
AHE's just GRAND!
EOS
    assert_equal expected_output, shell_output
  end

  def test_3_name_sent_in_as_lowercase_letters
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts "jim"
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's your name?
Give me a... J
Give me an.. I
Give me an.. M
JIM's just GRAND!
EOS
    assert_equal expected_output, shell_output
  end

  def test_4_name_sent_in_as_mix_of_uppercase_and_lowercase_letters
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts "Sam"
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's your name?
Give me an.. S
Give me an.. A
Give me an.. M
SAM's just GRAND!
EOS
    assert_equal expected_output, shell_output
  end

end
