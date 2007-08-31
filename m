From: David Leangen <netfilter@leangen.net>
Subject: Re: Debugging network problems
Date: Fri, 31 Aug 2007 16:43:47 +0900
Message-ID: <1188546227.29330.34.camel@sonoda.bioscene.co.jp>
References: <1188383622.29330.9.camel@sonoda.bioscene.co.jp>
	<46D7A814.40108@rtij.nl>
Reply-To: netfilter@leangen.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46D7A814.40108@rtij.nl>
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
To: Martijn Lievaart <m@rtij.nl>
Cc: netfilter@lists.netfilter.org


Thank you, Martijn,

My reply inline.


> > Generally, I can connect to the outside world, and the outside world can
> > connect to me. By this, I mean that each of the local machines behind my
> > proxy can connect.
> >
> > However, the connections back to my own URL are sporadic. In other
> > words, sometimes I can connect, sometimes I can't. Assuming my domain is
> > my.company.com, when I try to connect to my.company.com from within my
> > network, sometimes I can, sometimes I can't, but I have not at all
> > figured out a pattern.
> >
> > When this happens, domain names are being resolved, but I get
> > "Connection timed out" errors.
> >

> Sounds like an PMTUD issue. Do you allow all ESTABLISHED packets in, not 
> just tcp?

Yes, I'm letting all packets in:

  -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT


This is my iptables file (below).

Maybe somebody can spot the problem?


Cheers,
David



*mangle
:PREROUTING ACCEPT [0:0]
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG
FIN,PSH,URG -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG NONE -j
DROP
-A PREROUTING -p tcp -m tcp --tcp-flags SYN,RST SYN,RST -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN FIN,SYN -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG
FIN,PSH,URG -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG NONE -j
DROP
-A PREROUTING -p tcp -m tcp --tcp-flags SYN,RST SYN,RST -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN FIN,SYN -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG
FIN,PSH,URG -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG NONE -j
DROP
-A PREROUTING -p tcp -m tcp --tcp-flags SYN,RST SYN,RST -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN FIN,SYN -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG
FIN,PSH,URG -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG NONE -j
DROP
-A PREROUTING -p tcp -m tcp --tcp-flags SYN,RST SYN,RST -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN FIN,SYN -j DROP
COMMIT

*nat
:PREROUTING ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
-A PREROUTING -p tcp --dport 5433 -j DNAT --to 192.168.2.10:5432
-A PREROUTING -p udp --dport 5433 -j DNAT --to 192.168.2.10:5432
-A PREROUTING -p tcp --dport 5434 -j DNAT --to 192.168.2.11:5432
-A PREROUTING -p udp --dport 5434 -j DNAT --to 192.168.2.11:5432
-A POSTROUTING -d 192.168.2.10 -s 192.168.0.0/255.255.0.0 -p tcp -j SNAT
--to 192.168.11.100
-A PREROUTING -p tcp -s 202.238.89.88 --dport 50000:50100 -j DNAT --to
192.168.2.5
-A POSTROUTING -o eth0 -j MASQUERADE

COMMIT
*filter
:INPUT DROP [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:BLACKLIST - [0:0]
:LOG_ACCEPT - [0:0]
:LOG_DROP - [0:0]
:icmp_packets - [0:0]
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A INPUT -p tcp -m tcp --dport 20 -j LOG_ACCEPT
-A INPUT -p tcp -m tcp --dport 21 -j LOG_ACCEPT
-A INPUT -p tcp -m tcp --dport 22 -j LOG_ACCEPT
-A INPUT -p tcp -m tcp --dport 25 -j LOG_ACCEPT
-A INPUT -p udp -m udp --dport 53 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 110 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 143 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 443 -j LOG_ACCEPT
-A INPUT -p tcp -m tcp --dport 993 -j ACCEPT
-A INPUT -p udp -m udp -s 192.168.0.0/255.255.0.0 --dport 10080 -j
ACCEPT
# The following line is for FTP passive ports
-A INPUT -p tcp -m tcp --dport 55000:55500 -j LOG_ACCEPT
-A INPUT -s 127.0.0.1 -j ACCEPT
-A INPUT -p icmp -j icmp_packets
-A INPUT -j LOG_DROP
-A OUTPUT -p tcp -m tcp --dport 50000:50100 -j LOG_ACCEPT
-A OUTPUT -p udp -m udp --dport 700:710 -j LOG_ACCEPT
-A BLACKLIST -j LOG_DROP
-A LOG_ACCEPT -j LOG --log-prefix "[IPTABLES ACCEPT] : "
--log-tcp-options --log-ip-options
-A LOG_ACCEPT -j ACCEPT
-A LOG_DROP -j LOG --log-prefix "[IPTABLES DROP] : " --log-tcp-options
--log-ip-options
-A LOG_DROP -j DROP
-A icmp_packets -p icmp -m icmp --icmp-type 0 -j ACCEPT
-A icmp_packets -s 192.168.0.0/255.255.255.0 -p icmp -m icmp --icmp-type
8 -j ACCEPT
-A icmp_packets -s 192.168.1.0/255.255.255.0 -p icmp -m icmp --icmp-type
8 -j ACCEPT
-A icmp_packets -s 192.168.2.0/255.255.255.0 -p icmp -m icmp --icmp-type
8 -j ACCEPT
-A icmp_packets -p icmp -m icmp --icmp-type 8 -j ACCEPT
-A icmp_packets -p icmp -m icmp --icmp-type 3 -j ACCEPT
-A icmp_packets -p icmp -m icmp --icmp-type 11 -j ACCEPT
COMMIT



