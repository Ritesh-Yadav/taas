module TaaS
  module Server
    module Helper

      def parse_output(output)
        output = extract_output(output)
        json_output = strip_output_tags(output)
        strip_brackets(json_output)
      end

      def extract_output(command_output)
        "#{command_output.match(/<TaaS Response Start>(.*)<TaaS Response Completed>/m)}"
      end

      def strip_brackets(string)
        string.gsub(/\{/, "").gsub(/\}/, "")
      end

      def strip_output_tags(string)
        string.gsub(/<TaaS Response Start>/, "").gsub(/<TaaS Response Completed>/, "")
      end

    end
  end
end