class String

  def paragraphize

    # David Lesches, 2012
    # Experimental method to capitalize the first letter in every sentence of a complete paragraph.

    downcase.sub(/\w/) { |v| v.upcase }.gsub(/\. \w/) { |v| v.upcase }
  end

end