From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: counter target
Date: Thu, 31 Aug 2023 17:32:11 +0200
Message-ID: <ZPCye6qKuWeFAnCU@calendula>
References: <CAOLfK3WNwrokC54pspxSN89OHrfW2RTTyGsj2kBYaf-c1H-DPw@mail.gmail.com>
 <ZOu75rSEGwJOleQB@calendula>
 <CAOLfK3UMF7V2izJfdTUMymiR=To8=icytybWXP8Md6fM1rOgDg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOLfK3UMF7V2izJfdTUMymiR=To8=icytybWXP8Md6fM1rOgDg@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Matt Zagrabelny <mzagrabe@d.umn.edu>
Cc: netfilter <netfilter@vger.kernel.org>

On Thu, Aug 31, 2023 at 10:25:15AM -0500, Matt Zagrabelny wrote:
> Hi Pablo,
>=20
> On Sun, Aug 27, 2023 at 4:11=E2=80=AFPM Pablo Neira Ayuso <pablo@netfilte=
r.org> wrote:
> >
> > On Fri, Aug 25, 2023 at 04:06:54PM -0500, Matt Zagrabelny wrote:
> > > Greetings netfilter,
> > >
> > > I have a question about the location of a "counter" statement.
> > >
> > > I see from the wiki [0] that placing a counter for the default policy
> > > comes *after* the policy:
> >
> > Wiki example does not refer to the default policy.
>=20
>=20
> Ahh. Now I see. Thanks for the clarification.
>=20
> Is there a way to count the packets that get evaluated by the default
> policy of a chain?
>=20
> I know I can put a counter after all my rules, but it seems like it
> would be nicer to somehow integrate it into:
>=20
> chain IN {
>         type filter hook input priority filter; policy drop;
>=20
> for example:
>=20
> chain IN {
>         type filter hook input priority filter; policy counter drop;

Perhaps you mean something like this syntax:

         type filter hook input priority filter; counter; policy drop;

to enable basechain counters.

No, this is not supported.

> ...but the above fails.

You have to place a counter after all your rules to count those that
reach the basechain as you suggest.
