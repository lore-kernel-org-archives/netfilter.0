From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: RE: services for predetermined IP addresses
Date: 16 Oct 2004 19:52:40 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1097940822.19564.8.camel@nostromo.bgsecm.com>
References: <7C9884991ADAE0479C14F10C858BCDF567956A@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF567956A@alderaan.smgtec.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="utf-8"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El vie, 15 de 10 de 2004 a las 22:25, Daniel Chemko escribi=C3=B3:
> > so the drop-all would be..?
> >=20
> > iptables -A INPUT -p TCP -i eth0 -s 0/0 -j DROP
> >=20
> > or did I just invent my own thing here?
> > tia
> > Kate
>=20
> I was just about to comment:
>=20
> To drop by-by-policy, any rule that doesn't get matched earier gets
> picked up by the policy rule.
>=20
> You would use:
>=20
> iptables -P INPUT DROP

But remember to put this line before the lines that accept
packets or you will be accepting packets before they reach
the default policy.

--=20
Jose Maria Lopez Hernandez
Director Tecnico de bgSEC
jkerouac@bgsec.com
bgSEC Seguridad y Consultoria de Sistemas Informaticos
http://www.bgsec.com
ESPA=C3=91A

The only people for me are the mad ones -- the ones who are mad to live,
mad to talk, mad to be saved, desirous of everything at the same time,
the ones who never yawn or say a commonplace thing, but burn, burn, burn
like fabulous yellow Roman candles.
                -- Jack Kerouac, "On the Road"


