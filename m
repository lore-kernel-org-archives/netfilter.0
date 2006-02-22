From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: --reject-with icmp-host-unreachable VS DROP
Date: Wed, 22 Feb 2006 09:06:41 -0800
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE5829016737B@pxtbenexd01.pxt.primeexalia.com>
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
To: Brent Clark <bclark@eccotours.biz>, netfilter@lists.netfilter.org

I thought we answered this already.

If you use -j REJECT then -j DROP will never be hit.  So that second
line becomes useless.  If you want to slow things down, check out -j
TARPIT module (which requires kernel changes).

Gary Wayne Smith

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> bounces@lists.netfilter.org] On Behalf Of Brent Clark
> Sent: Tuesday, February 21, 2006 8:05 AM
> To: netfilter@lists.netfilter.org
> Subject: --reject-with icmp-host-unreachable VS DROP
>=20
> Hi all
>=20
> I have a default policy of DROP for the INPUT, OUTPUT AND FORWARD.
>=20
> I was thinking what just before the end of a FORWARD chain, I would
use
> something like this.
>=20
> $IPT -t filter -A FORWARD -j -j REJECT --reject-with
icmp-host-unreachable
> $IPT -t filter -A FORWARD -j DROP
>=20
> Would anyone be kind to advise me on whether this is ok.
>=20
> I defianltly think it will slow some applications from continuously
> retrying.
>=20
> Kind Regards
> Brent Clark


