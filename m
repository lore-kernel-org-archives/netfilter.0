From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: [Bridge] iptables - bridge - physin
Date: Thu, 3 Apr 2003 09:27:27 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304030927.27692.netfilter@newkirk.us>
References: <D3DD55FDB74AD511BA5100500416368017659C@orion.ibh.de>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <D3DD55FDB74AD511BA5100500416368017659C@orion.ibh.de>
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
To: Jochen Vogel <jvogel@it-sec.de>, "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>, "'bridge@math.leidenuniv.nl'" <bridge@math.leidenuniv.nl>

On Thursday 03 April 2003 03:05 am, Jochen Vogel wrote:
> hi,
>
> i use:
>
> -RedHat8.0
> -kernel-2.4.18-26.8.0
> -libnet1.0.2a
> -iptables-1.2.7a
> -snort-inline1.9.1-2

(Joel originally replied)
> > No option, just reference them directly.  You can use any of
> > the three interface names, IE eth0,eth1,br0 in your rules.
>
> what do you mean with reference directly

If you try to match "-i eth0" and the packet arrived on eth0 it will=20
match, whether you are bridging or not.  As mentioned below (I don't=20
know whose reply you folded into mine?) things are different if you are=20
running a 2.5.x kernel, but with 2.4.x, RedHat8 and bridging you can=20
just use the physical interface with "-i" and "-o" matches.  You can=20
also test "-i br0" and match packets inbound on either physical=20
interface bound to the bridge.

(someone else replied)
> > In the 2.4 patch you can just use -i and -o, for the 2.5
> > standard kernel, you need to use the ipt_physdev module (the kernel
> > module is in
> > the standard 2.5 kernel, the userspace module is in the iptables CVS
> > (standard make is enough)).
>
> what should i do?
>
> in my iptables script i use -i eth0
> in my log the packet dropped because (IN=3Dbr0 PHYSIN=3Deth0) IN doesn=B4=
t
> match

It seems likely that the packet drops are for another reason.  Try:

iptables -I FORWARD 1 -i eth0 -j LOG --log-prefix "FWDeth0:"
iptables -I INPUT 1 -i eth0 -j LOG --log-prefix "INeth0:"
iptables -I FORWARD 2 -i eth1 -j LOG --log-prefix "FWDeth1:"
iptables -I INPUT 2 -i eth2 -j LOG --log-prefix "INeth1:"
iptables -I FORWARD 3 -i br0 -j LOG --log-prefix "FWDbr0:"
iptables -I INPUT 3 -i br0 -j LOG --log-prefix "INbr0:"

You should see that the packets match one of the first four rules and are=
=20
logged as such, and also match one of the "br0" rules.  (presuming you=20
are using eth0, eth1, and br0)  "-i eth0" will match packets that come=20
in physical interface eth0 and they are logged as "IN=3Dbr0 PHYSIN=3Deth0=
".

> thx for help
> jo

j


