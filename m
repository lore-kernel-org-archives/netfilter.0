From: Michael Gale <mgale@utilitran.com>
Subject: Re: Protecting against DoS
Date: Tue, 9 Dec 2003 10:06:50 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031209100650.485e8a4f.mgale@utilitran.com>
References: <20031209154333.GB17221@edu.joroinen.fi>
	<20031209090221.413b7286.mgale@utilitran.com>
	<20031209162820.GC17221@edu.joroinen.fi>
	<20031209094047.4dbb09f9.mgale@utilitran.com>
	<20031209165146.GD17221@edu.joroinen.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031209165146.GD17221@edu.joroinen.fi>
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
Cc: netfilter@lists.netfilter.org

Hello,

	You could try using a rate limit -- you could allow a machine to make lets=
 say 10 outbound connections a second and then ...

Depending on your network policy you could drop or log all other outbound r=
equest.

Michael.



On Tue, 9 Dec 2003 18:51:46 +0200
Pasi K=E4rkk=E4inen <pasik@iki.fi> wrote:

> On Tue, Dec 09, 2003 at 09:40:47AM -0700, Michael Gale wrote:
> > Hello,
> >=20
> > 	Can you provide more detail on the type of traffic that caused the DOS=
 -- this may help people in the list with suggestions on how to block it :)
> >=20
>=20
> Yep. It was tcp-connections from the windows box (infected by the worm) to
> some network-ranges on the internet. source-port was pretty much random, =
but
> the destination was always 80. So the normal 'allow web browsing' rules
> allowed the worm to DoS the linux-firewall. =20
>=20
> It just opened the connections all the time, but didn't close them.=20
>=20
> > Michael.
> >=20
>=20
> -- Pasi K=E4rkk=E4inen
>       =20
>                                    ^
>                                 .     .
>                                  Linux
>                               /    -    \
>                              Choice.of.the
>                            .Next.Generation.
>=20


--=20
Michael Gale
Network Administrator
Utilitran Corporation

