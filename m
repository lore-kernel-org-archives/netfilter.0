From: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
Subject: Re: Protecting against DoS
Date: Tue, 9 Dec 2003 19:13:22 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031209171322.GE17221@edu.joroinen.fi>
References: <20031209154333.GB17221@edu.joroinen.fi> <20031209090221.413b7286.mgale@utilitran.com> <20031209162820.GC17221@edu.joroinen.fi> <20031209094047.4dbb09f9.mgale@utilitran.com> <20031209165146.GD17221@edu.joroinen.fi> <20031209100650.485e8a4f.mgale@utilitran.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20031209100650.485e8a4f.mgale@utilitran.com>
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

On Tue, Dec 09, 2003 at 10:06:50AM -0700, Michael Gale wrote:
> Hello,
>=20
> 	You could try using a rate limit -- you could allow a machine to make le=
ts say 10 outbound=20
> connections a second and then ...
>=20
> Depending on your network policy you could drop or log all other outbound=
 request.
>=20

This is what I'm planning to do.. and this is also the reason I was asking
the questions in the original mail :-)

-- Pasi K=E4rkk=E4inen
      =20
                                   ^
                                .     .
                                 Linux
                              /    -    \
                             Choice.of.the
                           .Next.Generation.

