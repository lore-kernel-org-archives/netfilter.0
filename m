From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: IDS better than hardcore iptables rules?
Date: 06 Feb 2005 22:28:52 +0100
Message-ID: <1107725331.2853.3.camel@nostromo.bgsecm.com>
References: <Pine.LNX.4.05.10502061533170.352-100000@darkstar.sysinfo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Pine.LNX.4.05.10502061533170.352-100000@darkstar.sysinfo.com>
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
To: "R. DuFresne" <dufresne@sysinfo.com>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El dom, 06 de 02 de 2005 a las 21:34, R. DuFresne escribi=C3=B3:
> On 6 Feb 2005, Jose Maria Lopez wrote:
>=20
> > El dom, 06 de 02 de 2005 a las 07:29, seberino@spawar.navy.mil escrib=
i=C3=83=C2=B3:
> > > Hudson & Ron
> > >=20
> > > I'm not sure there even exists documentation to explain
> > > some of the DROP rules I see in firewall scripts.
> > >=20
> > > Have you seen guys like these?...
> > >=20
> > >  -p tcp --tcp-flags ACK,FIN FIN -j DROP
> > >  -p tcp --tcp-flags ACK,PSH PSH -j DROP
> > >  -p tcp --tcp-flags ACK,URG URG -j DROP
> > >=20
> > > What TCP/IP book tells you that FIN, PSH and URG packets
> > > usually have ACK set?  **These** are the rules I don't
> > > know how to understand.
> > >=20
> > > Chris
> >=20
> > They *don't* have the ACK set, that's because they are
> > dropped, because it's anormal traffic, probably portscans.
> >=20
>=20
> Can't these kind of packets get handled by an INVALID match, with one
> rule per appropriate chain?
>=20

Yes, but remember they use to be portscannings, so take a
watch at the conntrack tables, so it doesn't full it of
shit.

>=20
> Thanks,
>=20
> Ron DuFresne

Regards

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


