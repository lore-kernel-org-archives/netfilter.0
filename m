From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: IDS better than hardcore iptables rules?
Date: 04 Feb 2005 21:18:52 +0100
Message-ID: <1107548324.24310.11.camel@nostromo.bgsecm.com>
References: <20050203230355.GA31433@spawar.navy.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20050203230355.GA31433@spawar.navy.mil>
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

El vie, 04 de 02 de 2005 a las 00:03, seberino@spawar.navy.mil escribi=C3=
=B3:
> Many people on this list including Jason O. are masters
> at creating very detailed careful iptables rules that
> DROP packets that have anything peculiar about them.
>=20
> (e.g. FIN without ACK, etc.)
>=20
> My iptables script just filters based on port
> number and protocol.  I was wondering if instead
> of diving into TCP education to duplicate the
> fine work Jason and others have done,
> if an IDS (Intrusion Detection System)
> like Snort would serve the same purpose???
>=20
> I assume Snort **ALSO** knows what TCP flag combos
> typically signify a port scan and other nasties?
>=20
> Chris
>=20
> --
> _______________________________________
>=20
> Christian Seberino, Ph.D.
> SPAWAR Systems Center San Diego
> Code 2872
> 49258 Mills Street, Room 158
> San Diego, CA 92152-5385
> U.S.A.
>=20
> Phone: (619) 553-9973
> Fax  : (619) 553-6521
> Email: seberino@spawar.navy.mil
> _______________________________________


Your problem it's dead easy to solve. You *need*
a firewall and *also* an IDS/IPS. Don't try to
substitute one thing with the other, they are
different thing and both are useful.

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


