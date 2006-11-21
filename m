From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: iptables/bridge/nfs
Date: Tue, 21 Nov 2006 10:53:59 -0800
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE5829024ED61@pxtbenexd01.pxt.primeexalia.com>
References: <57F9959B46E0FA4D8BA88AEDFBE5829024ED21@pxtbenexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
In-Reply-To: <57F9959B46E0FA4D8BA88AEDFBE5829024ED21@pxtbenexd01.pxt.primeexalia.com>
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
To: "Gary W. Smith" <gary@primeexalia.com>, netfilter@lists.netfilter.org

This had nothing to do with Netfilter.  It appears that the NFS server
failed to accept connections from anyone (even though there were already
established connections).  Restarting NFS solved my problem.

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> bounces@lists.netfilter.org] On Behalf Of Gary W. Smith
> Sent: Monday, November 20, 2006 2:18 PM
> To: netfilter@lists.netfilter.org
> Subject: iptables/bridge/nfs
>=20
> I'm trying to get NFS (udp) to work through an iptables firewall that
> also has a bridge.
>=20
> The bridge is eth0 and eth2.  The NFS server resides on eth3, the
client
> exist on eth2 the internet is on eth0.  My iptables contains this as
the
> FORWARD rule:
>=20
> -A FORWARD -m physdev  --physdev-in eth2 -j ACCEPT
>=20
> -A FORWARD -i eth3 -j ACCEPT
>=20
> We did have it locked down pretty much but we want to try to find out
> why this doesn't work.  Some posts say that if the MTU is different
then
> it might fragment but in this case they are both 1500.
>=20
> Does anyone have any basic ideas why this might not be working?
>=20
> Gary Wayne Smith
>=20


