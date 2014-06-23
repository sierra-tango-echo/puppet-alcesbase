require 'ipaddr'

module Puppet::Parser::Functions
  newfunction(:cidr, :type => :rvalue) do |args|
    IPAddr.new(args[0]).to_i.to_s(2).count("1") 
  end
end
