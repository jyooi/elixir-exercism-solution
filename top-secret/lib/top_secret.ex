defmodule TopSecret do
  def to_ast(string) do
    Code.string_to_quoted!(string)
  end

  def decode_secret_message_part({operation, _metadata, arguments} = node, acc)
      when operation in [:def, :defp] do
    {functiona_name, _, _} = List.first(arguments)
    {node, [Atom.to_string(functiona_name) | acc]}
  end

  def decode_secret_message_part(node, acc), do: {node, acc}

  def decode_secret_message(string) do
    # Please implement the decode_secret_message/1 function
  end
end
