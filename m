From: "Robert LeBlanc" <robert@leblancnet.us>
Subject: RE: iptables: hide the real web server from users
Date: Wed, 14 Feb 2007 07:43:15 -0700
Message-ID: <A78C6C481BFAE949BC5990E1EEB2FE12595D@q.LeBlancNet.us>
References: <9255886c0702140508m53568059k728056f9fe10c8b8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
In-Reply-To: <9255886c0702140508m53568059k728056f9fe10c8b8@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Squid would also do this for you.

Robert LeBlanc

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> bounces@lists.netfilter.org] On Behalf Of Rodrigo Montoro (Sp0oKeR)
> Sent: Wednesday, February 14, 2007 6:08 AM
> To: Tim Perton
> Cc: netfilter@lists.netfilter.org
> Subject: Re: iptables: hide the real web server from users
>=20
>    I don' t think iptables is your best option for that.
>    Try mod_security, mod_rewrite or apache proxy .
>=20
> Regards,
>=20
> On 2/14/07, Tim Perton <grpanosgr@yahoo.com> wrote:
> > Dear friends,
> > I have a web server running on system B. I run my main
> > services to System B but I do not want my users to
> > talk to system B directly.
> > So I have another server (System A) in a differrent
> > ISP & a completely different C class IP address like
> > below:
> >
> > -----------------------------
> > --- System A (IP=3Da.b.c.d) ---
> > -----------------------------
> >
> > -----------------------------
> > --- System B (IP=3De.f.g.h) ---
> > -----------------------------
> >
> > System A runs iptables(redhat EL4).
> >
> > I want my users to do a request like
> > http://a.b.c.d/1.php and then machine A to make the
> > same request to System B, get the results and send
> > them back to the user transparently.
> > Practically System A to act as an intermediatery to
> > the real machine (System B).
> >
> > Any idea on how to do this?
> >
> > Regards,
> > Tim Perton
> >
> >
> >
> >
>
________________________________________________________________________
__
> __________
> > Food fight? Enjoy some healthy debate
> > in the Yahoo! Answers Food & Drink Q&A.
> > http://answers.yahoo.com/dir/?link=3Dlist&sid=3D396545367
> >
> >
>=20
>=20
> --
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  Rodrigo Ribeiro Montoro
> Desenvolvedor BRMAlinux
>   spooker@brc.com.br
>        RHCE/LPIC-I
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D


