From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Using an device alias?
Date: Mon, 6 Jan 2003 16:41:08 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301061641.08487.netfilter@newkirk.us>
References: <b74ecb8788.b8788b74ec@cvip.net> <3E19DD6B.7070503@csufresno.edu> <3E19DF62.9000106@csufresno.edu>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E19DF62.9000106@csufresno.edu>
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
To: Steve <smb23@csufresno.edu>, netfilter@lists.netfilter.org

On Monday 06 January 2003 02:56 pm, Steve wrote:
> This is a second repost, the first one appears to have disapeared.
>
> Joel Newkirk wrote:
> > On Friday 03 January 2003 02:28 pm, Steve M Bibayoff wrote:
> >> Is it possible to use iptables with a device alias
> >> (ex.. eth0:1)? I tries to add a filter rule and got
> >> an error:
> >> % iptables -t filter -I INPUT -i eth0:1 -j ACCEPT
> >> Warning: wierd character in interface `eth0:1' (No
> >> aliases, :, ! or *).
> >
> > Solution #1:
> > Since this is the INPUT chain, then the local machine clearly is the
> > destination.  (unless you are using the REDIRECT target in nat
> > PREROUTING)  I suggest you try something like:
>
> Unfornately, I am doing redirect nat. More specifiacally MASQ

Within iptables semantics, REDIRECT is a specific form of NAT wherein you=
=20
are taking an incoming connection that would otherwise forward (IE, not=20
addressed to the local box) and DNATting it to the local box, so that it=20
comes in INPUT instead of forwarding to somewhere else.  (for example,=20
running a transparent proxy server on the firewall box)  If all you are=20
doing is MASQUERADE then you are NOT doing REDIRECT.  Also, if your=20
public IP is static you should use "-j SNAT --to 1.2.3.4" instead of "-j=20
MASQUERADE", to avoid the overhead of netfilter constantly polling the=20
external interface to adapt to IP changes.  This is another semantics=20
issue sometimes, where many people say 'masquerade' to mean hiding=20
several machines behind a single (or possibly more :^) public IP, but=20
the iptables target 'MASQUERADE' is a specific form of SNAT where=20
instead of specifying the source IP to use when NATting the packets, you=20
tell netfilter to use whatever the current IP of the interface is.

For emails I write, when these terms are capitalized I mean the actual=20
targets (or chains, like FORWARD and OUTPUT) used in iptables rules,=20
since the targets are all caps when used in rules.  I usually try to=20
avoid using 'masquerade' and 'redirect' in their more general meaning if=20
there's any chance of confusion.

{snip}

> The box has only 2 network connections(internal/external). What I need
> to do is produce another real ip (1.2.3.5) that could be directly
> nat'ed to an internal windows(192.168.0.2) machine without any
> filtering. So
>
> the new network looks like this:
> |------|192.168.0.2   192.168.0.1|------|1.2.3.4/28
> |winows|---------------------eth1|RH 7.3|eth0----------------
> |------|          /              |      |1.2.3.5/?   /
>
>                  /               |------|eth0:0-----/
> rest of network-/

You have two public IP's and want the machine to respond to both, but=20
forward connection coming in on one of them to a separate server in the=20
local network, right?  If so, then set up your alias on the interface=20
(eth0:0) with:

ifconfig add eth0 1.2.3.5

and then add the following rule:

iptables -t nat -A PREROUTING -i eth0 -d 1.2.3.5 -j DNAT --to 192.168.0.2

and everything should work happily.  Just make sure that any other=20
PREROUTING rules either appear after this one, or are written so as not=20
to interfere with this specific traffic.  Also, make sure that you allow=20
this and replies through FORWARD, but netfilter will handle undoing the=20
DNAT when the packets come back through.  Read through the section on=20
DNAT in Oskar Andreasson's iptables tutorial at:=20
http://iptables-tutorial.frozentux.net/chunkyhtml/targets.html#DNATTARGET=
=20
and you'll probably find that everything falls into place.=20

The key to this in your circumstance is specifying the destination IP (in=
=20
PREROUTING - in FORWARD you would test for "-d 192.168.0.2") as well as=20
the arriving interface, to separate this traffic from everything else=20
coming in that same physical interface.  Also note that once you perform=20
the DNAT in PREROUTING then the destination IP will be that of the=20
internal machine when the packet hits any other chains in the firewall,=20
and reply traffic will have source IP of the internal machine up until=20
it reaches POSTROUTING, just before leaving the firewall and returning=20
back out eth0.

> Hopefully this makes some sense. From searching the archive, I've
> found the following ideas:
> ip addr add w.x.y.z/bits dev eth0 label eth00
> http://lists.netfilter.org/pipermail/netfilter/2002-October/038968.htm
>l This didn't work, kept getting errors after I tried to check the
> interface with 'ifconfig' and 'ip addr list'
>
> I've also tried to just foward the address with this
> iptables -A PREROUTING -a nat -d 1.2.3.5 -j DNAT --to 192.168.0.2
> iptables -A FORWARD -d 192.168.0.2 -j ACCEPT
> http://lists.netfilter.org/pipermail/netfilter/2002-September/038129.h
>tml This appears to be working when I try go from the internal machine
> to the outside, but I can't connect from the outside to inside (tried
> nmap, got the RH 7.3 sig).

Are you allowing return traffic back out through the FORWARD chain?  The=20
DNAT you have above should have no effect at all on connections from=20
internal to outside, unless the destination is 1.2.3.5.  (and those=20
would fail for a different reason... see link above for more)  The only=20
things that should affect connections from internal to outside should be=20
FORWARD chain rules to let them through, and SNAT or MASQUERADE in nat=20
POSTROUTING chain to hide their actual source behind the public IP. =20
(unless you have some other DNAT or REDIRECT rule that affects them, and=20
the DNAT we're discussing normally would not)

j

> If someone knows the script I'm using and knows what hanging me up
> could you please point out my error, if not, I think I'll eventually
> get it.
>
> TIA
>
> Steve
>
> 1) Don't rememeber if was this list or not about search capacity, but
> I use advanced google (ie add "site:lists.netfilter.org" in the search
> field). hth.


