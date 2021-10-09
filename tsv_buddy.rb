# frozen_string_literal: true

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    tsv = tsv.split("\n")
    key = tsv[0].split("\t")
    @data = []

    tsv[1..].map do |line|
      @data << key.zip(line.split("\t")).to_h
    end
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    tsv = %W[date student_id languages best_language app_experience tech_experience\n].join("\t")
    @data.each do |line|
      record = [line['date'], line['student_id'], line['languages'], line['best_language'], line['app_experience'],
                line['tech_experience']].join("\t")
      tsv = "#{tsv}#{record}\n"
    end
    tsv
  end
end
