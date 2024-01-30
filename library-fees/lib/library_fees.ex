defmodule LibraryFees do
  def datetime_from_string(string) do
    NaiveDateTime.from_iso8601!(string)
  end

  def before_noon?(datetime) do
  time = NaiveDateTime.to_time(datetime)

  case Time.compare(time , ~T"12:00:00Z") do
    :lt -> true
    :eq -> false
    :gt -> false
  end

  end
  def return_date(checkout_datetime) do
   before_noon = (24 * 60 * 60) * 28
   after_noon = (24 * 60 * 60) * 29

  calculated_seconds = case before_noon?(checkout_datetime) do
      true -> before_noon
      false -> after_noon
  end
  NaiveDateTime.to_date(NaiveDateTime.add(checkout_datetime,calculated_seconds))
  end


  def days_late(planned_return_date, actual_return_datetime) do
    # check wether the actual return date is before or after
    if Date.compare(planned_return_date , NaiveDateTime.to_date(actual_return_datetime)) == :gt or
      Date.compare(planned_return_date , NaiveDateTime.to_date(actual_return_datetime)) == :eq do
      0
    else
      Enum.count(Date.range(planned_return_date,NaiveDateTime.to_date(actual_return_datetime))) - 1
    end
  end

  def monday?(datetime) do
    Date.day_of_week(NaiveDateTime.to_date(datetime)) == 1
  end

  def calculate_late_fee(checkout, return, rate) do
    actual_return_date = datetime_from_string(return)
    planned_return_date = return_date(datetime_from_string(checkout))

    new_rate = if monday?(actual_return_date) do rate / 2 else rate end

    floor(days_late(planned_return_date,actual_return_date) * new_rate)

  end
end
