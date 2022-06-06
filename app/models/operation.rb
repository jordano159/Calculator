class Operation
    include ActiveModel::Model

    attr_accessor(:operand_one, :operand_two, :operation, :result)

    validates :operand_one, :operand_two, :operation, presence: true
    validates :operation, inclusion: { 
        in: %w(+ - * /), 
        message: "%{value} is not a valid operation" 
    }

    def self.build(*args)
        one, op, two = args.flatten.map(&:chomp).reject(&:blank?).take(3)
        new(operand_one: one&.to_i, operand_two: two&.to_i, operation: op)
    end

    def calculate!
        __send__(operation.to_s)
    end
    
end