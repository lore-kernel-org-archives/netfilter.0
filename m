From: "CARRY Gilles" <gilles.carry@volubill.com>
Subject: RE: Accessing physical subnets with same address range via asingle
	gateway
Date: Fri, 12 Nov 2004 15:04:23 +0100
Message-ID: <1C888AFC989D0E45BA0417091408E23199F08C@saturne.volubill.com>
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Netfilter users list <netfilter@lists.netfilter.org>


> From: John A. Sullivan III [mailto:john.sullivan@nexusmgmt.com]
> Sent: vendredi 12 novembre 2004 13:34
>
> I have never created a Linux bridge before so this is not my area of
> expertise on this platform however, I would think you want to set
those
> three interfaces to bridge rather than route.  This way, they are one
> network and the broadcasts including the ARP requests will pass
between
> them.  Failing that, see if the Linux implementation of proxy-ARP will
> help you here.  Those are my ideas as a network engineer but, as I
said,
> I've never done it on Linux.  Hopefully someone else can fill in the
> details.  Good luck - John
> --

Actually I did not give enough details.
I don't need the A,B and C equipments to communicate to each others.
Moreover they will have the same addresses (ie. 172.16.32.1 will be
found on each subnet). So these subnets should not be as one physical
network.
I just want to be able to access these nodes from the outside via the
gateway using several address ranges.

                     gateway
(general network:GN) - eth0
                       eth1  ---- (equipments A: subnet=3D =
172.16.32.0/24)
						node A1=3D172.16.32.1
						node A2=3D172.16.32.2
                       eth2  ---- (equipments B: subnet=3D =
172.16.32.0/24)
						node B1=3D172.16.32.1
						(accessible from GN as
172.20.32.1)
						node B2=3D172.16.32.2
						(accessible from GN as
172.20.32.2)
                       eth3  ---- (equipments C: subnet=3D =
172.16.32.0/24)
						node C1=3D172.16.32.1
						(accessible from GN as
172.24.32.1)
						node C2=3D172.16.32.2
						(accessible from GN as
172.24.32.1)

Thank-you anyway.
Gilles.

