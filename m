From: "Roksana Boreli" <Roksana.Boreli@nicta.com.au>
Subject: RE: Multiple IPSEC VPNs through a firewall based on 2.4.2X kernel
Date: Wed, 25 Aug 2004 17:24:27 +1000
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <09D3F703EF3B0A4CBE28449EA9F3D3206F1D7A@nicta-atp-mail.in.nicta.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
content-class: urn:content-classes:message
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

Thanks Jason.

> enable IKE over TCP on the clients and UDP encapsulation. =20
> this is not a problem with netfilter, but with multiple
>  IPSec clients behind *any* NAT =3D device.

Perhaps some additional info needs to be added about my configuration.
I need to use standard Cisco Linux clients, as this is for people
visiting (with their laptops and standard VPN setup for remote access)
and wanting to get to their (Cisco) server.  In fact, it could be more
than one ipsec server at some time in the future.  I definitely need to
use a Cisco VPN gateway (can't use FreeSwan), I cannot have a single vpn
client from the Linux router device as the requirement is for multiple
clients behind this device.  The Cisco gateway and Win 2k client can set
up a connection through a NAT router, we have tried this with a Netgear
device.  So I thought the issue was similar to pptp vpn pass-through for
multiple clients (i.e. a patch for the kernel/iptables was the way to
go), hence the question. =20

Kind regards, Roksana=20


Subject: RE: Multiple IPSEC VPNs through a firewall based on 2.4.2X
kernel
Date: Tue, 24 Aug 2004 07:56:33 -0400
From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
To: <netfilter@lists.netfilter.org>

Hi,

I am trying to set up multiple ipsec VPN clients working behind a Linux
router with NAT/PAT, based on a 2.4.20 (can be 2.4.22) kernel. I would=20
like to be able to connect a number of Windows (2k or XP) machines to=20
an existing Cisco VPN server.

Kind regards, Roksana

