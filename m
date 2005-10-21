From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: LAN Port forwarding with a dynamic IP address
Date: Fri, 21 Oct 2005 08:40:40 -0400
Message-ID: <FAC4E024BF776842876169173CE2F013289E@mailbox.vikus.com>
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
To: Zac Hansen <xaxxon@gmail.com>, netfilter@lists.netfilter.org

=20

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org=20
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Zac Hansen
> Sent: Friday, October 21, 2005 7:00 AM
> To: netfilter@lists.netfilter.org
> Subject: LAN Port forwarding with a dynamic IP address
>=20
> I have a single, dynamic IP address. I have multiple boxes=20
> behind a linux router, one of which runs a web server on port=20
> 80. I have set up rules (a PREROUTING and a FORWARD rule) to=20
> let people outside my LAN deal see my web server. The problem=20
> is that the boxes on my LAN can't see them.
>=20
> I really don't want to hardcode my external IP address into=20
> any rules and I don't want to do any DNS work to make the LAN=20
> boxes look up the actual server's LAN IP address directly.
>=20
> Can I get my LAN boxes to see my web site and not do the=20
> things I don't want to do?
>=20
> Thanks.
>=20
> --Zac

Your internal boxes will never see the website unless you add internal
DNS, do something extremely complicated with scripts and routing and
mangling of packets, or go with a three-legged setup. The reason for
this is that without manipulation, a router will never send a packet
*out* through the same interface it came *in* on.=20

What you want is for your internal LAN boxes to send a packet destined
to your dynamic external IP to your firewall's LAN interface and for
your firewall to say, "Hey, that server is actually <internal IP>! Let's
bounce this packet there!" after which it would mangle the destination
IP to be the internal IP and send it back. Also, you have to convince
the kernel's routing functions to take a packet which has nothing to do
with that machine and send it on to your internal webserver for every
request since your internal LAN boxes will always believe the web server
is at the external IP.

I'm sure it can be done, but internal DNS is much easier, believe me.

Derick Anderson

