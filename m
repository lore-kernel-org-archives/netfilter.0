From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: Help needed for a box with 4 Ethernet Interfaces
Date: Thu, 4 Aug 2005 13:43:25 -0400
Message-ID: <E656E2CC1C5AEB42ACB00EB83122C7741FCA52@farmer.vikus.com>
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

OK, let me see if I understand: Boxes A and C have 2 interfaces, Box D
has one, and Box B has 4. What are the other two interfaces doing on A
and C? Each pair of interfaces that connect physically *must* be on the
same subnet, period. You can have two boxes with the same IP in the same
subnet, but there must be a different subnet between them (requiring not
one but two routers) or the routes will *never* work. An example of this
would be a client on a private network connecting to a server on a
private network via the Internet (the (x)'s are routers, like your box
B):

Client [192.168.0.2] > (x) > Internet > (x) > Server [192.168.0.2]

You simply cannot do this:

Client [192.168.0.2] > (x) > Client [192.168.0.2]

whether traffic is allowed through or not. The router can't do it. If
each box is in it's own subnet, then you'll be fine. If you want two
boxes in the same subnet, put them both on a hub or switch. Without
knowing the purpose of this configuration I'm not sure I can help out
much more than that.

Derick Anderson

-----Original Message-----
From: Dave Johnson [mailto:davejohnson_hifi@yahoo.com]=20
Sent: Thursday, August 04, 2005 1:25 PM
To: Derick Anderson; netfilter@lists.netfilter.org
Subject: RE: Help needed for a box with 4 Ethernet Interfaces


Derick:

Thanks very much for your response. However as I mentioned in my
previous email, box A and C have
2 interfaces.=20
Issue here is that any packet coming in on Eth2/Eth3 for 192.168.0.x
needs to be routed to
Eth2/Eth3 only, not to Eth1 (which is local interface). For example, if
Box C pings Box A on 192.168.0.1, Box B intercepts that becuase it has
192.168.0.1 as its local interface and starts to respond back to Box C.

Thanks

Dave



--- Derick Anderson <danderson@vikus.com> wrote:

> If the drawing is messed up I apologize - Outlook doesn't seem to like

> plain-text stuff.
>=20
> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Derick=20
> Anderson
> Sent: Thursday, August 04, 2005 1:01 PM
> To: netfilter@lists.netfilter.org
> Subject: RE: Help needed for a box with 4 Ethernet Interfaces
>=20
> Wow. First, let's give some names to each box so we both know which=20
> one I'm referring to. The box (box "B" in your diagram) with 4=20
> interfaces is your router. Boxes A, C, and D will be called as=20
> "internal boxes" as a group.
>=20
> You must realize that you can't set up interfaces on your router with=20
> the same IP address. If you want Box A to connect to Box B, /through/=20
> the router (rather than say, through a hub), then you must either=20
> separate the subnets or bridge the two interfaces.
>=20
> Secondly, each of your internal boxes must use the same subnet as the=20
> interface they connect to. For example, according to your diagram, Box

> C has an address of 192.168.0.2, and is attempting to connect to=20
> 21.21.21.9. Unless your netmask (usually 255.255.255.0) is 0.0.0.0,=20
> Box C will not be connecting to your router by design.
>=20
> Third, a loopback interface is not a physical interface, it is a=20
> virtual one and is set to 127.0.0.1 (as I recall the entire=20
> 127.0.0.0/8 network is reserved for it). Your box cannot function as a
"loopback interface."
>=20
> Now as to your goals - can I ask what exactly you are trying to do? In

> order to separate each of these boxes, I'll redo your diagram for you:
>=20
> =20
> ------------
> =20
> -----------------------------|  Box D   |
>                               172.16.6.10   |      192.168.0.1/24
> |          |
>          Mgmt Port<---------------------|   |
> ------------
>                                         |   | 192.168.0.1
> 192.168.0.2
>                                    Eth0 |   | Eth1 (for internal
> network)
>  ------------                        ------------
> ------------
>  |  Box A   |________________________|  Box B
> |________________________|  Box C   |
>  |          |                    Eth2|          | Eth3
> |          |
>  ------------     10.1.1.0/24        ------------       21.21.21.0/24
> ------------            =20
>   10.1.1.1                       10.1.1.1     21.21.21.1
> 21.21.21.2
>=20
> This will allow your boxes (given the correct routing tables on your
> router) to actually communicate with the router. You can then use=20
> iptables to decide which packets can go where. For (a partial)
example:
>=20
> $IPT -P FORWARD DROP
> $IPT -A FORWARD -i eth2 -o eth3 -j ACCEPT $IPT -A FORWARD -i eth3 -o
> eth2 -j ACCEPT $IPT -A FORWARD -i eth0 -j ACCEPT $IPT -A FORWARD -o=20
> eth0 -j ACCEPT
>=20
> So what you are doing here is accepting packets that are coming [i]nto
> eth2 and going [o]ut eth3, into eth3 and out eth2, and anything=20
> destined to go in or out eth0 (determined by your routing tables) will

> be allowed.
>=20
> You could (and should) use iptables to ensure that the appropriate IPs

> are going out the appropriate interfaces, in addition to the proper=20
> ports, but there's a bunch of neat guides on www.netfilter.org you=20
> should look at before doing too much on your own. You should also=20
> consider learning a lot more about networking.
>=20
> Hope that helps, and if I missed anything here someone will point it=20
> out (that's my money-back guarantee).
>=20
> Derick Anderson
>=20
>=20
> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Dave=20
> Johnson
> Sent: Thursday, August 04, 2005 12:12 PM
> To: netfilter@lists.netfilter.org
> Subject: Help needed for a box with 4 Ethernet Interfaces
>=20
> Hi All:
> I need help to setup my box with some complicated configuration.
>=20
> I have a box with 4 Ethernet Interfaces:
>=20
> Eth0: 172.16.6.10
> Eth1: 192.168.0.1/24
> Eth2: 10.1.1.0/24      ------> Connected to a box A with an IP address
> of 192.168.0.2
> Eth2: 21.21.21.9/24    ------> Connected to a box C with an IP address
> of 192.168.0.1 (which is
> same as IP address of Eth1)
>=20
> Loopback Interface: 192.168.0.3
> =20
> ------------
> =20
> -----------------------------|  Box D   |
>                               172.16.6.10   |
> |          |
>          Mgmt Port<---------------------|   |
> ------------
>                                         |   | 192.168.0.1
> 192.168.0.2
>                                    Eth0 |   | Eth1 (for internal
> network)
>  ------------                        ------------
> ------------
>  |  Box A   |________________________|  Box B
> |________________________|  Box C   |
>  |          |                    Eth2|          | Eth3
> |          |
>  ------------     10.1.1.0/24        ------------       21.21.21.9/24
> ------------            =20
>   192.168.0.1                         192.168.0.3
> 192.168.0.2
>=20
> Here is what I want to do:
> Packets from Eth2 should only go to Eth3 except the ones detined to=20
> Eth0's IP.
> Packets from Eth3 should only go to Eth2 except the ones detined to=20
> Eth0's IP.
> Local packets destined for Eth1's ip and its subnet should be=20
> forwarded via Eth1 only.
> Packets from Eth1 can only be directed to Eth0.=20
>=20
> This will allow me to ping Box A (192.168.0.1) from Box C=20
> (192.168.0.2) without getting a response from Box B who has local=20
> interface with address 192.168.0.1.
>=20
> Basically I want to isolate interfaces in 2 groups:
> One with Eth0, Eth2 and Eth3
> Second with Eth0 and Eth1.
>=20
> I tried IPtables and multiple routing tables but it did not work. I=20
> think I need some directions as to how would this even be possible.
>=20
> Thanks
>=20
> Dave.
>=20
>=20
>=20
> __________________________________________________
> Do You Yahoo!?
> Tired of spam?  Yahoo! Mail has the best spam protection around=20
> http://mail.yahoo.com
>=20
>=20
>=20
>=20



	=09
____________________________________________________
Start your day with Yahoo! - make it your home page
http://www.yahoo.com/r/hs=20
=20

