From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Iptables proxy to a different network
Date: Fri, 9 Feb 2007 23:22:07 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0702092307520.31955@yvahk01.tjqt.qr>
References: <D392D4803D14354CBC49D772E19DD0CD45660A@zeus.w2k.nrlmry.navy.mil>
	<45CC5A91.4090200@plouf.fr.eu.org>
	<Pine.LNX.4.61.0702091338030.31955@yvahk01.tjqt.qr>
	<45CC919C.7030104@plouf.fr.eu.org>
	<Pine.LNX.4.61.0702091848340.31955@yvahk01.tjqt.qr>
	<45CCE9D0.6080808@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45CCE9D0.6080808@plouf.fr.eu.org>
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
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@lists.netfilter.org


On Feb 9 2007 22:38, Pascal Hambourg wrote:
> Jan Engelhardt a =C3=A9crit :
>> >=20
>> > I may be wrong, but doing IP NAT on a bridge seems to me quite
>> > unnatural and
>> > troublesome.
>>=20
>> A bridge is like a 'direct connection' so you cannot use NAT.
>
> My idea of a bridge is a kind of software switch.
> Then why did you mention "setting up your proxy box as bridge" ?

Ok so I confused what the OP wanted [-t nat -A PREROUTING -p tcp --dport 80=
 -j
--DNAT to x.y.z:80] with "the box does an rinetd-style approach" [e.g. squi=
d],
so that the connection is not DNATed (A->C) but two connections actually ex=
ist
(A->B, B->C).


However, the more I think of it, there actually is a way with
proxy-on-a-bridge. Though, it's more like "degrading the bridge to a router=
":

ebtables -t broute -A BROUTING -i Intern -p tcp --dport 80 -j DROP;
ebtables -t broute -A BROUTING -o Extern -p tcp --sport 80 -j DROP;


Jan
--=20
ft: http://freshmeat.net/p/chaostables/

