From: "Hulsman, MJ (Mike)" <M.J.Hulsman01@rf.rabobank.nl>
Subject: RE: ssl forward / proxy question
Date: Mon, 28 Jul 2003 17:05:56 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <34C4E1392F32A549B9F2573F48F1A76E04BD2C3B@amphion.rabobank.corp>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Ramin Dousti <ramin@cannon.eng.us.uu.net>, Garcia Ruiz <gar_ruiz@teleline.es>
Cc: jen@saturn5.com, netfilter@lists.netfilter.org

If you have three ip addresses on the squid proxy, you can have three ssl =
certs.

Mike Hulsman.

> -----Oorspronkelijk bericht-----
> Van: Ramin Dousti [mailto:ramin@cannon.eng.us.uu.net]
> Verzonden: zaterdag 26 juli 2003 3:46
> Aan: Garcia Ruiz
> CC: Ramin Dousti; jen@saturn5.com; netfilter@lists.netfilter.org
> Onderwerp: Re: ssl forward / proxy question
>=20
>=20
> THe original poster has three web servers with three certs (I=20
> think). The
> reverse proxy you are explaining below can only hold one cert=20
> (this is the
> nature of SSL).=20
>=20
> Ramin
>=20
> On Sat, Jul 26, 2003 at 12:03:27AM +0200, Garcia Ruiz wrote:
>=20
> > I can tell you that squid 2.5 supports reverse proxying and=20
> it works this
> > way: Client -> SSL -> Squid (with certificates) -> No SSL=20
> -> Internal
> > Server. I think that HTTP proxying supports reverse=20
> proxying for more than 1
> > server but I don't know if it's the same for SSL. In this=20
> case your only
> > problem is that the internal network donn't have encryption=20
> (Is it fine for
> > you=BF=3F). If reverse proxy works for you, you can get an=20
> extra: The load of
> > you web servers will be much lower (you won't probably get=20
> cached SSL pages
> > but as you know, when requesting a page there are a lot of=20
> requests -images
> > among other- and these kind of requests can be cached and=20
> also are very
> > heavy. The load of your servers would be also lower due to=20
> the lack of
> > encryption-decryption inside them).
> >=20
> > Squid 3.0 supports Client -> SSL -> Squid (with=20
> certificates) -> SSL ->
> > Internal Server but it is in developement state (I wouldn't use in
> > production mode).
> >=20
> >=20
> > Here you have some interesting links:
> >=20
> http://squid.bilkent.edu.tr/mail-archive/squid-users/200102/0714.html
> > http://www.squid-cache.org/mail-archive/squid-users/200303/1040.html
> > http://squid.visolve.com/white_papers/reverseproxy.htm
> >=20
> > Regards,
> >=20
> > JBGR
> >=20
> > ----- Original Message -----=20
> > From: "Ramin Dousti" <ramin@cannon.eng.us.uu.net>
> > To: "Garcia Ruiz" <gar_ruiz@teleline.es>
> > Cc: <jen@saturn5.com>; <netfilter@lists.netfilter.org>
> > Sent: Friday, July 25, 2003 9:33 PM
> > Subject: Re: ssl forward / proxy question
> >=20
> >=20
> > > You mean squid is going to handle the "get" requests for=20
> https=3F=3F=3F=3F=3F=3F
> > > Meaning it's terminating SSL, sending the right cert,=20
> negotiating a
> > > session key with the client, getting the request and fetching the
> > > contents based on the "get" request from the right web=20
> server on the
> > > LAN=3F=3F=3F=3F
> > >
> > > Can you confirm all the above=3F If so, squid is a big=20
> security hole,
> > > but I'm sure it's not:
> > >
> > > http://www.squid-cache.org/Doc/FAQ/FAQ-1.html#ss1.12
> > >
> > > Ramin
> > >
> > > On Fri, Jul 25, 2003 at 08:38:14PM +0200, Garcia Ruiz wrote:
> > >
> > > > Have a look at Squid proxy. The last releases admit SSL reverse
> > proxying. If
> > > > it would be capable of handling different servers your=20
> problem would be
> > > > solved. You could have it inside of the firewall (but=20
> be careful with
> > > > security issues).
> > > >
> > > > Regards.
> > > >
> > > > BGR
> > >
> >=20
>=20
>=20
>=20
>=20


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
De informatie opgenomen in dit bericht kan vertrouwelijk zijn en=20
is uitsluitend bestemd voor de geadresseerde. Indien u dit bericht=20
onterecht ontvangt, wordt u verzocht de inhoud niet te gebruiken en=20
de afzender direct te informeren door het bericht te retourneren.=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
The information contained in this message may be confidential=20
and is intended to be exclusively for the addressee. Should you=20
receive this message unintentionally, please do not use the contents=20
herein and notify the sender immediately by return e-mail.


