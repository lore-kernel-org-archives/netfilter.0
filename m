From: Jose Maria Lopez Hernandez <jkerouac@bgsec.com>
Subject: Re: ip_conntrack limit && stateless firewalls
Date: Sun, 13 Feb 2005 13:22:38 +0100
Message-ID: <1108297358.10876.23.camel@nostromo.bgsecm.com>
References: <Pine.CYG.4.62.0502110943440.2348@MI340a.chem.mathsci.usna.edu>
	<876ef97a05021106551fb5dacb@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <876ef97a05021106551fb5dacb@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

El vie, 11-02-2005 a las 09:55 -0500, Tobias DiPasquale escribi=C3=B3:
> On Fri, 11 Feb 2005 09:49:40 -0500, Kevin Van Workum <vanw@usna.edu> wr=
ote:
> > I'm having a problem with my firewall where packets are being dropped=
 due
> > to the ip_conntrack limit. I could up the limit, but my users need 30=
k+
> > connections simultaneously and with the minimum overhead. And I only =
have
> > 1 firewall box. So I'd like to disable or by-pass ip_conntrack some h=
ow to
> > avoid dropped packets and reduce over head. How can I do this, and mo=
re
> > importantly, would it be helpful.
>=20
> You can use the NOTRACK target on the traffic that is causing the
> problem (which will disable using ip_conntrack on that traffic), or
> you can decompile conntrack altogether. The latter would basically
> make the firewall stateless. man iptables for more info on using
> NOTRACK.
>=20

I just wanted to note that changing from CONNTRACK enabled
rules to stateless rules implies changing all your rules
and scripts.

Maybe just limiting with NOTRACK the problematic protocols
can be enough to solve the problem. And surely more computing
power will be useful (CPU and RAM).

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



