From: Jose Maria Lopez Hernandez <jkerouac@bgsec.com>
Subject: Re: limit connections to ssh
Date: Tue, 15 Mar 2005 10:00:29 +0100
Message-ID: <1110877229.6883.1.camel@nostromo.bgsecm.com>
References: <20050315000111.GA34990@micron.lacnic.net.uy>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20050315000111.GA34990@micron.lacnic.net.uy>
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
Content-Type: text/plain; charset="utf-8"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El lun, 14-03-2005 a las 21:01 -0300, Pablo Allietti escribi=C3=B3:
> iptables can limit connections to a a port? for exmaple=20
>=20
> i need to permit only 3 connections to a ssh in a period of 5 minutes
>=20
> iptables can do this?

Of course, do a:
iptables -m limit --help

The rule would be something like:

iptables -A INPUT -m state --state NEW -i <extif> -m limit --limit 5/sec
-j ACCEPT

with the ESTABLISHED and RELATED rules, before, obviusly.

Regards.

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



