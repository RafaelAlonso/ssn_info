require "date"
PATTERN = /^(?<gender>[1-2])\s?(?<year>[0-9]{2})\s?(?<month>0[1-9]|1[0-2])\s?(?<department>[0-9]{2})\s?[0-9]{3}\s?[0-9]{3}\s?(?<keys>[0-9]{2})$/

def french_ssn_info(ssn)
  return "The number is invalid" unless ssn.match?(PATTERN)
  # 1.Guardar as infos em uma variavel
  # 2.Gender, year, month, department, keys
  # 3.Fazer as transformacoes necessarias
  # 4.Checar se os dois ultimos digitos são o resto da divisao do ssn (sem os dois ultimos numeros) por 97
  # 5.Retornar uma string com as transformacoes feitas

  ssn_info = ssn.match(PATTERN)

  gender = ssn_info[:gender] == "1" ? "man" : "woman"
  year = "19#{ssn_info[:year]}"
  month = Date::MONTHNAMES[ssn_info[:month].to_i]
  department = ssn_info[:department]

  sub_int = (97 - ssn[0..-3].gsub(" ", "").to_i) % 97
  if sub_int == ssn_info[:keys].to_i
    return "a #{gender}, born in #{month}, #{year} in zipcode #{department}."
  else
    return "not a valid key"
  end

end
