From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: IDS better than hardcore iptables rules?
Date: 06 Feb 2005 14:03:30 +0100
Message-ID: <1107695009.20774.1.camel@nostromo.bgsecm.com>
References: <186AC876521E0F46BDE77079A6567FD0F0DD9E@la-ncc-ms1nsabb.losangeles.afspc.ds.af.mil>
	<20050206062935.GA9580@spawar.navy.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20050206062935.GA9580@spawar.navy.mil>
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

El dom, 06 de 02 de 2005 a las 07:29, seberino@spawar.navy.mil escribi=C3=
=B3:
> Hudson & Ron
>=20
> I'm not sure there even exists documentation to explain
> some of the DROP rules I see in firewall scripts.
>=20
> Have you seen guys like these?...
>=20
>  -p tcp --tcp-flags ACK,FIN FIN -j DROP
>  -p tcp --tcp-flags ACK,PSH PSH -j DROP
>  -p tcp --tcp-flags ACK,URG URG -j DROP
>=20
> What TCP/IP book tells you that FIN, PSH and URG packets
> usually have ACK set?  **These** are the rules I don't
> know how to understand.
>=20
> Chris

They *don't* have the ACK set, that's because they are
dropped, because it's anormal traffic, probably portscans.

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


