From: Jong Hian Zin <mail.zin@gmail.com>
Subject: Firewall blocking Java applet?
Date: Thu, 23 Jun 2005 09:36:47 +0800
Message-ID: <cb82de59050622183613989c5f@mail.gmail.com>
Reply-To: Jong Hian Zin <mail.zin@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

I have a Linksys WRT54G running OpenWRT, the WAN port is connecting to an=
=20
ADSL modem (PPPoE) and there are 2 PCs connecting to the WRT54G's LAN ports=
.=20
I can surf the web from any of the PCs except doing bandwidth test using=20
this website:

http://202.188.95.52:8080/speedometer/

The bandwidth test Java applet can be loaded, but unable to start the test.=
=20
The following is my script:

#!/bin/sh
. /etc/functions.sh
export WAN=3D$(nvram get wan_ifname)
export LAN=3D$(nvram get lan_ifname)

## CLEAR TABLES
for T in filter nat mangle; do
  iptables -t $T -F
  iptables -t $T -X

done

iptables -N input_rule
iptables -N output_rule
iptables -N forwarding_rule

iptables -t nat -N prerouting_rule
iptables -t nat -N postrouting_rule

### Port forwarding
# iptables -t nat -A prerouting_rule -p tcp --dport 22 -j DNAT --to=20
192.168.1.2 <http://192.168.1.2>
# iptables        -A forwarding_rule -p tcp --dport 22 -d 192.168.1.2
<http://192.168.1.2> -j ACCEPT

### INPUT
###  (connections with the router as destination)


  # base case
  iptables -P INPUT DROP
  iptables -A INPUT -m state --state INVALID -j DROP
  iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

  # allow
  iptables -A INPUT -i \! $WAN -j ACCEPT        # allow from lan/wifi inter=
faces

  iptables -A INPUT -p icmp -j ACCEPT           # allow ICMP
  iptables -A INPUT -p tcp --dport 22 -j ACCEPT
  iptables -A INPUT -p 47 -j ACCEPT             # allow GRE
  #
  # insert accept rule or to jump to new accept-check table here

  #
  iptables -A INPUT -j input_rule

  # reject (what to do with anything not allowed earlier)
  iptables -A INPUT -p tcp --syn --tcp-option \! 2 -j  DROP
  iptables -A INPUT -p tcp -j REJECT --reject-with tcp-reset

  iptables -A INPUT -j REJECT --reject-with icmp-port-unreachable

### OUTPUT
### (connections with the router as source)

  # base case
  iptables -P OUTPUT DROP
  iptables -A OUTPUT -m state --state INVALID -j DROP

  iptables -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

  # allow
  iptables -A OUTPUT -j ACCEPT          #allow everything out
  #
  # insert accept rule or to jump to new accept-check table here

  #
  iptables -A OUTPUT -j output_rule

  # reject (what to do with anything not allowed earlier)
  iptables -A OUTPUT -p tcp -j REJECT --reject-with tcp-reset
  iptables -A OUTPUT -j REJECT --reject-with icmp-port-unreachable


### FORWARDING
### (connections routed through the router)

  # base case
  iptables -P FORWARD DROP
  iptables -A FORWARD -m state --state INVALID -j DROP
  iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT

  iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS
--clamp-mss-to-pmtu

  # allow
  iptables -A FORWARD -i br0 -o br0 -j ACCEPT
  iptables -A FORWARD -i $LAN -o $WAN -j ACCEPT
  #
  # insert accept rule or to jump to new accept-check table here

  #
  iptables -A FORWARD -j forwarding_rule

  # reject (what to do with anything not allowed earlier)
  # uses the default -P DROP

### MASQ
  iptables -t nat -A PREROUTING -j prerouting_rule

  iptables -t nat -A POSTROUTING -j postrouting_rule
  iptables -t nat -A POSTROUTING -o $WAN -j MASQUERADE


Any idea what is blocking the bandwidth test Java applet?

Thanks,

--=20
Jong Hian Zin
