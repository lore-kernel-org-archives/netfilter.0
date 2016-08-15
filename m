From: "Walter H." <Walter.H@mathemainzel.info>
Subject: NAT plus FILTER
Date: Mon, 15 Aug 2016 20:29:45 +0200
Message-ID: <57B20A19.4030105@mathemainzel.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mathemainzel.info; s=dkim11;
	h=Content-Transfer-Encoding:Content-Type:Subject:To:MIME-Version:From:Date:Message-ID; bh=QeYjpDcMnVDPavmTop5UwEcQifiHtNjMh/A+QDx+17I=;
	b=TNAMKlkk6GmEkx1qewsCqWuKNJZZ9h06/RTFz1sOvlzz6kWOajDr0D73R/ScoaCDYqkrktMmC6+uUMENaa2E+tnRFl1YAhL3W4cNeeOENRysRWf1ntfEWjm+GhvixX4j0yl8w01wpAZU36p+d9aRskTjBAYt2to9WIdAMrIOi9I=;
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

I have a CentOS Box as NAT-Router;

2 interfaces, eth1 (WAN, this port should be NATed) and br0 (LAN, switch 
over eth0 and wlan0)
a IPv4-to-IPv6 tunnel device sit1

in /etc/sysconfig/iptables I have the following

<begin /etc/sysconfig/iptables>

*nat
:PREROUTING ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]

# NAT: Establish NAT
-A POSTROUTING -o eth1 -s 192.168.241.0/24 -j SNAT --to 192.168.128.127

# NAT: Port-Forwarding
-A PREROUTING -i eth1 -p tcp --dport 80 -j DNAT --to 192.168.241.211:80
-A PREROUTING -i eth1 -p tcp --dport 443 -j DNAT --to 192.168.241.211:443

COMMIT

*filter
:INPUT DROP [0:0]
:FORWARD DROP [0:0]
:OUTPUT DROP [0:0]

# Allow anything on the local link
-A INPUT -i lo -j ACCEPT
-A OUTPUT -o lo -j ACCEPT

# Allow anything out on the localnet
-A OUTPUT -o br0 -j ACCEPT
# Allow established, related packets back in
-A INPUT -i br0 -m state --state ESTABLISHED,RELATED -j ACCEPT

# Enable DHCP
-A INPUT -i br0 -p udp --dport 67:68 --sport 67:68 -j ACCEPT

# Enable IPv6
-A INPUT -p ipv6 -i eth1 -s 216.66.80.30 -j ACCEPT
-A OUTPUT -p ipv6 -o eth1 -d 216.66.80.30 -j ACCEPT

# Allow SSH from LAN
-A INPUT -i br0 -s 192.168.241.192/26 -m tcp -p tcp --dport 22 -m state --state NEW -j ACCEPT

# Allow anything out on the internet
-A OUTPUT -o eth1 -p tcp -j ACCEPT
-A OUTPUT -o eth1 -p udp -j ACCEPT
-A OUTPUT -o eth1 -p icmp -j ACCEPT
# Allow established, related packets back in
-A INPUT -i eth1 -p tcp -m state --state ESTABLISHED,RELATED -j ACCEPT
-A INPUT -i eth1 -p udp -m state --state ESTABLISHED,RELATED -j ACCEPT

[question1] could the above be also this
{ -A OUTPUT -o eth1 -j ACCEPT
   -A INPUT -i eth1 -m state --state ESTABLISHED,RELATED -j ACCEPT }

# Allow Forwarding to WAN interface
-A FORWARD -i br0 -o eth1 -j ACCEPT
# Allow established, related packets back through
-A FORWARD -i eth1 -o br0 -m state --state ESTABLISHED,RELATED -j ACCEPT
-A FORWARD -i eth1 -o br0 -j LOG  --log-prefix "IP[FWD-Reply]: " --log-level 7

# Only the lan is allowed to ping me without restriction
-A INPUT -i br0 -p icmp -j ACCEPT
# Else only pings with restricted icmp are allowed
-A INPUT -i eth1 -p icmp -m limit --limit 2/sec --limit-burst 4 -j ACCEPT

# Enable TRACEroute to me from LAN
-I INPUT -i br0 -p udp --sport 32769:65535 --dport 33434:33523 -j ACCEPT
# Enable TRACEroute to me from internet
-I INPUT -i eth1 -p udp --sport 32769:65535 --dport 33434:33523 -j ACCEPT

# Enable PORT-Forwarding
-I FORWARD -i eth1 -o br0 -d 192.168.241.211 -m tcp -p tcp --dport 80 -j ACCEPT
-I FORWARD -i eth1 -o br0 -d 192.168.241.211 -m tcp -p tcp --dport 443 -j ACCEPT
[question2] why doesn't this work; the ports in nat part don't work ...

# Log all other
-A INPUT -j LOG --log-prefix "IP[IN]: " --log-level 7
-A FORWARD -j LOG  --log-prefix "IP[FWD]: " --log-level 7
-A OUTPUT -j LOG  --log-prefix "IP[OUT]: " --log-level 7

COMMIT
<end /etc/sysconfig/iptables>

<begin /etc/sysconfig/ip6tables>

*filter
:INPUT DROP [0:0]
:FORWARD DROP [0:0]
:OUTPUT DROP [0:0]

# Filter all packets that have RH0 headers
-A INPUT -m rt --rt-type 0 -j DROP
-A FORWARD -m rt --rt-type 0 -j DROP
-A OUTPUT -m rt --rt-type 0 -j DROP

# Allow anything on the local link
-A INPUT -i lo -j ACCEPT
-A OUTPUT -o lo -j ACCEPT

# Allow anything out on the localnet
-A OUTPUT -o br0 -j ACCEPT
# Allow established, related packets back in
-A INPUT -i br0 -m state --state ESTABLISHED,RELATED -j ACCEPT

# Enable Forwarding on IPv6-Tunnel interface
-A INPUT -i br0 -s #subnet#/64 -d fe80::/10 -j ACCEPT
# Enable ICMPv6 forward/send out on the localnet
-A INPUT -i br0 -p icmpv6 -j ACCEPT

# Enable DHCPv6
-A INPUT -i br0 -m tcp -p tcp -m multiport -s fe80::/10 -d ff02::1:2 --dports 546,547 -j ACCEPT
-A INPUT -i br0 -m udp -p udp -m multiport -s fe80::/10 -d ff02::1:2 --dports 546,547 -j ACCEPT

# Allow SSH from LAN
-A INPUT -i br0 -m tcp -p tcp --dport 22 -m state --state NEW -j ACCEPT

# Allow SSH from internet
-A INPUT -i sit1 -m tcp -p tcp --dport 22 -m state --state NEW -j ACCEPT
[question3] why doesn't I get a connection via SSH from internet, even I can
traceroute6 or ping6 the sit1 ipv6 #tunnel#?

# Allow anything out on the internet
-A OUTPUT -o sit1 -j ACCEPT
# Allow established, related packets back in
-A INPUT -i sit1 -m state --state ESTABLISHED,RELATED -j ACCEPT

# Allow Link-Local addresses
-A INPUT -s fe80::/10 -j ACCEPT
-A OUTPUT -s fe80::/10 -j ACCEPT

# Allow multicast
-A INPUT -d ff00::/8 -j ACCEPT
-A OUTPUT -d ff00::/8 -j ACCEPT

# Paranoia setting on internet interface
-I INPUT -i sit1 -p tcp --syn -j DROP
-I FORWARD -i sit1 -p tcp --syn -j DROP
-I INPUT -i sit1 -p udp  -j DROP
-I FORWARD -i sit1 -p udp  -j DROP

# Allow Forwarding to IPv6-Tunnel interface
-A FORWARD -i br0 -o sit1 -j ACCEPT
# Allow established, related packets back through
-A FORWARD -i sit1 -o br0 -m state --state ESTABLISHED,RELATED -j ACCEPT
-A FORWARD -i sit1 -o br0 -j LOG  --log-prefix "IPv6[FWD-Reply]: " --log-level 7

# Only the tunnel end is allowed to ping us with any icmp
-A INPUT -i sit1 -p icmpv6 -s #tunnel#::1 -d #tunnel#::2 -j ACCEPT
# Else only pings with restricted icmp are allowed
-A INPUT -i sit1 -p icmpv6 -m limit --limit 2/sec --limit-burst 4 -j ACCEPT

# Enable TRACEroute to me
-I INPUT -i sit1 -p udp --sport 32769:65535 --dport 33434:33523 -j ACCEPT

# Log all other
-A INPUT -j LOG --log-prefix "IPv6[IN]: " --log-level 7
-A FORWARD -j LOG  --log-prefix "IPv6[FWD]: " --log-level 7
-A OUTPUT -j LOG  --log-prefix "IPv6[OUT]: " --log-level 7

COMMIT
<end /etc/sysconfig/ip6tables>


Thanks for any help

Greetings
from Austria,
Walter

