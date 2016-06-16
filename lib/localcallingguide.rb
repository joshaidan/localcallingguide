require "localcallingguide/version"
require 'open-uri'
require 'xmlsimple'

module LocalCallingGuide
  def get_results(url)
    data = open(url).read
    XmlSimple.xml_in(data, 'ForceArray' => false, 'KeyToSymbol' => false)
    # It would be nice to use KeyToSymbol but I have to figure out how to
    # handle hyphened keys, i.e. "company-name"
  end

  module_function :get_results

  class LocalExchange
    def self.prefixes(exch, dir=1, rconly=0)
      exch_data = LocalCallingGuide.get_results("http://www.localcallingguide.com/xmllocalexch.php?exch=#{exch}&dir=#{dir}&rconly=#{rconly}")
      exch_data['lca-data']['prefix']
    end
  end

  class LocalPrefix
    def self.prefixes(npa, nxx, dir=1)
      prefix_data = LocalCallingGuide.get_results("http://www.localcallingguide.com/xmllocalprefix.php?npa=#{npa}&nxx=#{nxx}&dir=#{dir}")
      prefix_data['lca-data']['prefix']
    end
  end

  class Prefix
    def self.npanxx(npa, nxx)
      prefix_data = LocalCallingGuide.get_results("http://www.localcallingguide.com/xmlprefix.php?npa=#{npa}&nxx=#{nxx}")
      prefix_data['prefixdata']
    end
  end

  class RateCentre
    def self.rate_centre(options)
      rc_data = LocalCallingGuide.get_results("http://www.localcallingguide.com/xmlrc.php?npa=#{options[:npa]}&rc=#{options[:rate_centre]}&region=#{options[:region]}&lata=#{options[:lata]}&lir=#{options[:lir]}&ocn=#{options[:ocn]}&udate=#{options[:udate]}")
      rc_data['rcdata']
    end
  end

  class Distance
    def self.rc_dist(npa1, nxx1, npa2, nxx2)
      dist_data = LocalCallingGuide.get_results("http://www.localcallingguide.com/xmlrcdist.php?npa1=#{npa1}&nxx1=#{nxx1}&npa2=#{npa2}&nxx2=#{nxx2}")
      dist_data['rcdist']
    end
  end
end
