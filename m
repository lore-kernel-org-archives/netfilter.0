From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: Multiple IPSEC VPNs through a firewall based on 2.4.2X kernel
Date: Wed, 25 Aug 2004 07:44:55 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC90512C9@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> Thanks Jason.
>
> > enable IKE over TCP on the clients and UDP encapsulation.
> > this is not a problem with netfilter, but with multiple
> >  IPSec clients behind *any* NAT =3D device.
>
> Perhaps some additional info needs to be added about my configuration.
> I need to use standard Cisco Linux clients, as this is for people
> visiting (with their laptops and standard VPN setup for remote access)
> and wanting to get to their (Cisco) server.  In fact, it could be more
> than one ipsec server at some time in the future.  I definitely need =
to
> use a Cisco VPN gateway (can't use FreeSwan), I cannot have a single =
vpn
> client from the Linux router device as the requirement is for multiple
> clients behind this device.  The Cisco gateway and Win 2k client can =
set
> up a connection through a NAT router, we have tried this with a =
Netgear
> device.  So I thought the issue was similar to pptp vpn pass-through =
for
> multiple clients (i.e. a patch for the kernel/iptables was the way to
> go), hence the question.
>
> Kind regards, Roksana

the standard cisco vpn client for linux supports IKE over TCP & UDP/TCP =
tunneling of IPSec traffic--read the admin guide for details.  the =
settings are something like:

  EnableNat=3D1
  TunnelingMode=3D0
  TcpTunnelingPort=3D10000

the easiest way to do this is just take the .pcf file from a working =
windows client and copy it to your linux client.  this is getting pretty =
OT...

-j

