From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: ssl forward / proxy question
Date: Fri, 25 Jul 2003 22:46:18 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030726024618.GA31690@cannon.eng.us.uu.net>
References: <20030725001249.9399.qmail@saturn5.com> <006701c352db$e891a380$05001aac@breton1> <20030725193303.GB30070@cannon.eng.us.uu.net> <001601c352f8$94146f00$05001aac@breton1>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <001601c352f8$94146f00$05001aac@breton1>
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
To: Garcia Ruiz <gar_ruiz@teleline.es>
Cc: Ramin Dousti <ramin@cannon.eng.us.uu.net>, jen@saturn5.com, netfilter@lists.netfilter.org

THe original poster has three web servers with three certs (I think). The
reverse proxy you are explaining below can only hold one cert (this is th=
e
nature of SSL).=20

Ramin

On Sat, Jul 26, 2003 at 12:03:27AM +0200, Garcia Ruiz wrote:

> I can tell you that squid 2.5 supports reverse proxying and it works th=
is
> way: Client -> SSL -> Squid (with certificates) -> No SSL -> Internal
> Server. I think that HTTP proxying supports reverse proxying for more t=
han 1
> server but I don't know if it's the same for SSL. In this case your onl=
y
> problem is that the internal network donn't have encryption (Is it fine=
 for
> you=BF?). If reverse proxy works for you, you can get an extra: The loa=
d of
> you web servers will be much lower (you won't probably get cached SSL p=
ages
> but as you know, when requesting a page there are a lot of requests -im=
ages
> among other- and these kind of requests can be cached and also are very
> heavy. The load of your servers would be also lower due to the lack of
> encryption-decryption inside them).
>=20
> Squid 3.0 supports Client -> SSL -> Squid (with certificates) -> SSL ->
> Internal Server but it is in developement state (I wouldn't use in
> production mode).
>=20
>=20
> Here you have some interesting links:
> http://squid.bilkent.edu.tr/mail-archive/squid-users/200102/0714.html
> http://www.squid-cache.org/mail-archive/squid-users/200303/1040.html
> http://squid.visolve.com/white_papers/reverseproxy.htm
>=20
> Regards,
>=20
> JBGR
>=20
> ----- Original Message -----=20
> From: "Ramin Dousti" <ramin@cannon.eng.us.uu.net>
> To: "Garcia Ruiz" <gar_ruiz@teleline.es>
> Cc: <jen@saturn5.com>; <netfilter@lists.netfilter.org>
> Sent: Friday, July 25, 2003 9:33 PM
> Subject: Re: ssl forward / proxy question
>=20
>=20
> > You mean squid is going to handle the "get" requests for https??????
> > Meaning it's terminating SSL, sending the right cert, negotiating a
> > session key with the client, getting the request and fetching the
> > contents based on the "get" request from the right web server on the
> > LAN????
> >
> > Can you confirm all the above? If so, squid is a big security hole,
> > but I'm sure it's not:
> >
> > http://www.squid-cache.org/Doc/FAQ/FAQ-1.html#ss1.12
> >
> > Ramin
> >
> > On Fri, Jul 25, 2003 at 08:38:14PM +0200, Garcia Ruiz wrote:
> >
> > > Have a look at Squid proxy. The last releases admit SSL reverse
> proxying. If
> > > it would be capable of handling different servers your problem woul=
d be
> > > solved. You could have it inside of the firewall (but be careful wi=
th
> > > security issues).
> > >
> > > Regards.
> > >
> > > BGR
> >
>=20

