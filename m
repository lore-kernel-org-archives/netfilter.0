From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: NAT of entire subnets
Date: Sat, 24 May 2003 19:51:11 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0D6CCF@wardrive.citadelcomputer.com.au>
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
To: "Vann H. Walke" <walkev@presearch.com>, netfilter@lists.netfilter.org

There is a patch-o-matic patch that does this.. forgotten the name.

it matches external IPs to internal ones.. so 203.11.11.56 would be =
192.xx.xx.56 and so on..

Not sure if you can specify it's subnet mask range though..

-----Original Message-----
From: Vann H. Walke [mailto:walkev@presearch.com]
Sent: Saturday, May 24, 2003 12:29 AM
To: netfilter@lists.netfilter.org
Subject: NAT of entire subnets


Hello,

I'm working on a project building training simulators for the US Navy.=20
The full deployment will consist of 10 simulators each of which
containing approximately 500 computers.  As we ramp up the
development/production at any given time we will have 2 to 3 systems on
site.

The only sane way of developing the network for the systems is to make
them as identical as possible.  Thus the software layout can exactly the
same on each system. =20

While in development, we require the ability to connect to each system
from our internal LAN. =20

One possibility would be to do simple NAT to one external IP address. =20
Each training system would have one external IP through which it could
be accessed.  This works fine when you are inside the system (NAT to
outside is seamless), but isn't quite as elegant from outside.=20
Accessing a given computer from our general LAN would require first
accessing a single entry point and then connecting to the desired
machine.

What I would like to do is NAT an entire domain.  So that the addresses
would be mangled to access individual machines.  Some examples of
possible conversions

Connecting to           Actually Connects to
-------------           --------------------
10.2.5.20               192.168.5.20  (in the second trainer)
10.1.3.5                192.168.3.5   (in the first trainer)
10.1.6.6                192.168.6.6   (in the first trainer)
10.2.6.6                192.168.6.6   (in the second trainer)

In this way the internal software and maintenance procedures could be
identical, but developers could easily access any system in the network.

Can iptables provide this functionality?  If so, how would one configure
it?  Are there any inherent problems/pitfalls in such a scheme?   Would
a dedicated router have this feature?  Any recommendations on using a
linux box vs. a purpose built router?

Thanks greatly,
Vann




