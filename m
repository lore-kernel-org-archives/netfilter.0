From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: bridge/firewall example
Date: Thu, 2 Jan 2003 03:00:04 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301020300.04692.netfilter@newkirk.us>
References: <3E139DEF.80009@kdtc.net>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E139DEF.80009@kdtc.net>
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
To: cc <cc@kdtc.net>, Netfilter Group <netfilter@lists.netfilter.org>

On Wednesday 01 January 2003 09:03 pm, cc wrote:

> familiar with IPChains, but IPtables is a little tad
> bit more complicated so some of my questions might

bookmark the chunky HTML pages at:
http://iptables-tutorial.frozentux.net
and consider printing the PS version for mobile reference and spare-time=20
reading on the go.

> I currently have a LAN behind a router that's using
> dynamic IP.  But within the next few days, we'll
> be setting up a fixed IP (while still using the
> dynamic one in parallel for backup for now).
>
> I'm thinking of setting up a system to be the router/firewall for
> the fixed IP until the dynamic IP plan expires. AFter that, I'll
> remove the router functionality from the system and use it as
> a strict firewall.  Can someone tell me whether or not this is
> a good idea?

Sounds fine to me personally, as long as your rules are tight and the box=
=20
is secure.  Of course this is the desired situation regardless. =20
Essentially you want the LAN talking to the new box, and you want it=20
talking to the LAN and two 'external' connections.  The fact that one is=20
a router with a dynamic IP on the 'outside' isn't really significant. =20
Set up a NIC on the firewall box with a private IP on the LAN's subnet,=20
a second with the static IP connection, and a third talking to the=20
Dynamic IP router, with the third NIC and the router's local connection=20
on a different subnet from the LAN.  Set up the new box with the default=20
route specified as the static IP connection, or set up both connections=20
with load-balancing to distribute communications between them.  (=20
http://lartc.org )  If you go with just one external connection you=20
usually don't have to fiddle with routing at all.  If "until the dynamic=20
IP plan expires" is only a short time away (weeks), and you're not=20
already comfortable customising routing, my suggestion would be to just=20
ditch it.  If it's going to be around for a reasonable time (months),=20
then it's worth the time and effort now to learn how to set up the=20
routing.

If you set up this new box as a gateway from the LAN to the new static=20
connection, and the router with the Dynamic outside IP is still directly=20
accessible by the LAN, you'll have problems.  You would need to specify=20
either one or the other as the default gateway for the LAN clients.  If=20
only the new box is gateway, then it can handle everything smoothly,=20
likely without needing to touch anything on the LAN client machines.=20
(Provided you give it the address those clients currently consider their=20
default gateway)  This is probably desirable...  You could actually=20
probably get away with leaving the current dynamic connection on the LAN=20
wiring as is, but change to a different subnet for it, and set up two=20
addresses on the internal NIC of the firewall box - one on the LAN and=20
one on the new subnet.  As long as the router isn't promiscuously=20
listening to all traffic, and the new box is assigned the LAN IP that=20
was previously the inside connection on the router, this should work. =20
It is NOT as secure, however, since it would be physically possible this=20
way for a client to still talk to the router directly, instead of=20
through the firewall.

> With bridging in place (according to the "Doing Bridge with firewall"
> thread), the router's internal IP should belong to the same network
> as the LAN, right?  Then the firewalling functionality of the bridge
> system will still work?  (I too was a little confused on the issue
> of bridging vs. NATing).

Do you mean the current router with the Dynamic IP, or the new box?  If=20
the current router remains accessible directly by the LAN clients, then=20
the firewall box will normally never see packets from the clients going=20
out that connection.  Firewalling in the sense you seem to use it means=20
functioning as a filtering gateway, right?  A single-point connection=20
between the lan and the internet?  Technically the 'firewalling=20
functionality' will work even if the box is the only thing hanging on=20
the connection, since firewalling in the general sense is simply=20
selectively filtering connections or packets or whatnot.  If the box=20
also handles routing functions then firewalling extends to mean=20
filtering of connections etc between different points, IE the LAN and=20
the internet.  As long as the local client machines believe that this=20
box is their pipeline (and their ONLY pipeline) to anything not within=20
their subnet (they're configured with it as their gateway) then it's=20
firewall can extend to protect them as well as the firewall box itself,=20
since any traffic not local will be sent to it for forwarding.  If=20
another possible route exist for them to communicate with the outside=20
world (IE the present router remains on the same subnet) then the=20
firewall will NOT protect them, since they will talk to the router=20
directly without first going through the firewall.

If you have a box with IP's on two different subnets, and it passes=20
communications between those subnets, you've essentially got a bridge. =20
It's a router.  NAT is Network Address Translation, where you explicitly=20
need to change the source or destination IP of data packets passing=20
through. It only becomes necessary when some factor (like having a=20
single-point connection to the internet for several machines) forces you=20
to use a single IP address for several machines.  Like a single public=20
internet-routable IP assigned, but several machines need to use it.=20
That's SNAT, Source NAT.  Or when it is desirable to redirect=20
connections somewhere other than the destination they originally were=20
addressed to, with DNAT.  With iptables MASQUERADE is a special case of=20
SNAT that automatically handles a dynamic IP situation, but 'masquerade'=20
is also a general term for hiding several machines behind a single=20
public IP.

> Is it necessary to even set up a bridge for the firewall system?

If you have a single subnet, and this box is the only connection point to=
=20
anything outside that subnet, then just set up it's local IP as the=20
gateway for the clients, set up SNAT for outbound packets in nat=20
POSTROUTING, construct a filter FORWARD ruleset that allows the minimum=20
necessary through, and set DROP policy for INPUT, OUTPUT, and FORWARD=20
filter chains.  If the firewall box needs to communicate itself, then=20
work in INPUT and OUTPUT chains in the filter table to ACCEPT the things=20
you must allow in or out of the box's local processes.

> Also, just as an aside, I've setup a 'temporary test' setup where
> this firewall system is within the LAN but hooked up to a test
> machine whereby this test machine's IP is different from the
> rest of the LAN (as follows:)
>
>      test machine IP =3D 192.168.10.1
>      firewall 'internal' IP  =3D 192.168.10.2    (eth0)
>      firewall 'external' IP  =3D 192.168.11.120  (eth1 )
>             (the LAN's network is 192.168.11.0)
>
>      So far, with the following command:
> #
> # also including the necessary flushing of the iptables
> #
> /usr/sbin/iptables -A FORWARD -i eth0 -o eth1 -j MASQUERADE

If this is the command you are actually using it won't work.  MASQUERADE=20
is a target that is only valid in the NAT table's POSTROUTING chain,=20
just like the SNAT target.  You need to use it as:

/usr/sbin/iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE

Also, the MASQ target is ONLY used for a dynamic IP setup, since it=20
incurs extra overhead to constantly check the IP of the outbound=20
interface.  For static IP setup, with your test scenario, use:

/usr/sbin/iptables -t nat -A POSTROUTING -o eth1 SNAT --to 192.168.11.120

Your rule above is written to go into the FORWARD chain, and since no=20
table is specified it defaults to filter table's FORWARD chain.  (there=20
is also a FORWARD chain in the mangle table, but rarely used)  This is=20
the one that you use to ACCEPT/DROP/REJECT packets forwarding back and=20
forth between two machines outside the firewall box itself.  IE, if this=20
is a router and a firewall/gateway to the internet then the filter=20
FORWARD chain has to deal with packets from local A to local B, local to=20
internet, and internet back to local.  Keep this multidirectionality in=20
mind when writing rules for this chain, as this can easily trip you up=20
when you allow all the connections in the world through, but only in one=20
direction, or when you want more lenient rules for some things (like=20
local to local routing) but forget to specify source/destination or=20
in/out interface and leave things wide open for the connections you=20
/think/ you've restricted tightly.

>    I can surf the web and check email, but I can't log in to the
> LAN's network (Novell-based).   Now I realize that this might
> defeat the functionality of the firewall, but is there a way
> to allow Novell-packets through the firewall?  (It is only
> temporary.  The real firewall won't allow Novell IPX packets
> going through..)

I'm not qualified on this one, but I suspect quite a bit may be necessary=
=20
to set the box up as an IPX router, which I believe is what you'd need. =20
If I'm right, then unless you need this in normal use, or want to learn=20
how to do it, you might save yourself quite a bit of=20
time/effort/headache if you just forego this part.  Again, this is=20
uneducated speculation on my part here.

> Any clarifications appreciated.
>
> Edmund

j


