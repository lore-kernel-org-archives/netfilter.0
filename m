From: Justinas =?iso-8859-2?Q?Bed=BEinskas?= <justasb@patikimi.lt>
Subject: Re: netfilter Digest, Vol 14, Issue 52
Date: Fri, 30 Sep 2005 15:24:13 +0300
Message-ID: <1128083053.20747.4.camel@biesas>
References: <200509281413.j8SEDfEV021700@ns.patikimi.lt>
Reply-To: justasb@patikimi.lt
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200509281413.j8SEDfEV021700@ns.patikimi.lt>
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
Content-Type: text/plain; charset="macroman"
To: netfilter@lists.netfilter.org

> Message: 3
> Date: Wed, 28 Sep 2005 12:48:01 +0300
> From: Justinas Bed?inskas <justasb@patikimi.lt>
> Subject: problem with expire patch
> To: netfilter@lists.netfilter.org
> Message-ID: <1127900881.15747.4.camel@biesas>
> Content-Type: text/plain
>=20
> I have compiled 2.6.12 kernel with iptables expire support, I also have
> recompiled iptables with expire support.=20
> And I encounter a strange problem with time
>=20
> xxx:/home/digis#modprobe ipt_expire
> xxx:/home/digis#/usr/local/sbin/iptables -t nat -A POSTROUTING -m expir=
e
> --expiration +30 -o eth1 -j MASQUERADE
>=20
> Then I wait more than 30 seconds....
>=20
> xxx:/home/digis#/usr/local/sbin/iptables -t nat -L
> Chain PREROUTING (policy ACCEPT)
>=20
>=20
> Chain POSTROUTING (policy ACCEPT)
> target     prot opt source               destination
> MASQUERADE  all  --  anywhere             anywhere            expires i=
n
> -2s
>=20
>=20
> and it keeps counting...
> What I am doing wrong?
>=20

http://patchwork.netfilter.org/netfilter-devel/patch.pl?id=3D2761
these patches fixed my problem (thanks to Bryan Cardillo), and they are
2 months old. Why aren't they included in patch-o-matic patchset?



--=20
Justinas Bed=C5=BEinskas <justasb@patikimi.lt>
"Patikimi Sprendimai"


