From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: blocking ports outbound
Date: Wed, 12 Mar 2003 22:06:04 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001a01c2e8db$31a31b50$0401000a@sterenborg.info>
References: <3E6F9569.5030108@connectingyou.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E6F9569.5030108@connectingyou.com.au>
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
To: netfilter@lists.netfilter.org

> Maybe I got my question wrong.
>=20
> I'm very new to iptables coming from a ipfilter background.=20
> In ipfilter I just state block all in and then open the ports=20
> I wish to allow through. Is there something similiar in iptables.

Yes.

iptables -P INPUT DROP
Does just what is says : it droppes all inbound packets where there is
no ACCEPT rule for.

I guess you'd want the thing to be stateful :
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

If you want to accept packets on a certain port, you just do :
iptables -A INPUT -p <proto> --dport <port> -j ACCEPT
Or
iptables -A INPUT -i <if_in> -p <proto> --dport <port> -j ACCEPT
Or
iptables -A INPUT -s <src_ip|net> -p proto --dport <port> -j ACCEPT

There are of course more options that I didn't mention here, some can be
used together.
In the examples above you could use both -i and -s in one rule to make
sure an IP will match on a certain NIC.

> I wish to stop the outside world from seeing the ports upon=20
> the firewall/proxy and beyond into my internal network.
>=20
> My problem is I cannot join certain irc servers due to there=20
> open proxy policy.

Actually I'm not quite familiar with irc ; never used it.

> So really how do I block all ports internally while allowing=20
> a something like a connection internally to go outbound and=20
> recieve the packets back.

On what port does the irc client connect ? Is it 6667 ?
What if you forward port 6667 so it can contact the irc server directly
?

> My current iptables config is
>=20
>=20
> #!/bin/bash
> /bin/echo "Firewall rules starting up now..."
> /sbin/modprobe ipt_MASQUERADE
> /usr/local/sbin/iptables -F

> /usr/local/sbin/iptables -t nat
                          ^^^^^^^^
What does this do ? On my box it gives an error.
You specify what table iptables should use, but you don't give it any
"command".

> /usr/local/sbin/iptables -t mangle -F
> /usr/local/sbin/iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE

> /bin/echo 1 > /proc/sys/net/ipv4/ip_forward=20
> /usr/local/sbin/iptables -A OUTPUT --dport 3128 -j DENY=20
                                                    ^^^^^^
Do you want to DROP or REJECT ?
DENY was in ipchains, not in iptables.

> Pl,ease pick apart my rules and tell me what I'm doing wrong.
>=20
> As I stated, I'm a complete newbie to iptables.
>=20
> My system is a firewall/proxy unit with a adsl connection=20
> running pppoe to the outside world. I recieve a permanent ip=20
> upon te ppp0 interface.

So eth0 and eth2 are connected to your lan I suppose, and are on
different subnets.
If I'd have to make it work I'd try this :

# Stop forwarding
echo 0 > /proc/sys/net/ipv4/ip_forward

# Load some modules
modprobe ipt_MASQUERADE
modprobe ip_conntrack_ftp
modprobe ip_nat_ftp
# You may need ip_conntrack_irc and ip_nat_irc. Do you have these
modules ?

# Flush all rules
iptables -F
iptables -t nat -F
iptables -t mangle -F

# Set the default policy
iptables -P INPUT DROP
iptables -P FORWARD DROP

# Make it stateful
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT

# Don't know if you need to access the box itself from your lan ?
# If so then you need to do something like this.
iptables -A INPUT -i eth0 -j ACCEPT
iptables -A INPUT -i eth2 -j ACCEPT

# Forward traffic from eth0 and eth2
iptables -A FORWARD -i eth0 -o ppp0 -s <lan_net1> -j ACCEPT
iptables -A FORWARD -i eth2 -o ppp0 -s <lan_net2> -j ACCEPT

# Redirect webclients to squid
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT
--to-port 3128
iptables -t nat -A PREROUTING -i eth2 -p tcp --dport 80 -j REDIRECT
--to-port 3128

# MASQ traffic from eth0 and eth2 destined for the internet
# You're using ppp so I don't think SNAT will work for you (it doesn't
for me..)
iptables -t nat -A POSTROUTING -o ppp0 -s <lan_net1> -j MASQUERADE
iptables -t nat -A POSTROUTING -o ppp0 -s <lan_net2> -j MASQUERADE

# Start forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward


Again : this may not work for your purpose, but it can be a start.

For more information about iptables there is a nice tutorial from Oskar
:
http://iptables-tutorial.frozentux.net/
You may want to look there for a lot of information.


Rob


