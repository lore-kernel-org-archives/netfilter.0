From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: Round Robin Load Balancing
Date: Mon, 11 Aug 2003 08:30:20 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0192E1@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Javier Govea <jgovea@magma.ca>
Cc: netfilter@lists.netfilter.org

Hate to burst your bubble but isn't the ROUTE module being used a =
_little_ too late. I mean, it's suppose to reroute to a new device but =
your using it in POSTROUTING which means it's to late to reroute it =
(basically leaving the interface and out to the internet)...

From memory, the ROUTE module is supposed to be used in PREROUTING on =
the internal interface so that it doesn't hit the routing table yet and =
the rule modifies which interface to go out on..

I just did a search for the file : =
~georgev/iptables-1.2.7a/patch-o-matic/extra/ROUTE.patch.help
-------------------------------------------------------------------------=
-------
Author: C=E9dric de Launois <delaunois@info.ucl.ac.be>
Status: In Development/Works for me

  This option adds a `ROUTE' target, which allows you to directly resend
  a received packet through a specified interface, even and especially
  if the packet IP address is one of the router itself. Those packets
  are locally delivered and cannot be forwarded to another computer
  using the standard routing mechanisms.

  ROUTE target v1.2.7 options:
    --iface   name            Send the packet directly through iface =
name.
    --ifindex index           Send the packet directly through iface =
index.

  Example :
  You want to install a ssh server on a computer inside your network but
  you also want it to appear exactly as if it was located on the router.
  A solution is to simply reroute packets with destination port 22 to =
the
  computer having the same IP as the router and hosting the ssh service,
  thanks to this ROUTE target and an ipip tunnel.

  # iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 22 -j ROUTE =
--iface tunl1
  # iptables -A PREROUTING -t nat -i tunl1 --j ROUTE --iface eth0
-------------------------------------------------------------------------=
-------
So my guess is that you need to change some lines eg:

> iptables -t nat -A POSTROUTING -o ppp0 -j SNAT --to-source =
<ppp0-ip-addr>
> iptables -t nat -A POSTROUTING -o ppp1 -j SNAT --to-source =
<ppp1-ip-addr>
> iptables -t nat -A POSTROUTING -o ppp2 -j SNAT --to-source =
<ppp2-ip-addr>
> iptables -t nat -A POSTROUTING -o ppp3 -j SNAT --to-source =
<ppp3-ip-addr>
This appears to be OK.

> iptables -t mangle -A PREROUTING -m nth --every 4 --packet 1 -m state =
--state new  -j CONNMARK --set-mark 1
> iptables -t mangle -A PREROUTING -m nth --every 4 --packet 2 -m state =
--state new  -j CONNMARK --set-mark 2
> iptables -t mangle -A PREROUTING -m nth --every 4 --packet 3 -m state =
--state new  -j CONNMARK --set-mark 3
> iptables -t mangle -A PREROUTING -m nth --every 4 --packet 0 -m state =
--state new  -j CONNMARK --set-mark 4
This _might_ be OK.. as long as it works and marks them.

> iptables -t mangle -A OUTPUT     -m nth --every 4 --packet 1 -m state =
--state new  -j CONNMARK --set-mark 1
> iptables -t mangle -A OUTPUT     -m nth --every 4 --packet 2 -m state =
--state new  -j CONNMARK --set-mark 2
> iptables -t mangle -A OUTPUT     -m nth --every 4 --packet 3 -m state =
--state new  -j CONNMARK --set-mark 3
> iptables -t mangle -A OUTPUT     -m nth --every 4 --packet 0 -m state =
--state new  -j CONNMARK --set-mark 4
This only gets used by the local machine itself but usefull also if your =
SQUID and transparent proxy.

> iptables -t mangle -A POSTROUTING -m connmark --mark 1 -j ROUTE --oif =
ppp1
> iptables -t mangle -A POSTROUTING -m connmark --mark 2 -j ROUTE --oif =
ppp2
> iptables -t mangle -A POSTROUTING -m connmark --mark 3 -j ROUTE --oif =
ppp3
> iptables -t mangle -A POSTROUTING -m connmark --mark 4 -j ROUTE --oif =
ppp0
This should be replaced by the lines below (I think..)..

 iptables -t nat -A PREROUTING -m connmark --mark 1 -j ROUTE --oif ppp1
 iptables -t nat -A PREROUTING -m connmark --mark 2 -j ROUTE --oif ppp2
 iptables -t nat -A PREROUTING -m connmark --mark 3 -j ROUTE --oif ppp3
 iptables -t nat -A PREROUTING -m connmark --mark 4 -j ROUTE --oif ppp0

Give this a try but I don't know if all of this is right and there's =
nothing else missing... looks OK.

Also, when testing use telnet and don't use a browser.. makes it easier =
to debug whereas a browser pulls up to 20 connections and hard to figure =
out. Just telnet to a specific host on the internet and use tcpdump on =
that host to see where the packets are routing through..

Good luck.


Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au


-----Original Message-----
From: Javier Govea [mailto:jgovea@magma.ca]
Sent: Monday, August 11, 2003 5:08 AM
To: Ramin Dousti; Javier Govea
Cc: netfilter@lists.netfilter.org
Subject: Re: Round Robin Load Balancing

