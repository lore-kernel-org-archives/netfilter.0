From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: HOW TRAVERSING CHAIN IN SNAT/DNAT
Date: Fri, 6 Dec 2002 16:58:13 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212061658.13173.netfilter@newkirk.us>
References: <3DF06888.10403@libero.it>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3DF06888.10403@libero.it>
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
To: Blizzards <blizzards@libero.it>, netfilter@lists.netfilter.org

On Friday 06 December 2002 04:06 am, Blizzards (Giulius) wrote:

> I need to filter packet coming from eth1 (external lan) directed to
> eth0 (internal lan).
> Packet for internal lan must be SNAT to reach external lan.
> In this enviroment filter table see packets traversing FORWARD chain
> as normal source and destination and i let it pass.
> SNAT change source address with nat address indicated (3 ip address
> configured on the box as alias of eth1) and then send packets.
> When packets return as reply to my natted connection, the chain/chains
> involved are:
>
> only input ?
> input and forward ?
> only forward?

Only FORWARD, as long as SNAT is working properly.  If these packets=20
reach INPUT there is a problem.  Incoming packets, regardless of source,=20
will end up at one of two destinations - either INPUT or=20
FORWARD->POSTROUTING->out an interface.  (assuming no rule stops them=20
along the way, like a match to a rule that DROPs or REJECTs them)  If=20
they are replies to a packet that was SNATted when it was outbound, then=20
they are automatically unSNATted, with the destination IP changed from=20
the public IP they came in for (the source the request was SNATted to)=20
to the actual IP on the internal network that the request came from, the=20
original source IP of the request.

> Someone can explain me this in detail?

In more detail, and disregarding mangle table chains (not important to=20
the discussion):

Packet comes in eth0 to nat-PREROUTING from internal network with a=20
destination IP outside the internal network, where it is recognized as a=20
packet to be forwarded, rather than input to the firewall box itself. =20
It is sent to the filter-FORWARD chain, and from there (if it is=20
ACCEPTed) goes on the nat-POSTROUTING and is SNATted and sent out the=20
appropriate interface, eth1 in this case.  Reply packets come in eth1=20
ALSO to nat-PREROUTING, where they are automatically un-SNATted=20
(changing the destination IP of the reply packets to the actual=20
destination, IE the source IP of the request packet) and from there they=20
again go to filter-FORWARD then nat-POSTROUTING and out the appropriate=20
interface, which will be eth0 based on the destination IP.

INPUT and OUTPUT chains of the filter table should only see packets=20
to/from the firewall box itself, as long as NAT and routing setup are=20
correct.  FORWARD chain of the filter table will see forwarded packets=20
in every direction, regardless of source and destination. =20

When the outbound packets reach FORWARD they have 'real' source IP and=20
correct destination IP, since SNAT is done in a later step.  Returning=20
packets will also have 'real' destination IP and correct source IP,=20
since the SNAT is undone before they reach FORWARD.

If the connection _originates_ from the external network, and the=20
internal network is 'hidden' behind one of the IPs of eth1 (usually the=20
purpose of SNAT), then they can only be validly addressed to one of=20
those IPs, and will normally be routed to INPUT since they are addressed=20
to an IP of the firewall box itself.  If you need to overcome this for=20
some reason you will need to DNAT in nat-PREROUTING to catch these=20
incoming packets and change their destination IPs to the appropriate IP=20
on the internal LAN, after which they will go through filter-FORWARD,=20
since the routing decision will now see that they are not destined for=20
the local box.

If the connection originates from the external network, addressed=20
directly to the true IP of a machine on the internal network then they=20
will by default go to filter-FORWARD anyway, since the destination IP is=20
recognized as being on the local LAN and not the firewall box.  If the=20
external network is the internet this shouldn't be the case, since the=20
local LAN machines should all have IPs in a private range that isn't=20
routable on the internet.  However, you phrased your question as=20
"external LAN", so I presume you are set up between two LANs, where it=20
may be possible for the external LAN to originate a packet addressed=20
directly to an IP on the internal LAN, and use the firewall box as a=20
router to reach that IP.

> Giulius

j


