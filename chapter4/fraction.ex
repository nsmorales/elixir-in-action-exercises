defmodule Fraction do
  defstruct a: nil, b: nil

  def new(a, b) do
    %Fraction{a: a, b: b}
  end

  def value(%Fraction{a: a, b: b}) do
    a / b
  end

  def add(%Fraction{a: a, b: b}, %Fraction{a: a2, b: b2}) do
    new(a * b2 + a2 * b, b * b2)
  end
end
