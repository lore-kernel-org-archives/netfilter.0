From: "Gaby Schilders" <G.Schilders@ibfd.org>
Subject: RE: DNAT + 2 uplinks + route = nogo
Date: Wed, 15 Oct 2003 14:23:19 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <DAAAFFB7B8C62F40BC87BF3E729F79E10119907A@ibfdmail.ibfd.oin>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter list <netfilter@lists.netfilter.org>
Cc: George Vieira <georgev@citadelcomputer.com.au>

Good idea. I will check if this works. Is the conmark retained on all =
packets associated with the connection?

Gaby Schilders
IBFD network admin

-----Original Message-----
From: George Vieira [mailto:georgev@citadelcomputer.com.au]
Sent: woensdag 15 oktober 2003 14:23
To: Gaby Schilders; netfilter list
Cc: Ray Leach
Subject: RE: DNAT + 2 uplinks + route =3D nogo


The only thing I can think of is using the CONNMARK (i think that's the =
one)
which marks the connection track for this connection. Could he mark the
packets as the new syn comes in? Then use ROUTE in the POSTROUTING chain =
to
redirect to the correct -o device based on the marked connection =
tracking
path??? Something like (real rough) this:

# Came in on DEV eth1
-A PREROUTING -t mangle -i eth1 -m state --state NEW -p tcp --dport 80 =
-j
CONNMARK --set-mark 1
-A PREROUTING -t nat -i eth1 -m state --state NEW -p tcp --dport 80 -j
DNAT --to 192.168.0.1

# Came in on DEV eth2
-A PREROUTING -t mangle -i eth2 -m state --state NEW -p tcp --dport 80 =
-j
CONNMARK --set-mark 2
-A PREROUTING -t nat -i eth2 -m state --state NEW -p tcp --dport 80 -j
DNAT --to 192.168.0.1

Then on the way out check the marked connection and send it via ROUTE =
and
the proper device??? I'm not 100% sure on how that part works.....

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Gaby Schilders
Sent: Wednesday, October 15, 2003 9:37 PM
To: netfilter list
Cc: Ray Leach
Subject: RE: DNAT + 2 uplinks + route =3D nogo


I had the same idea. However, the problem is discerning the packets.

A more indepth explanation of the problem (appologies to all those that =
know
the internals of netfilter better than I do):

- packets coming in over both lines are correctly DNATted (the rules =
match
and their count goes up). these packets now have a src-ip of the =
originating
host but the private address of the DNATted server as dst-ip and are =
routed
to the internal interface. So far, so good.

- the return packets for connections over both lines go to the linux =
box's
internal interface with the private address of the DNATted server as =
src-ip
and the originating host as dst-ip. How must the Linux box discern these
packets and how does it decide to send the replies through which line? =
Same
goes for the ROUTE target: what matching criteria would you use to =
discern
the packets? Both packets come from the same src (at that moment of
matching, UnDNATting is the last step of all), both have the same
destination, both have the same incoming interface (the internal =
interface).

The only distinctions are:
- The original incoming interface for the incoming packet that started =
this
connection. This information isn't currently kept in the =
connection-tracking
or state table.

- The original public ip-address that was targeted by the originating =
host
(there are two addresses, on for each uplink). This information _is_ =
kept in
the connection-tracking- (or state-) table. It is used to UnNAT the =
return
packets.

In my honest opinion, for return packets of DNAT connections, routing =
should
be done _after_ the packet is UnNATted. That way one can use all the
flexibility of iproute2 on these packets while still retaining the =
current
'view of the world' from iptables.

Alternatively, for a less flexible but workable solution, one can argue =
that
packets for DNATted connections should always go out on the interface =
the
the connection came in on. Unfortunatly, this last solution would not =
help
much in this case because I think it isn't possible with iptables or
iproute2 to select a route on the outgoing interface. (which is logical =
btw,
that is what one usually uses routing for in the first place, to find =
the
outgoing interface).

If I'm mistaken and iptables _does_ allow for discerning these packets
(perhaps because I misunderstood and conntrack or the state-table keep =
this
information after all) then I would appreciate a rule to discern the
packets.


Gaby Schilders
IBFD network admin

-----Original Message-----
From: Ray Leach [mailto:raymondl@knowledgefactory.co.za]
Sent: woensdag 15 oktober 2003 12:37
To: Netfilter Mailing List
Subject: Re: DNAT + 2 uplinks + route =3D nogo


On Wed, 2003-10-15 at 10:23, Gaby Schilders wrote:
> I'm in real trouble here so I hope somebody is able to answer this =
today
(I know, my mistake in planning doesn't mean you will rush. I can try, =
can't
I? ;)
>
> Problem as follows:
>
> - 1 linux box with 4 interfaces. Internal (private space), DMZ (can be
ignored for this issue), 2 uplinks to different providers with different
public ranges.
> - DNAT (actually portforwarding) set up to to a few internal boxes on =
1
uplink.
> - I want to do DNAT to the same internal IP-addressess over the second
link (obviously with different public ip-addressess).
> - Routing chooses the wrong uplink (gateway) for the return packets.
>
> Cause:
> DNAT is only undone at the last moment so even with iproute2's "ip =
rule"
trick I can't discern between connections coming in through one link or =
the
other for the return packets.
>
> Solution that I can think of:
> If connections are DNATted, recall the routing routing after undoing =
the
DNAT for the return packets. Problems with said solution: I can read C =
code,
but only barely, and not write it. Also, I have only a very shallow
understanding of the routing code and I'm running out of time. I don't =
know
if the code allows the distinction between DNAT return packets from all
other packets so that this can be done at all.
>
> Question:
> I have no idea how complex it would be to create this 'hack'. Does =
anyone
know of a patch that realises this feature or is someone prepared to =
create
such a patch? If not, whom should I ask instead?
>
You could try the P-O-M ROUTE target patch.
> Desperatly yours,
>
> Gaby Schilders
> IBFD network admin
--
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--



