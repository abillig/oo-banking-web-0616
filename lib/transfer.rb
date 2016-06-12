require 'pry'

class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(person1, person2, amount)
    @sender = person1
    @receiver = person2
    @status = 'pending'
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid? 
  end

  def execute_transaction
    if sender.balance < @amount 
      @status='rejected'
      "Transaction rejected. Please check your account balance."
    else
    @sender.balance -= @amount
    @receiver.balance += @amount
    @status = 'complete'
    @original_amount = @amount
    @amount = 0
  end
  end

  def reverse_transfer
    if status == 'complete'
    @receiver.balance -=@original_amount
    @sender.balance+=@original_amount
    @status = 'reversed'
  end
  end

end
