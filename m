From: "Nicolas" <nmeillet@wanadoo.Fr>
Subject: RE: rtsp-conntrack help needed...
Date: Sat, 17 Jan 2004 16:09:34 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040117150943.38AE2A400195@mwinf0202.wanadoo.fr>
References: <200401171208.57545.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200401171208.57545.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Antony,

Here is my ruleset. Hope this helps... As I told you, the rules I use =
are
really basics.

There you go :

#!/bin/sh
#
# FORWARDING activation

echo 1 > /proc/sys/net/ipv4/ip_forward


# No spoofing (pings are blocked)

if [ -e /proc/sys/net/ipv4/conf/all/rp_filter ]
then
	for filtre in /proc/sys/net/ipv4/conf/*/rp_filter
	do
		echo 1 > $filtre
	done
fi


# no icmp
#echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_all
#echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts


# loading the ip_tables module

modprobe ip_tables


# NAT modules

modprobe ip_nat_ftp
modprobe ip_nat_irc
modprobe iptable_filter
modprobe iptable_nat


# Aliases

ifconfig eth1:1 IP_PUB..XXX.XX6 netmask 255.255.255.248
ifconfig eth1:2 IP_PUB..XXX.XX7 netmask 255.255.255.248
ifconfig eth1:3 IP_PUB..XXX.XX8 netmask 255.255.255.248
ifconfig eth1:4 IP_PUB..XXX.XX9 netmask 255.255.255.248


# Default : all packets dropped

iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP


# For LAN : all packets accepted

iptables -A INPUT -s 10.254.254.0/12 -j ACCEPT
iptables -A OUTPUT -d 10.254.254.0/12 -j ACCEPT
iptables -A FORWARD -s 10.254.254.0/12 -j ACCEPT

# For 3G handsets : all packets accepted

iptables -A INPUT -s 10.150.33.0/24 -j ACCEPT
iptables -A OUTPUT -d 10.150.33.0/24 -j ACCEPT
iptables -A FORWARD -s 10.150.33.0/24 -j ACCEPT


# Loopback interface : all accepted

iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT


# LAN: internet access OK

#iptables -A FORWARD -i eth0 -o eth1 -j ACCEPT
iptables -A FORWARD -o eth0 -i eth1 -j ACCEPT


# translation d'adresse filtr=E9e en entr=E9e: IMAI

iptables -t nat -A PREROUTING -s IP_SRC_THRD-PARTY -d IP_PUB..XXX.XX7 -p =
tcp
-j DNAT --to-destination 10.254.254.32


# NAT rules

iptables -t nat -A PREROUTING -d IP_PUB..XXX.XX7 -p udp --dport 9201 -j =
DNAT
--to-destination10.254.254.11
iptables -t nat -A PREROUTING -d IP_PUB..XXX.XX8 -p tcp --dport 8080 -j =
DNAT
--to-destination10.254.254.12
iptables -t nat -A PREROUTING -d IP_PUB..XXX.XX9 -p tcp --dport 80 -j =
DNAT
--to-destination10.254.254.25
iptables -t nat -A PREROUTING -d IP_PUB..XXX.XX9 -p tcp --dport 22 -j =
DNAT
--to-destination10.254.254.25


# Telnet forbidden

iptables -A FORWARD -d IP_PUB..XXX.XX6 -p tcp  --dport 23 -j DROP
iptables -A FORWARD -d IP_PUB..XXX.XX7 -p tcp  --dport 23 -j DROP
iptables -A FORWARD -d IP_PUB..XXX.XX8 -p tcp  --dport 23 -j DROP
iptables -A FORWARD -d IP_PUB..XXX.XX9 -p tcp  --dport 23 -j DROP


# On accepte les ping dans la translation

iptables -t nat -A PREROUTING -d IP_PUB..XXX.XX6 -p icmp  -j DNAT
--to-destination 10.254.254.31
iptables -t nat -A PREROUTING -d IP_PUB..XXX.XX7 -p icmp  -j DNAT
--to-destination 10.254.254.41
iptables -t nat -A PREROUTING -d IP_PUB..XXX.XX8 -p icmp  -j DNAT
--to-destination 10.254.254.42
iptables -t nat -A PREROUTING -d IP_PUB..XXX.XX9 -p icmp  -j DNAT
--to-destination 10.254.254.25


# Masquerading rules

iptables -t nat -A POSTROUTING -s 10.254.254.0/12 -o eth1 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.150.33.0/24 -o eth1 -j MASQUERADE


Thanks a lot for your help.
Nicolas

-----Message d'origine-----
De=A0: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] De la part de Antony Stone
Envoy=E9=A0: samedi 17 janvier 2004 13:09
=C0=A0: netfilter@lists.netfilter.org
Objet=A0: Re: rtsp-conntrack help needed...

On Saturday 17 January 2004 10:21 am, meillnco wrote:

> Hello all,
>
> This is my first post on this list but I've known netfilter for a =
while
> now... I'm just about to start using it though.
>
> Here is my question / problem : I have a generic configuration LAN =
<=3D>
> FIREWALL <=3D> INTERNET. My goal is to be able to play a video =
streamed by a
> public server. However, for the moment, my local clients can't stream =
as
> all RTP packets are stopped by the firewall.

Why are they being stopped?   What is your ruleset?

> Here comes (maybe ?) rtsp-conntrack...

Maybe, but let's not assume that's the solution until we've clearly
identified=20
the problem.

> I was wondering if anyone had already (and successfully) installed =
this
> patch ? I've been facing this problem for soooo long, any help would =
be
> much appreciated.

Have you attempted installing this patch and had a problem?   Or are you
just=20
asking "how do I install a patch"?

> Especially regarding installation / compliation tips and
> examples of the rules to add in my firewall configuration file.

Tell us what rules you have now and we may be able to suggest what to
change.  =20
We can't tell you what rules you should be using because we don;t know =
the=20
rest of your protocol requirements or your network configuration.

> PS : sorry if this message is inaccurate, I'm not so deep into =
Linux...

No problem - it's not Linux we need details of - it's your network and =
your=20
firewall rules.

Regards,

Antony.

--=20
The words "e pluribus unum" on the Great Seal of the United States are =
from
a=20
poem by Virgil entitled "Moretum", which is about cheese and garlic =
salad=20
dressing.

                                                     Please reply to the
list;
                                                           please don't =
CC
me.




