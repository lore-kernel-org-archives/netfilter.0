From: KOVACS Krisztian <hidden@balabit.hu>
Subject: Re: Implicit SNAT gone
Date: Tue, 05 Jul 2005 09:22:13 +0200
Message-ID: <1120548134.5268.4.camel@nienna.balabit>
References: <Pine.LNX.4.61.0507042116530.10754@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0507042116530.10754@yvahk01.tjqt.qr>
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
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: Netfilter User Mailing List <netfilter@lists.netfilter.org>


  Hi,

2005-07-04, h keltez=E9ssel 21.17-kor Jan Engelhardt ezt =EDrta:
> In ip_nat_rule.c (and my syslog! apprently) I see:
>=20
> /* Before 2.6.11 we did implicit source NAT if required. Warn about cha=
nge. */
>                 printk("NAT: no longer support implicit source local NA=
T\n");
>                 printk("NAT: packet src %u.%u.%u.%u -> dst %u.%u.%u.%u\=
n",
>                        NIPQUAD(srcip), NIPQUAD(dstip));
>=20
> So, how do I get the feature back with 2.6.12 logic?
> (Or do I have to forwardport that feature?)

  Forward porting that "feature" is nearly impossible without backing
out all the NAT-related changes. However, you can usually solve the
problem itself instead of reintroducing such tricks. Why exactly do you
need this feature?

--=20
 Regards,
  Krisztian Kovacs


