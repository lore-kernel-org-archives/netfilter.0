From: RUMI Szabolcs <rumi_ml@rtfm.hu>
Subject: Re: MASQUERADE/SNAT before IPsec
Date: Sun, 3 Feb 2008 19:19:23 +0100
Message-ID: <20080203191923.b146b7ed.rumi_ml@rtfm.hu>
References: <20080202220014.ab018f1d.rumi_ml@rtfm.hu>
	<BAY103-DAV9E97CD56D54A10E4D90C4B2310@phx.gbl>
	<20080203011009.14cf09ea.rumi_ml@rtfm.hu>
	<BAY103-DAV2B2147898979C3A7FA314B2320@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BAY103-DAV2B2147898979C3A7FA314B2320@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: Marco Berizzi <pupilla@hotmail.com>

On Sun, 3 Feb 2008 14:18:12 +0100
"Marco Berizzi" <pupilla@hotmail.com> wrote:

> RUMI Szabolcs wrote:
> 
> > Well the actual setup is much more complicated but I tried
> > to simplify and visualize the problem (see attached image).
> > The green arrows show where the NATed traffic should go and
> > the red ones show what actually happens.
> 
> please post your iptables rules and the 'ip -s x p' output.

Well, this is a corporate production system so everything is a
bit more complicated as if it were just a testbed machine...
But here are the relevant rules:

iptables -A INPUT -i eth+ -s "!" $MYIP -p ah -j ACCEPT
iptables -A INPUT -i eth+ -s "!" $MYIP -p esp -j ACCEPT
iptables -A OUTPUT -o eth+ -s $MYIP -p ah -j ACCEPT
iptables -A OUTPUT -o eth+ -s $MYIP -p esp -j ACCEPT
iptables -A FORWARD -s 10.0.0.0/8 -i "!" eth+ -d 164.99.192.0/22 -j ACCEPT
iptables -A FORWARD -d 10.0.0.0/8 -o "!" eth+ -s 164.99.192.0/22 -j ACCEPT
iptables -t nat -A POSTROUTING -s 10.1.1.0/24 -d 164.99.192.0/22 -j SNAT --to-source 164.99.195.8

$MYIP is the static IPv4 WAN address of the server.

The IP address in --to-source 164.99.195.8  is the one that was
dynamically allocated by the remote corporate VPN concentrator
(not under my control) at the time I've tested the setup.
I've also tried -j MASQUERADE with the same result (would be more
appropriate than SNAT as the address is dynamically allocated).

The -i/-o "!" eth+ rules are there because the 10.0.0.0/8 network
is actually not connected through eth1 as pictured in my drawing
but through our own VPN whose traffic comes in on tap+ devices.

I cannot make an iproute2 dump because I'm using the oldskool
net-tools and RTNETLINK is not compiled in the kernel. Static
routes for networks available through the remote corporate VPN
are added like that:

route add -net a.b.c.d/m dev eth0:0

where eth0:0 is configured to 164.99.195.8/22 via ifconfig in
this particular case.

This setup does work in terms that from the server I can ping
and reach any host on the corporate VPN. The problem seems to
be that after a packet comes in from our own VPN (10.0.0.0/8)
and goes through iptables and gets NATed in the POSTROUTING
chain it goes straight out to eth0 and it does not get
reevaluated whether it should be handled by IPsec.

Thanks!

Best regards,
Sab
