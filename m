From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Connlimit problem k2.6.18.2 , ipt1.3.7
Date: Sun, 11 Mar 2007 18:14:55 +0100
Message-ID: <45F4390F.5050106@plouf.fr.eu.org>
References: <00fd01c76274$a089c3e0$3464000a@oksystem.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <00fd01c76274$a089c3e0$3464000a@oksystem.local>
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

Bc. Miroslav Kopecek a =E9crit :
>=20
> I can't add connlimit rule? What's wrong? Any suggestion?
>=20
> -----------------------------------------
> iptables -m connlimit -h
> connlimit v1.3.7 options:
> [!] --connlimit-above n         match if the number of existing tcp
> connections is (not) above n
>  --connlimit-mask n             group hosts using mask
>=20
> -----------------------------------------
> RouterBM:/home/kopecek# iptables -A FORWARD -p tcp -s 10.88.99.71 -m
> connlimit --connlimit-above 300 --connlimit-mask 32  -j REJECT --reject=
-with
> tcp-reset
> iptables: No chain/target/match by that name

Your kernel probably does not support the connlimit match. The connlimit=20
match is not part of the standard kernel. It used to be included as a=20
kernel patch in the patch-o-matic-ng, but has been removed from the=20
daily snapshots since 2006/07/26.

