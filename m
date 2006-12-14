From: Andrew Beverley <andy@andybev.com>
Subject: Re: Allowing hosts to bypass transparent proxy (squid+netfilter)
	to port 80 for a specific netmask
Date: Thu, 14 Dec 2006 21:26:10 +0000
Message-ID: <1166131570.6534.33.camel@andybev.localdomain>
References: <4581B8A6.4080504@terra.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4581B8A6.4080504@terra.com.br>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Bernardo Vieira <bernardo.vieira@terra.com.br>
Cc: netfilter@lists.netfilter.org

Sorry for the top posting but it's a big message...

How about trying

-A PREROUTING -i ! eth0 -p tcp -m tcp --dport 80 -d \
200.201.160.0/255.255.240.0 -j ACCEPT

directly *before* the rule to direct hosts to squid.

The other rule you noted is a FORWARD rule which is processed *after*
the PREROUTING rule you use for squid, so by the time the packets get to
that rule they've already been grabbed by squid.

The following link is an excellent diagram to appreciate the routing
order - it would be nice to see this on the netfilter homepage!

http://www.docum.org/docum.org/kptd/

Andy Beverley


On Thu, 2006-12-14 at 18:48 -0200, Bernardo Vieira wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Hi all!
> 
> I need to setup my gateway (netfilter + squid) to allow allow lan hosts
> direct access to the domain .caixa.gov.br (200.201.160/20). All requests
> will go on port 80, tcp on the remote end but the protocol isn't http.
> To achieve this I tried adding the following rules to iptables:
> 
> - -A FORWARD -s 192.168.1.0/255.255.255.0 -d 200.201.160.0/255.255.240.0\
> - -p tcp --sport 1024:65535 --dport 80 -j ACCEPT
> 
> The problem is that packets destined for that rule are still being
> grabbed by squid, preventing the java app to load:
> 
> 192.168.1.221 TCP_CLIENT_REFRESH_MISS/404 4244 GET
> http://cmt.caixa.gov.br/COM/arx/pw/SlimCli.class - DIRECT/200.201.173.68
> text/html
> 
> When I saw that I also tried the following squid.conf acls to allow
> direct connections to the domain, but the problem persists:
> 
> acl Caixa dstdomain .caixa.gov.br
> always_direct allow Caixa
> 
> Can anyone point me in the right direction?
> 
> My setup is:
> 
>       Internet
>           |
> +---------+-----------+
> |  eth0 (dynamic IP)  |
> |  Squid + netfilter  |
> |eth1 (192.168.1.1/24)|
> +---------+-----------+
>           |
>         Hosts
> 
> 
> 
> kernel version: 2.6.9-10
> iptables v1.2.9
> Squid Cache: Version 2.5.STABLE6
> 
> attached complete squid.conf & iptables rules
> 
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.1 (MingW32)
> Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org
> 
> iD8DBQFFgbil2QVs8jsa1mQRAgl/AJ0U8s8CHJ/H/y3ghOHFoDOTjGtnzQCfWU3v
> /y51lg/bmz84QUhZEUye9Q4=
> =+Bmk
> -----END PGP SIGNATURE-----
> plain text document attachment (iptables.txt)
> -A PREROUTING -i ! eth0 -p tcp -m tcp --dport 80 -j REDIRECT --to-ports 3128 
> -A POSTROUTING -o eth0 -j MASQUERADE 
> 
> -A INPUT -p icmp -m icmp --icmp-type 0 -j ACCEPT 
> -A INPUT -p icmp -m icmp --icmp-type 3 -j ACCEPT 
> -A INPUT -p icmp -m icmp --icmp-type 11 -j ACCEPT 
> -A INPUT -p icmp -m icmp --icmp-type 8 -j ACCEPT 
> -A INPUT -p icmp -j DROP 
> -A INPUT -m state --state INVALID -j DROP 
> -A INPUT -p tcp -m tcp --tcp-flags SYN,ACK SYN,ACK -m state --state NEW -j REJECT --reject-with tcp-reset 
> -A INPUT -p tcp -m tcp ! --tcp-flags SYN,RST,ACK SYN -m state --state NEW -j DROP 
> -A INPUT -i lo -j ACCEPT 
> -A INPUT -i ! eth0 -j ACCEPT 
> -A INPUT -s 127.0.0.0/255.0.0.0 -i eth0 -j drop-reserved 
> -A INPUT -s 169.254.0.0/255.255.0.0 -i eth0 -j drop-reserved 
> -A INPUT -s 224.0.0.0/240.0.0.0 -i eth0 -j drop-reserved 
> -A INPUT -s 240.0.0.0/240.0.0.0 -i eth0 -j drop-reserved 
> -A INPUT -d <external ip> -i eth0 -p udp -m udp --dport 1024:65535 -m state --state RELATED,ESTABLISHED -j ACCEPT 
> -A INPUT -d <external ip> -i eth0 -p tcp -m tcp --dport 1024:65535 -m state --state RELATED,ESTABLISHED -j ACCEPT 
> -A INPUT -i eth0 -j DROP 
> 
> -A FORWARD -s 192.168.1.0/255.255.255.0 -d 200.201.160.0/255.255.240.0 -p tcp --sport 1024:65535 --dport 80 -j ACCEPT 
> -A FORWARD -i ! eth0 -j ACCEPT 
> -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT 
> -A FORWARD -j DROP 
> 
> -A OUTPUT -p icmp -j ACCEPT 
> -A OUTPUT -o lo -j ACCEPT 
> -A OUTPUT -j ACCEPT 
> -A OUTPUT -s <external ip> -j ACCEPT 
> -A OUTPUT -o eth0 -j DROP 
> -A drop-lan -j DROP 
> -A drop-reserved -j DROP 
> 
> plain text document attachment (squidconf.txt)
> http_port 3128
> hierarchy_stoplist cgi-bin ?
> acl QUERY urlpath_regex cgi-bin \?
> maximum_object_size 4096 KB
> cache_dir diskd /mnt/cache/squid 5120 16 256 
> auth_param basic children 5
> auth_param basic realm Squid proxy-caching web server
> auth_param basic credentialsttl 2 hours
> refresh_pattern ^ftp:		1440	20%	10080
> refresh_pattern ^gopher:	1440	0%	1440
> refresh_pattern .		0	20%	4320
> acl all src 0.0.0.0/0.0.0.0
> acl manager proto cache_object
> acl localhost src 127.0.0.1/255.255.255.255
> acl to_localhost dst 127.0.0.0/8
> acl private1 src 192.168.0.0/16
> acl private2 src 10.0.0.0/8
> acl private3 src 172.16.0.0/12
> acl privoxy dstdomain config.privoxy.org
> acl SSL_ports port 443 563
> acl SSL_ports port 81 10000
> acl CONNECT method CONNECT
> acl Caixa dstdomain .caixa.gov.br
> no_cache deny QUERY
> http_access allow manager localhost
> http_access deny manager
> http_access deny !Safe_ports
> http_access deny CONNECT !SSL_ports
> http_access deny privoxy
> http_access allow localhost
> http_access allow private1
> http_access allow private2
> http_access allow private3
> http_access deny all
> http_reply_access allow all
> icp_access allow all
> reply_body_max_size 0 allow all
> cache_effective_user squid
> cache_effective_group squid
> httpd_accel_host virtual
> httpd_accel_port 80
> httpd_accel_with_proxy on
> httpd_accel_uses_host_header on
> always_direct allow Caixa
> coredump_dir /var/spool/squid
> extension_methods REPORT MERGE MKACTIVITY CHECKOUT
> 


