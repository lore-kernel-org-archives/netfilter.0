From: S t i n g r a y <fasi_74@yahoo.com>
Subject: Re: filtering HTTP signatures/headers ?
Date: Wed, 1 Mar 2006 20:04:00 -0800 (PST)
Message-ID: <20060302040400.27574.qmail@web51111.mail.yahoo.com>
References: <64303.193.173.147.3.1141234278.squirrel@webmail.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <64303.193.173.147.3.1141234278.squirrel@webmail.sterenborg.info>
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

The problem is that , i have a proxy/firewall box that
provides internet to my internal users, now i have
only permitted the common ports like
ftp,http,smtp,pop3 etc etc & blocked all other , now
there are couple of p2p applications out there that
tunnel through my port 80 as its open, this is taking
up my internet bandwith, i want to stop that ...

  regards


--- Rob Sterenborg <rob@sterenborg.info> wrote:

> On Wed, March 1, 2006 16:40, S t i n g r a y wrote:
> > will it filter out HTTP tunneling also ?
>=20
> Do you mean you have a VPN tunnel which transfers
> http, or what ? If that is
> the case, I don't think so ; Squid can only inspect
> traffic that it can see of
> course. However, if the Squid-box is at the end of
> the tunnel you may be able
> to do it.
> But maybe I don't understand correctly what problem
> you are trying to solve.
>=20
>=20
> Gr,
> Rob
>=20
> > --- Rob Sterenborg <rob@sterenborg.info> wrote:
> >> On Wed, March 1, 2006 12:45, S t i n g r a y
> wrote:
> >> > Is it possible to filter HTTP
> signatures/headers
> >> > with Iptables ? or is there addon for it ?
> >>
> >> You may be able to use the String match but you
> can
> >> only filter the payload of 1 packet at a time :
> if a
> >> signature/header spans multiple packets then it
> >> won't work.
> >>
> >> Netfilter is not meant to do content filtering.
> >> Perhaps you can use Squid.
> >>
> >>
> >> Gr,
> >> Rob
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

