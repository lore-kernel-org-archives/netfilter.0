From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Where to get SIP conntrack and nat for pre-2.6.18 kernel?
Date: Sat, 25 Nov 2006 16:37:30 +0100
Message-ID: <4568633A.6060704@plouf.fr.eu.org>
References: <BAY119-F8D5AF68C7D422EA54C475D6E30@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY119-F8D5AF68C7D422EA54C475D6E30@phx.gbl>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

Andrew Kraslavsky a =E9crit :
>=20
> I see that the netfilter SVN includes a version of SIP conntrack and NA=
T=20
> for 2.6.11, 2.6.12 and 2.6.13 but nothing after that.  If my kernel=20
> version is higher (e.g. 2.6.15) should I use the 2.6.13 source from the=
=20
> netfilter SVN or is there some other repository I should use?

The sip-conntrack-nat patch in the lastest patch-o-matic-ng snapshot=20
(http://ftp.netfilter.org/pub/patch-o-matic-ng/snapshot/) applies and=20
builds on a vanilla 2.6.16 kernel tree at least. However I don't know=20
how functional it is.

> I found some mailing list discussion suggesting that SIP source will be=
=20
> included in the kernel repository as of 2.6.18 but, even assuming that=20
> is not just a rumor, it seems a bit risky to try to use 2.6.18 versions=
=20
> of the SIP conntrack and NAT modules on an older kernel.

It is not a rumor, SIP conntrack and NAT support was actually added in=20
kernel 2.6.18. Changelog-2.6.18 says :

  [NETFILTER]: Add SIP connection tracking helper

  Add SIP connection tracking helper. Originally written by
  Christian Hentschel <chentschel@arnet.com.ar>, some cleanup, minor
  fixes and bidirectional SIP support added by myself.

  [NETFILTER]: SIP helper: expect RTP streams in both directions

  Since we don't know in which direction the first packet will arrive, we
  need to create one expectation for each direction, which is currently
  prevented by max_expected beeing set to 1.

