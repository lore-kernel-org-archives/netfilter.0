From: Jose Maria Lopez Hernandez <jkerouac@bgsec.com>
Subject: Re: Dynamic DNS
Date: Wed, 09 Mar 2005 12:03:03 +0100
Message-ID: <1110366184.7542.24.camel@nostromo.bgsecm.com>
References: <20050309062542.GA27660@gw.home.tux-labor.de>
	<1110359242.7542.7.camel@nostromo.bgsecm.com>
	<20050309103543.GU4657@metastasis.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20050309103543.GU4657@metastasis.org.uk>
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

El mi=C3=A9, 09-03-2005 a las 10:35 +0000, Nick Drage escribi=C3=B3:
> On Wed, Mar 09, 2005 at 10:07:22AM +0100, Jose Maria Lopez Hernandez wr=
ote:
> > El mi=C3=A9, 09-03-2005 a las 07:25 +0100, Sebastian Docktor escribi=C3=
=B3:
>=20
> > > I want to allow a Dynamic DNS Client to Access the SSH-Server on my
> > > Firewall. But I don't want to open SSH for all IPs, Is it possible
> > > that iptables always looks up the ip address from the hostname, so
> > > that only the ip has access which is registrated under the dyndns?
> >=20
> > I don't understand your problem. If you know your IP you can block
> > based on that IP.
>=20
> The OP's problem is that the DNS will stay the same, say
> hostname.dyndns.net, but that the IP address associated with that name
> will change.  So as soon as the IP address changes, his rulebase is out
> of date.

You are right. I didn't read the post well, I was thinking *he* was
the one with the dynamic IP, now I see it's the client to his
server who has it. That's a real problem, now I realize.

Sorry and regards.

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



