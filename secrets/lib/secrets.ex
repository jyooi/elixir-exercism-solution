defmodule Secrets do
  def secret_add(secret) do
    fn inner_secret ->
      secret + inner_secret
    end
  end

  def secret_subtract(secret) do
    fn inner_secret ->
      inner_secret - secret
    end
  end

  def secret_multiply(secret) do
    fn inner_secret ->
      inner_secret * secret
    end
  end

  def secret_divide(secret) do
    fn inner_secret ->
      floor(inner_secret / secret)
    end
  end


  def secret_and(secret) do
    fn inner_secret ->
      Bitwise.&&&(inner_secret, secret)
    end
  end

  def secret_xor(secret) do
    fn inner_secret ->
      Bitwise.bxor(inner_secret,secret)
    end
  end

  def secret_combine(secret_function1, secret_function2) do
    fn number -> secret_function2.(secret_function1.(number)) end
  end
end
