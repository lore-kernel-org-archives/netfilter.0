From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: Ethernet port redirection
Date: 07 Jan 2005 00:48:46 +0100
Message-ID: <1105023356.21389.13.camel@nostromo.bgsecm.com>
References: <000d01c4f33a$5ac1f590$eaab9385@gagan>
	<20050105155239.GB24445@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050105155239.GB24445@bender.817west.com>
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

El mi=C3=A9, 05 de 01 de 2005 a las 16:52, Jason Opperisano escribi=C3=B3=
:
> On Wed, Jan 05, 2005 at 08:52:06PM +0530, Navneet wrote:
> > Hi,
> >=20
> > Now, pease check this out :-
> > I was trying to run squid in transparent mode(Transparent Proxying) ?
> >=20
> > System details:
> > RedHat Linux 9
> > eth0 133.147.171.169/8 [Internal NIC]
> > eth1 172.21.133/14        [External NIC]
>=20
> maybe i'm being silly--but it sure looks to me like eth0 is external an=
d
> eth1 is internal.
>=20
> > All http request get REDIRECTED to squid  at eth0(Internal).It should=
 work
> > as Gateway by means of eth1(External).
> >=20
> > i've done this:
> > 1.Enabled IP forwarding
> > #echo "1" >/proc/sys/net/ipv4/ip_forward
> > 2.iptables (Netfilter) PORT REDIRECTION:
> > #iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j
> > REDIRECT --to-port 3128
>=20
> are you *positive* that you don't mean eth1 there?
>=20
> -j
>=20
> --
> "Ah, good ol' trustworthy beer. My love for you will never die."
>         --The Simpsons

I would like to add that maybe he have not configured the
squid proxy properly, it need to be configured to do the
transparent proxy thing. If you don't do it the iptables
rules are useless.

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


