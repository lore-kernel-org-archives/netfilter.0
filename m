From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: POP3 Forwarding ok or not.
Date: 19 Jan 2005 15:25:33 +0100
Message-ID: <1106131612.6185.3.camel@nostromo.bgsecm.com>
References: <20050118195858.GD27505@omega.lacnic.net.uy>
	<20050118192344.GA8624@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050118192344.GA8624@bender.817west.com>
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

El mar, 18 de 01 de 2005 a las 20:23, Jason Opperisano escribi=C3=B3:
> On Tue, Jan 18, 2005 at 04:58:58PM -0300, Pablo Allietti wrote:
> > hi people.=20
> >=20
> >=20
> > i have a question..
> >=20
> > my net is=20
> >=20
> >=20
> > 		|200.40.228.64/28
> > 		|
> > 		Firewall FC2 (200.40.229.67)
> > 		|	dns midomain.com
> > 		|
> > 		|192.168.1.0/24
> > -------------------------------
> >     |
> >     |
> >     |
> > FC2 (pop3) 192.168.1.6
> >=20
> >=20
> > i need to check mail in midomain.com but the pop3 server and mail ser=
ver
> > is in 192.168.1.8
> >=20
> > is that correct to check and send mail?
> >=20
> > iptables -A FORWARD -i eth1 -o eth0 -p tcp -s 0/0 -d 192.168.1.6 --dp=
ort
> > 110 -j ACCEPT
> > iptables -A FORWARD -i eth1 -o eth0 -p tcp -s 0/0 -d 192.168.1.6 --dp=
ort =20
> > 25 -j ACCEPT
>=20
> those are correct for your filter rules.  do you already have the NAT
> setup for this as well?
>=20
>   iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 110 \
>     -j DNAT --to-destination 192.168.1.6
>=20
>   iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 25 \
>     -j DNAT --to-destination 192.168.1.6
>=20
> -j
>=20
> --
> "This has purple stuff inside - purple is a fruit."
>         --The Simpsons

And of course also the RELATED and ESTABLISHED rules, or the rules
for the traffic going out of the machines.

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


