From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Access to two identical subnets
Date: Tue, 31 Aug 2004 09:52:33 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF591E366@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Andreas Granheim <andreasg@client.no>, netfilter@lists.netfilter.org


> When I ping 10.100.50.5 (linux server on B Subnet) from 192.168.1.35
> (linux comp), I LOG in the VPN 1 box:=20
>=20
> 12206.080946 192.168.1.35 -> 10.50.50.5: icmp: echo request
> 12207.081074 192.168.1.35 -> 10.50.50.5: icmp: echo request=20
>=20
> But it doesn't get any reply.

Since 10.50.50.0 Exists on both sides of the VPN1 server, it can't tell
which path to route the return traffic. I assume the default route for
VPN1 is anything but FW when the VPN is engaged.
=20

The rest of what you describe is pretty ambiguous. I'm making
assumptions about your design since the ASCII art looked like spahgetti.
Here goes:

Internet  192.168.1.0
  |  |        |
  |  ---------FW---------
  |                     |
 10.50.50.0        10.100.50.0
 ROUTER            IPTables FW
    |          10.50.6.0   10.50.50.0
 10.50.50.0       |            |---10.50.50.0
 VPN2<.Internet.>VPN1


Before knowing why the hell your performing suck a royally disgusting
hack (Subnets are atomicly located for a reason), why do you need both
networks to be 10.50.50.0?

Why can't you drag VPN1 into the 10.50.50.0 network and use bridging
software on the VPN to perform interface bridging between the
Ipsec/PPTP/etc.. interface and the interface used on 10.50.50.n? In
which case, you could redirect all traffic destined for 10.50.50.n in
the same direction, into subnet B. Once there, the packet will be
received by one of the servers in that network, or it'll get proxyarped
(which you'll have to setup) on the VPN1 and forward it through to
(subnetA). Once again, unless there's a damn good business reason why
these subnets must be identical, then CHANGE IT!


