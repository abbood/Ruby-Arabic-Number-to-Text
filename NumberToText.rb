class NumberToText

  def self.get_ala7ad(num_under2)
    f1 = ""
    case num_under2
      when 1
        f1 = "واحد"
      when 2
        f1 = "اثنان"
      when 3
        f1 = "ثلاثة"
      when 4
        f1 = "أربعة"
      when 5
        f1 = "خمسة"
      when 6
        f1 = "ستة"
      when 7
        f1 = "سبعة"
      when 8
        f1 = "ثمانية"
      when 9
        f1 = "تسعة"
      else
        f1 = "صفر"
    end
    f1
  end

  def self.get_al3asharat(num2)
    f2 = ""
    case num2
      when 1
        f2 = "عشرة"
      when 2
        f2 = "عشرون"
      when 3
        f2 = "ثلاثون"
      when 4
        f2 = "أربعون"
      when 5
        f2 = "خمسون"
      when 6
        f2 = "ستون"
      when 7
        f2 = "سبعون"
      when 8
        f2 = "ثمانون"
      when 9
        f2 = "تسعون"
      else
        f2 = "صفر"
    end
    f2
  end

  def self.get_almeaat(num3)
    f3 = ""
    case num3
      when 1
       f3 = "مائة"
      when 2
        f3 = "مائتان"
      when 3
        f3 = "ثلاثة مائة"
      when 4
        f3 = "أربعة مائة"
      when 5
        f3 = "خمسة مائة"
      when 6
        f3 = "ستة مائة"
      when 7
        f3 = "سبعة مائة"
      when 8
        f3 = "ثمان مائة"
      when 9
        f3 = "تسعة مائة"
      else
        f3 = "صفر"
    end
    f3
  end

  def self.get_aloloof(num4)
    f4 = ""
    case num4
      when 1
        f4 = "ألف"
      when 2
        f4 = "ألفان"
      when 3
        f4 = "ثلاثة آلاف"
      when 4
        f4 = "أربعة آلاف"
      when 5
        f4 = "خمسة آلاف"
      when 6
        f4 = "ستة آلاف"
      when 7
        f4 = "سبعة آلاف"
      when 8
        f4 = "ثمانية آلاف"
      when 9
        f4 = "تسعة آلاف"
      else
        f4 = "صفر"
    end
    f4
  end

  def self.get_3digits(num)
    return_value = ""

    f1, f2, f3 = "", "", ""
    num_under3, num3, num2, num_under2 = 0, 0, 0, 0

    if num.to_s.blank?
      num = "0"
    end

    number = num.to_s.to_i

    if number >= 0
      num3 = number / 100
      num_under3 = number %100
      num2  = num_under3.to_i/10
      num_under2 = num_under3%10
    end

    f1 = NumberToText.get_ala7ad(num_under2)
    f2 = NumberToText.get_al3asharat(num2)

    if num2 != 0
      if num2 == 1 && num_under2 !=0
        f1 = f1 + f2
      else
        if num_under2 != 0 && num2 != 0
          f1 = f1 + " و " + f2
        elsif num2!=0
          f1 = f2
        end
      end
    end

    f3 = NumberToText.get_almeaat(num3)

    if num3 > 0 && f1 !="صفر"
      f1 = f3 + " و " + f1
    end

    if num3 != 0 && num2 == 0 && num_under2 == 0
      f1 = f3
    end

    return_value = f1
    return_value
  end

  def self.get_4digits(num)
    return_value, f1, f2, f3, f4 = "", "", "", "", ""

    num_under4, num4, num_under3, num3, num2, num_under2 = 0,0,0,0,0,0

    if num.to_s.blank?
      num = '0'
    end

    number = num.to_i

    if number >= 0
      num4 = number / 1000
      num_under4 = number %1000
      num3 = num_under4 / 100
      num_under3 = number %100
      num2 = num_under3.to_i / 10
      num_under2 = num_under3%10
    end

    f1 = NumberToText.get_ala7ad(num_under2)
    f2 = NumberToText.get_al3asharat(num2)

    if num2 != 0
      if num2 == 1 && num_under2!= 0
        f1 = f1 + f2
      else
        if num_under2 !=0 && num2 != 0
          f1 = f1 + " و " + f2
        elsif num2!=0
          f1 = f2
        end
      end
    end

    f3 = get_almeaat(num3)

    if num3 > 0 && f1 != "صفر"
      f1 = f3 + " و " + f1
    end

    if num3 != 0 && num2 == 0 && num_under2 == 0
      f1 = f3
    end

    if num4 > 0
      f4 = NumberToText.get_aloloof(num4)
      if f1 != "صفر"
        f1 = f4 + " و " + f1
      else
        f1 = f4
      end
    end

    return_value = f1
    return return_value
  end


  # str_number and return_value are technically passed by value here
  # since everything is passed by value in ruby, the expectation here
  # is that str_number and return_value are each an array with a single
  # value, that's the value that we change here and this change is passed
  # on to the original variable that was used in the function call
  #
  # see http://stackoverflow.com/questions/9167401/ruby-and-references-working-with-fixnums
  # for more details
  #
  # @param str_number: an array with a single numerical value
  # @param return_value: an array with a single value
  def self.call_3digits(str_type, str_number, return_value)
    value = ""

    Rails.logger.info(":: this is str_number[0] #{str_number[0]}")

    if str_number[0].length > 0
      if str_number[0].length < 3
        str_number[0] = "000" + str_number[0]
        str_number[0] = str_number[0][str_number[0].length-3,3]
      end

      value = NumberToText.get_3digits(str_number[0][str_number[0].length-3,3])
      if value!= "صفر"
        value = value + str_type
      else
        value = ""
      end

      if return_value[0] !="صفر"
        if value != ""
          if return_value[0] !=""
            return_value[0] = value + " و " + return_value[0]
          else
            return_value[0] = value
          end
        end
      else
       return_value[0] = value
      end

      str_number[0] = str_number[0][0, str_number[0].length-3]
    end
  end

  def self.convert(str_number)
    str_thousand = " ألف "
    str_million = " مليون "
    str_milyar = " مليار "
    str_billion = " بليون "
    str_thousand_billion = " ألف بليون "
    str_million_billion = " مليون بليون "
    str_milyar_billion = " مليار بليون "
    str_billion_billion = " بليون بليون "

    return_value = ""

    if str_number.to_s == ""
      str_number = "0"
    end

    if str_number.length < 3
      str_number = "000" + str_number
      str_number = str_number[str_number.length-3,3]
    end

    if str_number.length == 4
      return_value = NumberToText.get_4digits(str_number)
    else
      return_value = NumberToText.get_3digits(str_number[str_number.length-3,3])
      str_number = str_number[0,str_number.length-3]

      return_value_by_ref = [return_value]
      str_number_by_ref = [str_number]

      NumberToText.call_3digits(str_thousand, str_number_by_ref, return_value_by_ref)
      NumberToText.call_3digits(str_million, str_number_by_ref, return_value_by_ref)
      NumberToText.call_3digits(str_milyar, str_number_by_ref, return_value_by_ref)
      NumberToText.call_3digits(str_billion, str_number_by_ref,return_value_by_ref)
      NumberToText.call_3digits(str_billion, str_number_by_ref,return_value_by_ref)
      NumberToText.call_3digits(str_thousand_billion, str_number_by_ref,return_value_by_ref)
      NumberToText.call_3digits(str_million_billion, str_number_by_ref,return_value_by_ref)
      NumberToText.call_3digits(str_milyar_billion, str_number_by_ref,return_value_by_ref)
      NumberToText.call_3digits(str_billion_billion, str_number_by_ref,return_value_by_ref)

      return_value = return_value_by_ref[0]
      str_number = str_number_by_ref[0]
    end
    return_value
  end

  def self.n_to_s(str_number)
    number = 0.00           # double
    before_point = 0        # Int64
    after_point = 0         # Int64
    return_value = ""       # String
    str_before_point = ""   # String
    int_index = 0           # int



      number = str_number.to_f
      before_point = number.to_i   # in original code (Int64)Number.. however in ruby
                                   # a fixnum (ie int32) is automatically converted to
                                   # a bignum (ie int64) as soon a the size of the variable is big enough
      str_before_point = before_point.to_s
      int_index = str_number.length - str_before_point.length
      if str_number.length > str_before_point.length
        after_point = str_number[str_number.length-int_index+1, int_index-1].to_i
      else
        after_point = 0
      end

      if before_point > 0
        return_value = NumberToText.convert(before_point.to_s)
      end

      if after_point != 0
        if return_value != 0
          return_value = return_value + " - " + " و " + NumberToText.convert(after_point.to_s) + " من " + NumberToText.convert((pow(10, int_index-1).to_int).to_s)
        else
          return_value = NumberToText.convert(after_point.to_s) + " من " + NumberToText.convert((NumberToText.pow(10, int_index-1).to_int).to_s)
        end
      end


    return_value
  end

  def self.pow(base,power)
    base**power
  end

end
