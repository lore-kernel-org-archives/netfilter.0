From: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
Subject: Re: Protecting against DoS
Date: Tue, 9 Dec 2003 18:28:20 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031209162820.GC17221@edu.joroinen.fi>
References: <20031209154333.GB17221@edu.joroinen.fi> <20031209090221.413b7286.mgale@utilitran.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20031209090221.413b7286.mgale@utilitran.com>
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
To: Michael Gale <mgale@utilitran.com>
Cc: netfilter@lists.netfilter.org

On Tue, Dec 09, 2003 at 09:02:21AM -0700, Michael Gale wrote:
>=20
> Hello,
>=20
> 	First make sure you are using tcpsyn_cookies:
>=20
> echo 1 > /proc/sys/net/ipv4/tcp_syncookies -- if you have not compiled it=
 into the kernel.=20
> This will help prevent DOS by assigning each incoming syn packet a cookie=
 instead of a actually=20
> connection state. A connection state will be created once the three way h=
and shake is completed.
>=20
> Second -- you should be dropping all packets on all interfaces and then o=
nly allow connections=20
> you have to pass.
>=20

Yes.. I'm already doing both of these things. I was thinking of doing some
extra in addition of these.. Sorry I didn't mention about these already.

There are always some connections allowed that can be used to fill up the
state table..

Thanks anyway!

> Michael.
>=20

-- Pasi K=E4rkk=E4inen
      =20
                                   ^
                                .     .
                                 Linux
                              /    -    \
                             Choice.of.the
                           .Next.Generation.

