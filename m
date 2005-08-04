From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: Help needed for a box with 4 Ethernet Interfaces
Date: Thu, 4 Aug 2005 16:40:44 -0400
Message-ID: <E656E2CC1C5AEB42ACB00EB83122C7741FCA6B@farmer.vikus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

OK that makes a lot more sense. You still have some problems: the subnet
which Box B/eth3 and Box C/eth1 are on is 21.21.21.9/24. Depending on
how your network card interprets this, I believe it will ignore all IPs
below 21.21.21.9 (including both box B and C).

Your second problem is having two interfaces on a router inside the same
subnet - 192.168.0.0/24. How is the router supposed to know which
interface to use when routing a packet to 192.168.0.0/24? You'd have to
create a static route (and give it a higher priority) for each IP, and
the only way *that* would work is if you connected (using a hub) Box
B/eth3 with Box A and C's eth0. Do that and you've got a huge mess on
your hands with multiple paths to end hosts.

Your third problem is that you want to ping 192.168.0.1 from Box C and
have Box B respond as if it were Box A. This won't work because Box C
has an interface with IP address of 192.168.0.2 and presumably a netmask
of 255.255.255.0. So when Box C sends a packet, it says to itself, "I've
got an interface (eth0) on subnet 192.168.0.0/255.255.255.0, I'll use
that to send my ping." But that interface isn't connected to anything
(according to your diagram). So nothing happens.

I really don't see a way this would work, even with iptables. You are
going against every fundamental of networking with this setup. There are
much simpler ways to isolate boxes A and C from D and have them all pass
through the same router, using routes and iptables, as they were
intended to be used.

-----Original Message-----
From: Dave Johnson [mailto:davejohnson_hifi@yahoo.com]=20
Sent: Thursday, August 04, 2005 3:47 PM
To: Derick Anderson; netfilter@lists.netfilter.org
Subject: RE: Help needed for a box with 4 Ethernet Interfaces


Derick:
As I mentioned earlier, box A and C have 2 interfaces. One of them has
192.168.0.x based address and the other one is connected to Box B via
Eth1.
Here is how it looks like:=20
=20
------------
=20
-----------------------------|  Box D   |
                              172.16.6.10   |
|          |
         Mgmt Port<---------------------|   |
------------
                                        |   | 192.168.0.1
192.168.0.2
                                   Eth0 |   | Eth1 (for internal
network)
 ------------                        ------------
------------
 |  Box A   |10.1.1.1--------10.1.1.2|  Box B   |21.21.21.2
-----21.21.21.1|  Box C   |
 |          |Eth1                Eth2|          | Eth3
Eth1|          |
 ------------     10.1.1.0/24        ------------       21.21.21.9/24
------------
  192.168.0.1(eth0)                   192.168.0.3
192.168.0.2 (eth0)


Eth2 and Eth3 on Box B are data interfaces, Eth1 is for internal use,
and Eth0 is mgmt port.=20

Purpose of this configuration is to isolate interfaces on Box B into 2
groups so data traffic can only flow among Eth0, Eth2 and Eth3.
Currently, data packets destined for dest addr 192.168.0.1 are handled
by Box B and are not forwrded to Eth2 for Box A.=20

Thanks

Dave.


--- Derick Anderson <danderson@vikus.com> wrote:

> OK, let me see if I understand: Boxes A and C have 2 interfaces, Box D

> has one, and Box B has 4. What are the other two interfaces doing on A

> and C? Each pair of interfaces that connect physically *must* be on=20
> the same subnet, period. You can have two boxes with the same IP in=20
> the same subnet, but there must be a different subnet between them=20
> (requiring not one but two routers) or the routes will *never* work.=20
> An example of this would be a client on a private network connecting=20
> to a server on a private network via the Internet (the (x)'s are=20
> routers, like your box
> B):
>=20
> Client [192.168.0.2] > (x) > Internet > (x) > Server [192.168.0.2]
>=20
> You simply cannot do this:
>=20
> Client [192.168.0.2] > (x) > Client [192.168.0.2]
>=20
> whether traffic is allowed through or not. The router can't do it. If=20
> each box is in it's own subnet, then you'll be fine. If you want two=20
> boxes in the same subnet, put them both on a hub or switch. Without=20
> knowing the purpose of this configuration I'm not sure I can help out=20
> much more than that.
>=20
> Derick Anderson
>=20
> -----Original Message-----
> From: Dave Johnson [mailto:davejohnson_hifi@yahoo.com]
> Sent: Thursday, August 04, 2005 1:25 PM
> To: Derick Anderson; netfilter@lists.netfilter.org
> Subject: RE: Help needed for a box with 4 Ethernet Interfaces
>=20
>=20
> Derick:
>=20
> Thanks very much for your response. However as I mentioned in my=20
> previous email, box A and C have
> 2 interfaces.=20
> Issue here is that any packet coming in on Eth2/Eth3 for 192.168.0.x=20
> needs to be routed to
> Eth2/Eth3 only, not to Eth1 (which is local interface). For example,=20
> if Box C pings Box A on 192.168.0.1, Box B intercepts that becuase it=20
> has
> 192.168.0.1 as its local interface and starts to respond back to Box
C.
>=20
> Thanks
>=20
> Dave
>=20
>=20
>=20
> --- Derick Anderson <danderson@vikus.com> wrote:
>=20
> > If the drawing is messed up I apologize - Outlook doesn't seem to=20
> > like
>=20
> > plain-text stuff.
> >=20
> > -----Original Message-----
> > From: netfilter-bounces@lists.netfilter.org
> > [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Derick=20
> > Anderson
> > Sent: Thursday, August 04, 2005 1:01 PM
> > To: netfilter@lists.netfilter.org
> > Subject: RE: Help needed for a box with 4 Ethernet Interfaces
> >=20
> > Wow. First, let's give some names to each box so we both know which=20
> > one I'm referring to. The box (box "B" in your diagram) with 4=20
> > interfaces is your router. Boxes A, C, and D will be called as=20
> > "internal boxes" as a group.
> >=20
> > You must realize that you can't set up interfaces on your router=20
> > with the same IP address. If you want Box A to connect to Box B,=20
> > /through/ the router (rather than say, through a hub), then you must

> > either separate the subnets or bridge the two interfaces.
> >=20
> > Secondly, each of your internal boxes must use the same subnet as=20
> > the interface they connect to. For example, according to your=20
> > diagram, Box
>=20
> > C has an address of 192.168.0.2, and is attempting to connect to=20
> > 21.21.21.9. Unless your netmask (usually 255.255.255.0) is 0.0.0.0,=20
> > Box C will not be connecting to your router by design.
> >=20
> > Third, a loopback interface is not a physical interface, it is a=20
> > virtual one and is set to 127.0.0.1 (as I recall the entire
> > 127.0.0.0/8 network is reserved for it). Your box cannot function as

> > a
> "loopback interface."
> >=20
> > Now as to your goals - can I ask what exactly you are trying to do?=20
> > In
>=20
> > order to separate each of these boxes, I'll redo your diagram for
you:
> >=20
> > =20
> > ------------
> > =20
> > -----------------------------|  Box D   |
> >                               172.16.6.10   |      192.168.0.1/24
> > |          |
> >          Mgmt Port<---------------------|   |
> > ------------
> >                                         |   | 192.168.0.1
> > 192.168.0.2
> >                                    Eth0 |   | Eth1 (for internal
> > network)
> >  ------------                        ------------
> > ------------
> >  |  Box A   |________________________|  Box B
> > |________________________|  Box C   |
> >  |          |                    Eth2|          | Eth3
> > |          |
> >  ------------     10.1.1.0/24        ------------
21.21.21.0/24
> > ------------            =20
> >   10.1.1.1                       10.1.1.1     21.21.21.1
> > 21.21.21.2
> >=20
> > This will allow your boxes (given the correct routing tables on your
> > router) to actually communicate with the router. You can then use=20
> > iptables to decide which packets can go where. For (a partial)
> example:
> >=20
> > $IPT -P FORWARD DROP
> > $IPT -A FORWARD -i eth2 -o eth3 -j ACCEPT $IPT -A FORWARD -i eth3 -o
> > eth2 -j ACCEPT $IPT -A FORWARD -i eth0 -j ACCEPT $IPT -A FORWARD -o=20
> > eth0 -j ACCEPT
> >=20
> > So what you are doing here is accepting packets that are coming=20
> > [i]nto
> > eth2 and going [o]ut eth3, into eth3 and out eth2, and anything=20
> > destined to go in or out eth0 (determined by your routing tables)=20
> > will
>=20
> > be allowed.
> >=20
> > You could (and should) use iptables to ensure that the appropriate=20
> > IPs
>=20
> > are going out the appropriate interfaces, in addition to the proper=20
> > ports, but there's a bunch of neat guides on www.netfilter.org you=20
> > should look at before doing too much on your own. You should also=20
> > consider learning a lot more about networking.
> >=20
> > Hope that helps, and if I missed anything here someone will point it

> > out (that's my money-back guarantee).
> >=20
> > Derick Anderson
> >=20
> >=20
> > -----Original Message-----
> > From: netfilter-bounces@lists.netfilter.org
> > [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Dave=20
> > Johnson
> > Sent: Thursday, August 04, 2005 12:12 PM
> > To: netfilter@lists.netfilter.org
> > Subject: Help needed for a box with 4 Ethernet Interfaces
> >=20
> > Hi All:
> > I need help to setup my box with some complicated configuration.
> >=20
> > I have a box with 4 Ethernet Interfaces:
> >=20
> > Eth0: 172.16.6.10
> > Eth1: 192.168.0.1/24
> > Eth2: 10.1.1.0/24      ------> Connected to a box A with an IP
address
> > of 192.168.0.2
> > Eth2: 21.21.21.9/24    ------> Connected to a box C with an IP
address
> > of 192.168.0.1 (which is
> > same as IP address of Eth1)
> >=20
> > Loopback Interface: 192.168.0.3
> > =20
> > ------------
> > =20
> > -----------------------------|  Box D   |
> >                               172.16.6.10   |
> > |          |
> >          Mgmt Port<---------------------|   |
> > ------------
> >                                         |   | 192.168.0.1
> > 192.168.0.2
> >                                    Eth0 |   | Eth1 (for internal
> > network)
> >  ------------                        ------------
> > ------------
> >  |  Box A   |________________________|  Box B
> > |________________________|  Box C   |
> >  |          |                    Eth2|          | Eth3
> > |          |
> >  ------------     10.1.1.0/24        ------------
21.21.21.9/24
> > ------------            =20
> >   192.168.0.1                         192.168.0.3
> > 192.168.0.2
> >=20
> > Here is what I want to do:
> > Packets from Eth2 should only go to Eth3 except the ones detined to=20
> > Eth0's IP.
> > Packets from Eth3 should only go to Eth2 except the ones detined to=20
> > Eth0's IP.
> > Local packets destined for Eth1's ip and its subnet should be=20
> > forwarded via Eth1 only.
> > Packets from Eth1 can only be directed to Eth0.=20
> >=20
> > This will allow me to ping Box A (192.168.0.1) from Box C
> > (192.168.0.2) without getting a response from Box B who has local=20
> > interface with address 192.168.0.1.
> >=20
> > Basically I want to isolate interfaces in 2 groups:
> > One with Eth0, Eth2 and Eth3
> > Second with Eth0 and Eth1.
>=20
=3D=3D=3D message truncated =3D=3D=3D


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around
http://mail.yahoo.com=20

