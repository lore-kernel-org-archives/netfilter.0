From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: H/A
Date: Tue, 27 May 2003 21:34:17 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A019249@wardrive.citadelcomputer.com.au>
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
To: kluivert@tm.net.my, netfilter@lists.netfilter.org

I have 2 LANS on different NICs behind the firewall. both are connected =
to both firewalls. I have only 1 internet link that they both share.

State info is hard.. not without special hardware or software. netfilter =
doesn't do any of this that I know of.

I hate to see it done with software as a very busy site with huge =
traffic (ie. we run 20+ websites) and the amount of /proc/net/ipt_* =
stuff that would need to be transferred continously would be a =
nightmare.. not to mention the VPN stuff..

company to company isn't hard, even if the link drops between fallover, =
the sessions aren't lost.. unless the fallover takes too long to =
shutdown FW1 and startup FW2 and bring the VPN up..

Yes, more info would be needed but I doubt there would be 100% state =
transfer...

-----Original Message-----
From: Julian Gomez [mailto:kluivert@tm.net.my]
Sent: Tuesday, May 27, 2003 8:09 PM
To: netfilter@lists.netfilter.org
Subject: Re: H/A


On Tue, May 27, 2003 at 07:47:31AM +1000, George Vieira spoke thusly:
>LIVE IP=3D203.x.x.x
>FW1=3D10.1.1.1    FW2=3D10.1.1.1
>
>using iproute2 I add the live IP to FW1 which is the Master FW.
>
>ip add addr 203.x.x.x/28 dev eth0
>
>Then my firewall scripts find the dev IP using "ip addr show $EXTDEV" =
add
>then "tail -1" for so it grabs the last line of the list otherwise it
>finds 2 IP bounded to the 1 network card and the scripts go nuts.. See
>snippet of my iptables script below.

George,

You have not stated, exactly what failover scenarios does your setup =
work
for ? Ie,

[ internet link #1 ] +- [ firewall #1 ] -- +-------+
                     |                     | LAN1  |
	             |                     | LAN2  |=20
[ internet link #2 ] +- [ firewall #2 ] -- +-------+

I was addressing something like the above. If firewall #1 goes down,
firewall #2 can take over, but it still requires that all state =
information
from firewall #1; be propogated to firewall #2. I am not taking into
account any load balancing requirements, pure failover. State info for =
both
iptables + their VPN setup. [*]

I don't understand how your unique IP addressing method will solve the
above, though your setup itself isn't very clear to me.

That said, the original poster didn't exactly state (IIRC) what sort of =
VPN
setup he is using (office <-> office), what exactly does he want
fail-over'ed, does he have dual Internet links and many many other bits =
of
information.

Take note, that even my ascii diagran above only caters for certain
failover scenarios.


