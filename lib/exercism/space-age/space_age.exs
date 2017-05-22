defmodule SpaceAge do
  @earth_year 31557600

  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :uranus | :neptune

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(:earth, seconds),   do: calculate_age(1, seconds)
  def age_on(:mercury, seconds), do: calculate_age(0.2408467, seconds)
  def age_on(:venus, seconds),   do: calculate_age(0.61519726, seconds)
  def age_on(:mars, seconds),    do: calculate_age(1.8808158, seconds)
  def age_on(:jupiter, seconds), do: calculate_age(11.862615, seconds)
  def age_on(:saturn, seconds),  do: calculate_age(29.447498, seconds)
  def age_on(:uranus, seconds),  do: calculate_age(84.016846, seconds)
  def age_on(:neptune, seconds), do: calculate_age(164.79132, seconds)

  defp calculate_age(k, seconds), do: seconds / (k * @earth_year)
end
