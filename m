From: ASHISH <ashishis@gmail.com>
Subject: Re: Limit Virus Effects on Web Server
Date: Fri, 7 Jan 2005 15:17:21 +0530
Message-ID: <558224e3050107014741bb9a26@mail.gmail.com>
References: <20050105144413.15525.qmail@webmail02.mesa1.secureserver.net>
	<1105023418.20638.15.camel@nostromo.bgsecm.com>
Reply-To: ASHISH <ashishis@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1105023418.20638.15.camel@nostromo.bgsecm.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

If you are aware of the Ip's from which viral traffic is bombarding
requests, then you can tighten the limit match for those IP's. But if
it is a DDos attack, then netfilter cannot do much.

We are experimenting netfilter along with scripting over inhouse built
algorithms. Like we analyse internet traffic periodically, and the
scripts inserts and remove rules into netfilter generally once a day.

On 07 Jan 2005 00:48:49 +0100, Jose Maria Lopez <jkerouac@bgsec.com> wrote:
> El mi=E9, 05 de 01 de 2005 a las 15:44, Benjamin Bostow escribi=F3:
> > I have a gateway that directs all internal web traffic to my website.
> > The site makes use of extensive DB calls. When someone with a virus
> > that connects to port 80 plugs in behind the gateway the DB goes to
> > 100% CPU usage. I am trying to limit this and try to filter out virus
> > traffic from browser/user traffic. I was thinking I could use kinda the
> > same rule as I have for preventing ping attacks but it doesn't seem to
> > work. I have tried using "iptables -t nat -I PREROUTING 1 -p tcp -m tcp
> > --dport 80 -m limit --limit 5/s --limit-burst 10 -j redirection_chain".
> > It seems that all traffic no matter how great still goes to my
> > webserver. Also, is there a way to drop packets over a certain amount
> > per time from one user?
> >
> > Benjamin
>=20
> Maybe an IPS like snort with the bleeding-rules can be useful to
> drop some of this traffic.
>=20
> --
> Jose Maria Lopez Hernandez
> Director Tecnico de bgSEC
> jkerouac@bgsec.com
> bgSEC Seguridad y Consultoria de Sistemas Informaticos
> http://www.bgsec.com
> ESPA=D1A
>=20
> The only people for me are the mad ones -- the ones who are mad to live,
> mad to talk, mad to be saved, desirous of everything at the same time,
> the ones who never yawn or say a commonplace thing, but burn, burn, burn
> like fabulous yellow Roman candles.
>                 -- Jack Kerouac, "On the Road"
>=20
>=20


--=20
cheers
Ashish

