From: "Omar Garcia" <omar.garcia@fractalia.biz>
Subject: Re: Connlimit problem
Date: Wed, 26 Jan 2005 16:04:50 +0100
Message-ID: <004a01c503b8$61f418a0$910010ac@coco>
References: <001801c503b3$115416c0$910010ac@coco>
	<41F7AFBE.8080509@arcoscom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: =?iso-8859-1?Q?Samuel_D=EDaz_Garc=EDa?= <samueldg@arcoscom.com>
Cc: netfilter@lists.netfilter.org


No effect, the same responsed.

# iptables -t filter -A FORWARD -m connlimit --connlimit-above 100 -j DROP
iptables: No chain/target/match by that name

# iptables -t filter -A OUTPUT -m connlimit --connlimit-above 100 -j DROP
iptables: No chain/target/match by that name


----- Original Message -----=20
From: "Samuel D=EDaz Garc=EDa" <samueldg@arcoscom.com>
To: "Omar Garcia" <omar.garcia@fractalia.biz>
Sent: Wednesday, January 26, 2005 3:57 PM
Subject: Re: Connlimit problem


> It is working in "filter" table, not in mangle.
>
> Try it, I think connlimit is only for filters.
>
> Say us.
>
> Omar Garcia escribi=F3:
> > Hi list,
> >
> > I try to configurate a transparent bridge with QoS
> > I have a pentium computer with two network cards, kernel 2.6.8 with
IMQ,WRR,IPP2P and other more patched.
> >
> > The problem is when i try to include the following rule:
> >
> >  iptables -A PREROUTING -t mangle -m connlimit --connlimit-above 100 -j
DROP
> >
> > If i tried in two steps, i confirm that the module connlimit is
installed:
> >
> > BridgeWall:/home/omar# iptables -A PREROUTING -t mangle -m connlimit
> >     iptables v1.2.11: You must specify `--connlimit-above'
> >     Try `iptables -h' or 'iptables --help' for more information.
> >
> >
> >  BridgeWall:/home/omar# iptables -A PREROUTING -t mangle -m
connlimit --connlimit-above 12 -j DROP
> >      iptables: No chain/target/match by that name
> > Any idea????
> >
> > Thanks in advange.
> >
> > Regards
> >
> >
>
> --=20
>     Samuel D=EDaz Garc=EDa
>      Director Gerente
> ArcosCom Wireless, S.L.L.
>
> mailto:samueldg@arcoscom.com
> http://www.arcoscom.com
> m=F3vil: 651 93 72 48
> tlfn/fax: 956 70 13 15
>



