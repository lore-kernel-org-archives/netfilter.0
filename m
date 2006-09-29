From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: [ANNOUNCE] Release of iptables-1.3.6
Date: Fri, 29 Sep 2006 11:44:45 +0200
Message-ID: <451CEB0D.3020306@plouf.fr.eu.org>
References: <20060928172109.GN13764@sunbeam.de.gnumonks.org>	<451C0BBA.9070509@plouf.fr.eu.org>
	<Pine.LNX.4.58.0609290849580.10141@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0609290849580.10141@blackhole.kfki.hu>
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
To: Netfilter Mailinglist <netfilter@lists.netfilter.org>

Jozsef Kadlecsik a =E9crit :
>=20
>>>New features since 1.3.5:
>>>
>>>- Support multiple matches of the same type within a single rule
>>
>>Wow. What does this mean exactly ? Does it mean that one can set
>>multiple -p, -s, -d, --dport and so on in a single rule ?
>=20
> No - and as the conditons in a rule are ANDed, it wouldn't make much
> sense. But from now on you can set multiple match extensions of the sam=
e
> type in a single rule, e.g:
>=20
> .. -m condition --condition foo -m condition --condition bar ...
> .. -m set --set servers dst -m set --set services dst ...

If I understand correctly, it is now possible for instance to set two=20
multiport matches in a single rule, one with --dports and one with=20
--sports ?

