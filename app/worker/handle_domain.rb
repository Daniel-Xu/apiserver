class HandleDomain
  @queue = :domain_info

  def self.perform(host, ip)
    domain = Domain.where(hostname: host).take
    if domain && ip
      domain.update_attributes(ip: ip)     
    end
  end
end
