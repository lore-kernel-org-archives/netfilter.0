From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Linux routing scenario - is this possible?
Date: Mon, 17 Mar 2003 01:34:47 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303170134.47476.netfilter@newkirk.us>
References: <20030317002939.53637.qmail@web11505.mail.yahoo.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030317002939.53637.qmail@web11505.mail.yahoo.com>
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
To: Miguel Manso <mmanso@yahoo.com>, netfilter@lists.netfilter.org

On Sunday 16 March 2003 07:29 pm, Miguel Manso wrote:
> Hi there,
>
> First of all, thanks for the answer.

:^)

> The private IP I must assign to eth0 and eth2 (I was thinking about
> 192.168.1.254 and 192.168.2.254) will be used like gateways in both
> comapnies, no? If so, how do I say on the linux machine (router) that
> connections from 192.168.1.254 should leave with IP 123.123.123.100
> and connections from 192.168.2.254 with IP 123.123.123.101?

iptables -t nat -A POSTROUTING -o eth1 -s 192.168.1.0/24  \
-j SNAT --to 123.123.123.100
iptables -t nat -A POSTROUTING -o eth1 -s 192.168.2.0/24  \
-j SNAT --to 123.123.123.101

OR

iptables -t nat -A POSTROUTING -i eth0 -j SNAT --to 123.123.123.100
iptables -t nat -A POSTROUTING -i eth2 -j SNAT --to 123.123.123.101

> Don't know if I'm expressing myself correctly.

You seem clear to me.=20

Your first priority needs to be determining if you can use the two IPs=20
and distinguish between them on your box.  If the NAT from local IPs to=20
public and back is all handled by the modem then netfilter on a machine=20
connected to that modem probably can't do a thing.  If this is what is=20
happening, you need to see if you can reconfigure the modem to pass=20
things through unchanged.

I'm not sure what your DSL setup is like.  For me, I use a Westell White=20
modem, and even though it connects via ethernet to my gateway, it works=20
like a 'normal' modem, where the gateway itself has the IPs via PPPoE,=20
not the modem.  The modem itself is transparent - for all intents and=20
purposes my gateway connects 'directly' to the upstream gateway at my=20
ISP.=20


> Well, the modem IP is 192.168.0.1 (can be configured on the modem via
> a http interface) and I've just assigned on the linux box (acting as a
> router) the 192.168.0.5 IP to the ethernet where I connect the modem
> to. On this machine I've defined the modem IP 192.168.0.1 as being the
> gateway.

OK, but when the incoming traffic reaches your netfilter box, what is its=
=20
destination IP?  If it no longer has the 123.123.123.100 and=20
123.123.123.101 IPs at that point, then you can't DNAT on the iptables=20
box.  (well, of course you CAN, but telling the two streams of traffic=20
apart is the problem)  If you don't know, try setting a LOG rule:

iptables -t nat -I PREROUTING 1 -i eth1 -p icmp -j LOG --log-prefix=20
"ICMP:"

for instance.  With this rule in place, have someone at a machine outside=
=20
your network ping your public IPs through the internet, and see what the=20
log shows for DestinationIP of the incoming Pings.  After they try the=20
ping (even if it doesn't get through) try "cat /var/log/messages | grep=20
ICMP".  (BTW, the "-I ... 1" means insert as rule #1 in the chain)

> > Also, be aware that if you redirect all incoming 123.123.123.100 to
> > one company, and all 123.123.123.101 to the other, that leaves
> > nothing incoming to you. =20

> Yes, but that's not a problem since one of the companies is my own.
> We've one 1024 kbits DSL line and we're trying to "split" the costs
> between our and other companies.

OK.

> Any information about the subject will be appreciated. I'm a newbie on
> the subject needing some direction points.

First resource oughtta be http://iptables-tutorial.frozentux.net

j

