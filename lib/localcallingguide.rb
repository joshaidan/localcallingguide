require "localcallingguide/version"
require 'open-uri'
require 'xmlsimple'

module LocalCallingGuide

  def self.get_results(url)
    data = open(url).read
    return XmlSimple.xml_in(data, { 'ForceArray' => false })
  end

  class LocalExchange
    def self.prefixes(exch, dir=1, rconly=0)
      exch_data = LocalCallingGuide.get_results("http://www.localcallingguide.com/xmllocalexch.php?exch=#{exch}&dir=#{dir}&rconly=#{rconly}")
      return exch_data['lca-data']['prefix']
    end
  end

  class LocalPrefix
    def self.prefixes(npa, nxx, dir=1)
      prefix_data = LocalCallingGuide.get_results("http://www.localcallingguide.com/xmllocalprefix.php?npa=#{npa}&nxx=#{nxx}&dir=#{dir}")
      return prefix_data['lca-data']['prefix']
    end
  end

  class Prefix
    def self.npanxx(npa, nxx)
      prefix_data = LocalCallingGuide.get_results("http://www.localcallingguide.com/xmlprefix.php?npa=#{npa}&nxx=#{nxx}")
      return prefix_data['prefixdata']
    end
  end

  class RateCentre
    def self.rate_centre(options)
      rc_data = LocalCallingGuide.get_results("http://www.localcallingguide.com/xmlrc.php?npa=#{options[:npa]}&rc=#{options[:rate_centre]}&region=#{options[:region]}&lata=#{options[:lata]}&lir=#{options[:lir]}&ocn=#{options[:ocn]}&udate=#{options[:udate]}")
      return rc_data['rcdata']
    end
  end

  class Distance
    def self.rc_dist(npa1, nxx1, npa2, nxx2)
      dist_data = LocalCallingGuide.get_results("http://www.localcallingguide.com/xmlrcdist.php?npa1=#{npa1}&nxx1=#{nxx1}&npa2=#{npa1}&nxx2=#{nxx2}")
      return dist_data['rcdist']
    end
  end

end
