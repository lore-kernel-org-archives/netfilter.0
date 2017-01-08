From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Need module help
Date: Sat, 7 Jan 2017 21:53:07 -0600
Message-ID: <20170108035307.GH8339@harrier.slackbuilds.org>
References: <CAH-pVi-McTaVYJjvsBLbnSVk+wW2biD+0U8byK3exrFHfig1Hg@mail.gmail.com>
 <72f2e366-c823-40a6-17d6-330e803bc52e@plouf.fr.eu.org>
 <CAH-pVi-94=nY8zZJDQE_Kfq=01t9snXnBk-Rw3C8sbhsAM6i-w@mail.gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAH-pVi-94=nY8zZJDQE_Kfq=01t9snXnBk-Rw3C8sbhsAM6i-w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

[ top-posting fixed ]

> On Sat, Jan 7, 2017 at 3:33 PM, Pascal Hambourg=20
> <pascal@plouf.fr.eu.org> wrote:
> > Le 07/01/2017 =E0 18:54, DOHC F22 a =E9crit :
> >>
> >> Does someone know where I can find a ToS module that works
> >> with kernel 3.10.61+ and iptables 1.4.20?
> >
> >
> > xt_dscp
> > xt_DSCP

On Sat, Jan 07, 2017 at 09:39:33PM -0600, DOHC F22 wrote:
> Are those two different modules?

Yes.  Names in lowercase are match extensions, in this case, see:
    iptables -m dscp -h

UPPERCASE names indicate target extensions, so see this:
    iptables -j DSCP -h

More information on the use of both of these extensions is found in=20
the manual, iptables-extensions(8).

If the features you need are not supported in such an old distro,=20
your best bet would be to upgrade to a more recent release (or to a=20
distro that's not so many years behind.)
--=20
  http://rob0.nodns4.us/
  Offlist GMX mail is seen only if "/dev/rob0" is in the Subject:
