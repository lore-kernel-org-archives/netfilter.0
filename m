From: George Alexandru Dragoi <waruiinu@gmail.com>
Subject: Re: Blocking Netranges Based on IP-to-Country CSV
Date: Mon, 20 Sep 2004 16:20:17 +0300
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <3063e504092006202f77fa72@mail.gmail.com>
References: <7EACCDBB65D37443912D80713CC1245D02382B06@fsnsab20.losangeles.af.mil>
	<20040917114613.GP452@metastasis.org.uk>
	<1403218a0409190209416c12b9@mail.gmail.com>
	<20040919110111.GA706@metastasis.org.uk>
	<1403218a04091904173de016ea@mail.gmail.com>
	<3063e504091904456844d5cf@mail.gmail.com>
	<20040920115357.GE3786@metastasis.org.uk>
	<414EC7B2.5000904@bewegungsmelder.de>
	<1095683170.1779.116.camel@grendel>
Reply-To: George Alexandru Dragoi <waruiinu@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1095683170.1779.116.camel@grendel>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

I understand to permit connections only comming from 1-2 countryes for
reasons like cheap  and huge bandwith from your country but very
expensive and low bandwith from the rest of internet (I actually done
this, permitting only from Romania, check metropolitana.loginet.ro
with a workarround for eliminating huge numbers of iptables rules,
there are also romanian ips), but permitting everybody excepting some
countryes doesnt count for security reasons, kiddies/crackers use
compromised machines from all world to continue their "work".


On Mon, 20 Sep 2004 08:26:11 -0400, Chris Brenton
<cbrenton@chrisbrenton.org> wrote:
> On Mon, 2004-09-20 at 08:06, Thomas Lu=DFnig wrote:
> >
> > - Extereme overload for IP-tables since it need extreme large table of
> > ip lists
>=20
> I beg to disagree. Most range blocking is done more on a region basis
> rather than by individual country (i.e. permit countries in Europe but
> maybe block Asia-Pacific). Given that IP ranges are delegated in large
> blocks (class A and B being the norm), it actually takes very few rules.
> For example I've had iptables firewalls pushing 400 Mb with region based
> filtering in place. Worked like a champ.
>=20
> > - Is extreme faulty since IP's are not original assinged to country but
> > locations like Europe.
>=20
> Agreed, so if you are trying to target a specific country, you may run
> into problems in areas like Europe. Blocking by region is less of an
> issue but you can still run into problems (like class A blocks in Asia
> that are also used in Australia, etc.).
>=20
> > - How you wan't to do the next step someone say i not wan't to select
> > based on country bot wan't different web server
> >  for region's with different main language. ASIA -> UTF8/Chinese Europe
> > Latin1/Frensh,German,English America =3D> Spain/english
>=20
> Actually, I'm pretty sure you could do this today with Squid. ;-)
>=20
> Obviously a portion of this is "intent". If its to reduce risk, its one
> thing. Banning based on color or creed is another. For example there are
> Spanish people all over the world so banning based on the language
> sounds like its more about discrimination rather than lowering risk.
>=20
> HTH,
> Chris
>=20
>=20



--=20
Bla bla

