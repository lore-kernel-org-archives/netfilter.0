From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: iptables traffic accounting...
Date: 09 Dec 2004 22:17:47 +0100
Message-ID: <1102623280.16437.15.camel@nostromo.bgsecm.com>
References: <200412041353.20954.linuxguru@mail.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200412041353.20954.linuxguru@mail.ru>
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

El s=C3=A1b, 04 de 12 de 2004 a las 14:53, Vladimir S. Petukhov escribi=C3=
=B3:
> sorry for my english...
> How can I calculate total traffic from/to single process?
> It's easy to calculate outgoing traffic using --owner rule, but what's =
about=20
> ingoing?
> process may be identify by PID & uid/euid/gid...

I use a -m owner rule to jump to a chain that only has a RETURN rule
and then read the counters for this chain to obtain the traffic
for that user/process.

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


