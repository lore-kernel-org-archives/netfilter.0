From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Help with Masquerading
Date: Sun, 5 Jan 2003 14:00:34 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301051400.34941.netfilter@newkirk.us>
References: <3E184D14.10102@cablespeed.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E184D14.10102@cablespeed.com>
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
To: Subba Rao <subba3@cablespeed.com>, netfilter@lists.netfilter.org

On Sunday 05 January 2003 10:19 am, Subba Rao wrote:
> Hi
>
> My system is running kernel 2.4.20 with iptables compiled into the
> kernel. The system has 2 interfaces. ETH0 is connected to the Internet
> (via cablemodem) and ETH1 is connected to my home LAN which has only
> one W2K laptop.
>
> My W2K is configured with the Linux system as the gateway. Both
> systems can ping each other.
> However my laptop is not able to go out to the Internet.
>
> I am desperately trying to make my W2K laptop connect to the Internet.
>
> Please let me know how to make this work.
>
> Thank you in advance.
>
> Subba Rao
> subba3@cablespeed.com
>
> #!/bin/sh
>
> echo "Starting Firewall....."
>
> INTERNAL_NET=3D"10.0.0.0/24"
>
> INTERNET=3D`ifconfig eth0 | grep inet | cut -d : -f 2 | cut -d \  -f 1`

This is extracting the IP address of your external connection from the=20
output of 'ifconfig eth0' - Are you on a dynamic IP with a long=20
lease-time?  If so you may get away with using this with SNAT.  If=20
you're on a static IP this is unnecessary, just use the actual IP in the=20
script.  If your IP changes fairly frequently, don't bother with this=20
and just use MASQUERADE target.

> # Flush the tables
> /usr/sbin/iptables -F INPUT
> /usr/sbin/iptables -F OUTPUT
> /usr/sbin/iptables -F FORWARD
> /usr/sbin/iptables -t nat -F
>
> # Set default policies for packet entering this box
>
> iptables -P INPUT DROP
> iptables -P OUTPUT ACCEPT
> iptables -P FORWARD ACCEPT

Set FORWARD policy to DROP as well.  The only things you want this box to=
=20
forward are those you explicitly allow.  Try using these rules for a=20
start:

iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i eth1 -p tcp --dport 80 -j ACCEPT
iptables -A FORWARD -i eth1 -p udp --dport 53 -j ACCEPT

these should allow the laptop to browse the web.  For other services,=20
like email, add appropriate rules for the needed ports.  The first rule=20
here accepts any packet that is part of and ESTABLISHED connection, or=20
RELATED to one, regardless of it's source.  The remainder allow=20
explicitly defined connections from the LAN to be forwarded to the=20
internet.  With these three rules the laptop can connect out, but the=20
internet cannot connect in, only respond to a connection initiated by=20
the laptop.

> # Allow some packets in but accept all those on the internal interface
> /usr/sbin/iptables -A INPUT -i lo -j ACCEPT
> /usr/sbin/iptables -A INPUT -i eth0 -j ACCEPT
> /usr/sbin/iptables -A INPUT -i eth1 -j ACCEPT

The second one means anyone on the internet can connect to your firewall=20
box on any port, bypassing the DROP policy you set.  Bad idea.  The=20
third means any connection from local network to the firewall machine=20
directly is accepted, which is OK since only your laptop is on the local=20
network, but is a bad idea for a large network.

> # Masquerade internal system with the public IP address
>
> iptables -t nat -A POSTROUTING -d $INTERNAL_NET -o $INTERNET -j ACCEPT
> iptables -t nat -A POSTROUTING -o $INTERNET -s $INTERNAL_NET -j
> MASQUERADE

First rule here is bad. =20
A - Destination IP of local network should never be going out internet=20
connection, so it should never match anything.=20
B - If your intention is to ACCEPT anything from internet going TO local=20
network, you shouldn't because:
C - PREROUTING and POSTROUTING chains of NAT table are for NAT only, not=20
filtering, so you should just rely on accept policy.  Only time you=20
should ACCEPT in a NAT chain rule is if you want to bypass a later rule,=20
IE you can ACCEPT specific traffic, then NAT whatever remains.
D - INTERNET is set to be the IP address of eth1, your external=20
connection.  "-o" and "-i" matches are for interfaces, not IPs, so you=20
should use something like "-o eth1" or "-i eth0" here.

Second rule here is bad as well, for reason D above.  Also, you are using=
=20
MASQUERADE target, which is fine if you have a dynamic IP, but you are=20
going to the trouble of determining your public IP at the start, which=20
leads me to think you intend to use it directly in a SNAT.  If you are=20
on dynamic IP stick with MASQUERADE, if static IP use "-j SNAT --to=20
$INTERNET", based on your assignment above, or better yet just assign=20
the IP in the script instead of extracting it from the output of=20
'ifconfig eth1' at the top.

> # Block inbound connections
>
> /usr/sbin/iptables -A INPUT -i eth0 -p tcp --syn -j DROP
>
> echo 1 > /proc/sys/net/ipv4/ip_forward
> echo 1 > /proc/sys/net/ipv4/tcp_syncookies

The first one here turns on forwarding, but if you're using MASQUERADE=20
target you need to enable dynamic IP tracking as well, with:

echo "1" > /proc/sys/net/ipv4/ip_dynaddr

j


