defmodule DNA do
  def encode_nucleotide(code_point) do
    case code_point do
        code when code == ?A -> 1
        code when code == ?C -> 2
        code when code == ?G -> 4
        code when code == ?T -> 8
        code when code == ?\s -> 0
    end
  end


  def decode_nucleotide(encoded_code) do

    case encoded_code do
      1 -> ?A
      2 -> ?C
      4-> ?G
      8 -> ?T
      0 -> ?\s
      _ -> nil
    end

  end

  def encode(dna), do: do_encode(dna, <<>>)

  defp do_encode([],acc), do: acc ## either the intial_base_case or recursive_base_case i will return the accumulation bit_string , always define base case

  defp do_encode([head | tail], acc) do ## huge mistake when do pattern mathing on char list instead of [head , tail] -> [head | tail] <- this is the only correct way !!!!!!!!!!!!!!!!!!!
      encode_nucleotide_val = encode_nucleotide(head)
      do_encode( tail , <<acc::bitstring , encode_nucleotide_val::4>>) ## recursive function
  end

  def decode(dna), do: do_decode(dna, [])

  defp do_decode(<<>>,acc_bitstring), do: Enum.reverse(acc_bitstring) # define base case either the initial_base_case or recursive_base_case can be return the acc_bitstring

  defp do_decode(<<head::size(4), rest::bitstring>> , acc_bitstring) do

    decode_nucleotide_val = decode_nucleotide(head)
    do_decode(rest, [ acc_bitstring | decode_nucleotide_val]) # always remember combime char list also able to use pattern matching way to combine two list
  end

end
