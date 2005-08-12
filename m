From: "Gielen, Casper" <c.gielen@heerlen.nl>
Subject: RE: Transparent proxy where source IP address remains unchanged --
	possible?
Date: Fri, 12 Aug 2005 17:21:17 +0200
Message-ID: <0169924AA86A45478A8CB446C760C2BB014B5330@ict4003.ict4.lan>
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
To: netfilter@lists.netfilter.org

> >Subject: Transparent proxy where source IP address remains unchanged =
--
> >    possible?
>=20
> Check Balabit TPROXY. To retain the source address however, you need =
to patch=20
> the application that initiates the second part. In your case, the sshd =
on=20
> faketarget.

I used this today with squid, and I have to say it works great.
--=20
Casper

