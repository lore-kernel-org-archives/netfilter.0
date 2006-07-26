From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: multiport tolerance changes
Date: Wed, 26 Jul 2006 13:35:24 +0200
Message-ID: <44C7537C.7070509@plouf.fr.eu.org>
References: <44C73691.1080302@regnard.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44C73691.1080302@regnard.org>
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

Vincent Regnard a =E9crit :
>=20
> With iptables 1.2.7 I had some rules where I could write some multiport=
=20
> (port lists or ranges) both for source and destination ports, like this=
:
>=20
> /sbin/iptables -A fw2net_eth3 -p tcp -m multiport -s 82.67.103.87=20
> --sport 1024:65535 -d 0.0.0.0/0 --dports 80,8080,81,8000,1755 -j ACCEPT
>=20
> iptables was coping well with this and expanded the port matrix into=20
> appropriate single rules

What do you mean ? Could you give an example of such expansion ?

> But iptables 1.3.5 refuses to have multiport for both=20
> source and destination ports and objects:
>=20
> iptables v1.3.5: multiport can only have one option

Well, it seems that my old iptables 1.2.6a already had the same=20
limitation. I submitted your rule to it and got an error too.

> So I have to re-write my firewall rules.

How did you rewrite the above rule ?
If I reorder the options, so that the --sport parameter appears to=20
belong to the implicit "-m tcp" match created by "-p tcp", the rule is=20
accepted by my iptables 1.2.6a :

/sbin/iptables -A fw2net_eth3 -s 82.67.103.87 -d 0.0.0.0/0 \
   -p tcp --sport 1024:65535 -m multiport --dports 80,8080,81,8000,1755 \
   -j ACCEPT

As a general rule it seems to me that it is more logical and readable to=20
put the parameters of a match right behind the match.

PS: what's the use of "-d 0.0.0.0/0" ?

