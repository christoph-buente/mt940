class MT940::Triodos < MT940::Base

  def self.determine_bank(*args)
    self if args[0].match(/^:20:/) && args[1] && args[1].match(/^:25:TRIODOSBANK/)
  end

  def parse_contra_account
    if @transaction && @transaction.description.match(/\d+(\d{9})$/)
      @transaction.contra_account = $1.rjust(9, '000000000')
      @transaction.description = ''
    end
  end

end
