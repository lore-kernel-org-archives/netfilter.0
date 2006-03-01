From: S t i n g r a y <fasi_74@yahoo.com>
Subject: Re: filtering HTTP signatures/headers ?
Date: Wed, 1 Mar 2006 07:40:00 -0800 (PST)
Message-ID: <20060301154001.71840.qmail@web51114.mail.yahoo.com>
References: <64843.193.173.147.3.1141215185.squirrel@webmail.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <64843.193.173.147.3.1141215185.squirrel@webmail.sterenborg.info>
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
To: Rob Sterenborg <rob@sterenborg.info>, netfilter@lists.netfilter.org

will it filter out HTTP tunneling also ?



--- Rob Sterenborg <rob@sterenborg.info> wrote:

>=20
> On Wed, March 1, 2006 12:45, S t i n g r a y wrote:
> > Is it possible to filter HTTP signatures/headers
> with
> > Iptables ? or is there addon for it ?
>=20
> You may be able to use the String match but you can
> only filter the payload of
> 1 packet at a time : if a signature/header spans
> multiple packets then it
> won't work.
>=20
> Netfilter is not meant to do content filtering.
> Perhaps you can use Squid.
>=20
>=20
> Gr,
> Rob
>=20
>=20
>=20
>=20


*=BA=A4., =B8=B8,.=A4=BA*=A8=A8=A8*=A4 Stingray *=BA=A4., =B8=B8,.=A4=BA*=
=A8=A8*=A4
             =20



__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around=20
http://mail.yahoo.com=20

