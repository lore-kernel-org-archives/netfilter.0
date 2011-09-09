From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: connlimit problem
Date: Fri, 9 Sep 2011 11:33:38 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1109091132200.18593@blackhole.kfki.hu>
References: <4E69C831.4050004@univ-nantes.fr> <alpine.DEB.2.00.1109091110100.18593@blackhole.kfki.hu> <4E69DA81.3060206@univ-nantes.fr> <alpine.DEB.2.00.1109091122060.18593@blackhole.kfki.hu> <4E69DB87.6040601@univ-nantes.fr>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="110391812-574104394-1315560818=:18593"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4E69DB87.6040601@univ-nantes.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Jean-Philippe Menil <jean-philippe.menil@univ-nantes.fr>
Cc: netfilter@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--110391812-574104394-1315560818=:18593
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 9 Sep 2011, Jean-Philippe Menil wrote:

> Le 09/09/2011 11:22, Jozsef Kadlecsik a =E9crit :
> > On Fri, 9 Sep 2011, Jean-Philippe Menil wrote:
> >=20
> > > Le 09/09/2011 11:12, Jozsef Kadlecsik a =E9crit :
> > > > On Fri, 9 Sep 2011, Jean-Philippe Menil wrote:
> > > >=20
> > > > > I try to limit the connection per ip with connlimit in addition t=
o the
> > > > > socket
> > > > > match, with the following rule:
> > > > > $IPTABLES -t mangle -A PREROUTING -s $LAN -p tcp --syn --dport ht=
tp -m
> > > > > socket
> > > > > -m connlimit --connlimit-above 0 -j DIVERT
> > > > >=20
> > > > > But as you can see, theses rules  never match:
> > > > >=20
> > > > >       0     0 DIVERT     tcp  --  *      *       192.168.100.0/24
> > > > > 0.0.0.0/0
> > > > > tcp dpt:80flags: 0x17/0x02 socket #conn src/32>   1
> > > > >       9  3030 DIVERT     tcp  --  *      *       192.168.100.0/24
> > > > > 0.0.0.0/0
> > > > > tcp dpt:80 socket
> > > > >       5   216 TPROXY     tcp  --  *      *       192.168.100.0/24
> > > > > 0.0.0.0/0
> > > > > tcp dpt:80 TPROXY redirect 0.0.0.0:50080 mark 0x1/0x1
> > > > >       0     0 DIVERT     tcp  --  *      *       192.168.100.0/24
> > > > > 0.0.0.0/0
> > > > > tcp dpt:3128flags: 0x17/0x02 socket #conn src/32>   1
> > > > >       6  2491 DIVERT     tcp  --  *      *       192.168.100.0/24
> > > > > 0.0.0.0/0
> > > > > tcp dpt:3128 socket
> > > > >      19   800 TPROXY     tcp  --  *      *       192.168.100.0/24
> > > > > 0.0.0.0/0
> > > > > tcp dpt:3128 TPROXY redirect 0.0.0.0:50080 mark 0x1/0x1
> > > > >=20
> > > > > Is this an expected behaviour, or a problem in my rules?
> > > > You use the socket match from the PREROUTING chain, where it'll nev=
er
> > > > match: it's before routing, so the the system could not associate t=
he
> > > > packet to a socket yet.
> > > >=20
> > > Ok, i see.
> > > So, if my understand is correct, it will be better to do like this:
> > >=20
> > > $IPTABLES -t mangle -A PREROUTING -s $LAN -p tcp --dport http -m sock=
et -j
> >                           ^^^^^^^^^^                             ^^^^^^=
^^^
> > Here again....
> >=20
> No, it's working as expected.
> I have just followed the documentation in:
> Documentation/networking/tproxy.txt

OK, the socket match not only checks but lookups the matching sockets. So=
=20
it does indeed work from the PREROUTING chain.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
--110391812-574104394-1315560818=:18593--
