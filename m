From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: RE: diffrence between reject & drop ?
Date: 01 Feb 2005 12:39:26 +0100
Message-ID: <1107256392.1604.4.camel@nostromo.bgsecm.com>
References: <20050201084800.4D4CE8EDCEB@smtp.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20050201084800.4D4CE8EDCEB@smtp.sterenborg.info>
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
To: 'netfilter' <netfilter@lists.netfilter.org>

El mar, 01 de 02 de 2005 a las 09:47, Rob Sterenborg escribi=C3=B3:
> netfilter-bounces@lists.netfilter.org wrote:
> > What is the basic diffrence between rejecting a packet & droping a
> > packet ?=20
> >=20
> > both denies the packet right ?
>=20
> Yes, but REJECT notifies the sender that the packet was not accepted,
> DROP silently discards the packet.

What use to be advised is to use:

For TCP: REJECT --reject-with tcp-reset
For UDP: REJECT --reject-with icmp-port-unreachable
For ICMP: DROP

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


