From: "Seferovic Edvin" <edvin.seferovic@kolp.at>
Subject: RE: IBM Dispatcher X iptables AND linux advanced routing
Date: Wed, 22 Jun 2005 21:33:32 +0200
Message-ID: <22429.5096392327$1119468541@news.gmane.org>
References: <20050622191536.GA3563@modular>
Reply-To: edvin.seferovic@kolp.at
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050622191536.GA3563@modular>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hi,

how can this be achieved? When I have three boxes with the CLUSTERIP
enabled, and each box is connected to a switch and they all have the =
same IP
address, how will balancing work in such case.

I am sorry for my bad understanding of clustering concepts. Can somebody
give me a hint where to look for ( I would prefer a HowTo explaining how =
to
set up two boxes and load balancing between those ).

TIA

Regards,

Edvin Seferovic

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Andre Raabe
Sent: Mittwoch, 22. Juni 2005 21:16
To: netfilter@lists.netfilter.org
Subject: Re: IBM Dispatcher X iptables AND linux advanced routing

On Wed, Jun 22, 2005 at 02:17:37PM -0300, Bruno Negr=E3o wrote:
>=20
> I know it's possible to implement bandwidth control with linux, but =
what=20
> about the second feature? Does someone know if it's possible to =
implement=20
> the second feature using linux?
>=20
Maybe take a look at the ClusterIP feature available in newer kernel
versions. Form the iptable man page:
 CLUSTERIP
 This module allows you to configure a simple cluster of nodes that
 share a certain IP and MAC address without an explicit load
 balancer in front of them. Connections are statically distributed
 between the nodes in this cluster.
=20
Another possible solution would be IPVS [1], which implements=20
transport-layer load balancing.

[1] http://www.linuxvirtualserver.org/software/ipvs.html

Best regards,

--=20
Andre Raabe <raabe@tuxknowledge.org>

GnuPG: 0x5FF2A39C | ECBD D562 72C9 DD1B B741 52C0 AFE1 8DA7 5FF2 A39C
http://www.tuxknowledge.org | bash@jabber.ccc.de | encryption welcome


