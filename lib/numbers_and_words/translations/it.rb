# frozen_string_literal: true

module NumbersAndWords
  module Translations
    class It < Base
      include NumbersAndWords::Translations::Families::Latin

      def ones(number, options = {})
        return if options[:is_one_thousand]

        return t('ones.apocopated') if number == 1 &&
                                       options[:is_apocopated]

        t('ones.not_apocopated')[number]
      end

      def tens_with_ones(numbers, _options = {})
        return [tens(numbers[1])[0..-2], ones(numbers[0])].join if ones(numbers[0]).match?(/^[aeiou]/)

        super numbers, separator: ''
      end

      def hundreds(number, _options = {})
        return t(:hundreds) if number == 1

        [ones(number), t(:hundreds)].join
      end

      def megs(capacity, options = {})
        if capacity == 1 && options[:number] == 1
          return t('thousands', count: 1)
        end

        super capacity, options
      end
    end
  end
end
