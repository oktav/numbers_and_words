# frozen_string_literal: true

module NumbersAndWords
  module Strategies
    module FiguresConverter
      module Languages
        class It < Base
          def print_words
            @strings.reverse.join
          end

          def capacity_iteration
            super.compact
          end

          def ones
            super({ is_one_thousand: one_thousand?,
                    is_apocopated: one_apocopated? })
          end

          def megs
            super({ number: @figures.number_in_capacity(@current_capacity) })
          end

          private

          def one_thousand?
            @current_capacity&.odd? &&
              @figures.ones == 1 &&
              @figures.tens.nil? &&
              @figures.hundreds.nil?
          end

          def one_apocopated?
            @current_capacity&.positive? && @figures.ones == 1
          end
        end
      end
    end
  end
end
