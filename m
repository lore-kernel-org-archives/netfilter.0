From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: Reasons for SFQ not being fair
Date: Mon, 12 May 2008 11:48:59 +0300
Message-ID: <1210582139.814.2.camel@casper.meteor.dp.ua>
References: <20080429155337.wck83yqoessw4gcw@new.meteor.dp.ua>
Reply-To: casper@meteor.dp.ua
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20080429155337.wck83yqoessw4gcw@new.meteor.dp.ua>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: netfilter@vger.kernel.org

=F7 =F7=D4=CF, 29/04/2008 =D7 15:53 +0300, =F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=
=CF =EB=CF=D3=D4=C9=CB =D0=C9=DB=C5=D4:
> Hi there,
>=20
> I've been using SFQ as the ending for every class of HTB for very =20
> long. All working just as expected.
>=20
> After implementing the abillity to do "limited speed, unlimited =20
> traffic" clients I've experienced SFQ not being fair for those. =20
> Precisilly, one of several connections gets bandwidth other stailed o=
r =20
> they run in turn.
>=20
> Setup:
>=20
> 1. There are 2 HTB classes for "limited speed, unlimited traffic" =20
> clients each direction each ending with SFQ:
>   - base class (3:9900): for traffic < limit (2.5 Mbit/s for all)
>   - land class (3:9910): for landing traffic > limit (1 kbit/s for al=
l)
>=20
> 2. For each of those clients I insert 2 tc filters each direction:
>   - tc filter add dev $IN_DEV parent $IN_PARENT_CLASS protocol ip pri=
o =20
> 10 handle $HANDLE10 fw police rate $IN_RATE buffer 10k continue =20
> classid $IN_BASE_CLASS
>   - tc filter add dev $IN_DEV parent $IN_PARENT_CLASS protocol ip pri=
o =20
> 11 handle $HANDLE10 fw classid $IN_LAND_CLASS
>=20
> All this work perfect except SFQ fairness/flow speed division.
>=20
> My thinkings:
>=20
> # tc -s -d qdisc ls dev eth3 (filtered)
> qdisc sfq 9900: parent 3:9900 limit 128p quantum 1514b flows 128/1024=
 =20
> perturb 10sec
>   Sent 23753684098 bytes 71470965 pkt (dropped 0, overlimits 0 requeu=
es 0)
>   rate 0bit 0pps backlog 0b 0p requeues 0
> qdisc sfq 9910: parent 3:9910 limit 128p quantum 1514b flows 128/1024=
 =20
> perturb 10sec
>   Sent 38036550 bytes 26648 pkt (dropped 1320085, overlimits 0 requeu=
es 0)
>   rate 0bit 0pps backlog 162525b 126p requeues 0
>=20
> In the "land" class there are too many droped packets. That's logical=
 =20
> because the rate is low (1 kbit/s) and there are only 128 packets =20
> length queue. I think this is causing problems/unfairness because =20
> droped packets means tcp retransmitions in best case and reconnects i=
n =20
> worst.
>=20
> I didn't found a way to encrease the limit of 128 packet for the SFQ =
=20
> it probably complile time limit.
>=20
> Any hints/suggestions on how to tune SFQ?

Any hints? Maybe wrong list?

--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

