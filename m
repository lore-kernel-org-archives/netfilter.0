From: "Matthew Hellman" <mhellman@raccoon.com>
Subject: Re: Apache virtualhost not working behind firewall.
Date: Thu, 19 Dec 2002 21:54:07 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002c01c2a7db$7260fb30$020aa8c0@winxp>
References: <3E0274C5.7080000@CyberWolf.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Chip Upsal <Chip@CyberWolf.com>, netfilter@lists.netfilter.org

> INET_IP="216.184.9.5"
> #HTTP_IP="216.184.9.6"
> PWWEB_IP="216.184.9.30"
> PWODBC_IP="216.184.9.29"
> INET_IFACE="eth2"
>
> LAN_IP="192.168.1.15"
> LAN_IP_RANGE="192.168.1.0/24"
> LAN_BCAST_ADRESS="192.168.1.255"
> LAN_IFACE="eth0"
>
> DMZ_PWWEB_IP="192.168.0.2"
> DMZ_PWSQL_IP="192.168.0.3"
> DMZ_PWODBC_IP="192.168.0.4"
> DMZ_IP="192.168.0.1"
> DMZ_IFACE="eth1"
>
> $IPTABLES -A FORWARD -i $DMZ_IFACE -o $INET_IFACE -j ACCEPT
> $IPTABLES -A FORWARD -i $INET_IFACE -o $DMZ_IFACE -m state \
> --state ESTABLISHED,RELATED -j ACCEPT
> $IPTABLES -A FORWARD -i $LAN_IFACE -o $DMZ_IFACE -j ACCEPT
> $IPTABLES -A FORWARD -i $DMZ_IFACE -o $LAN_IFACE -j ACCEPT

These rules are pretty generous (well, except for nodes on your
$LAN_IFACE...which aren't allowed to use the Internet at all?...is that a
typo?).  You're allowing the firewall to forward packets unfiltered from the
DMZ to anywhere? Why even have a DMZ?
If you want to be a little more secure you could do something like this
instead:

$iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
$iptables -A FORWARD -i $LAN_IFACE -m state --state NEW -j ACCEPT

and then create rules only for NEW connections you want to allow in on
either $INET_IFACE or $DMZ_IFACE. For example:
$iptables -A FORWARD -m state --state NEW -i $INET_IFACE -p tcp -d
$DMZ_PWWEB_IP --dport 80 -j ACCEPT

> #
> # PWWEB
> #
> $IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_PWWEB_IP
\
> --dport 80 -j allowed
> $IPTABLES -A FORWARD -p ICMP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_PWWEB_IP
\
> -j icmp_packets
> #
> # PWODBC
> #
> $IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_PWODBC_IP
\
> --dport 80 -j allowed
> $IPTABLES -A FORWARD -p ICMP -i $INET_IFACE -o $DMZ_IFACE -d
> $DMZ_PWODBC_IP \
> -j icmp_packets
> #
> # PWWEB
> #
> $IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $PWWEB_IP
> --dport 80 \
> -j DNAT --to-destination $DMZ_PWWEB_IP

I think this is your problem. I could look at the man pages to figure out if
that syntax is also correct but I'm too lazy;-)...it's usually done like
this:
$iptables -t nat -A PREROUTING -i $INET_IFACE -p tcp -d $PWWEB_IP --dport
80 -j DNAT --to $DMZ_PWWEB_IP

Goodluck!

Matt



