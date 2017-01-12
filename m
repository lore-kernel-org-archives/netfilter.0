From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Need module help
Date: Thu, 12 Jan 2017 12:15:24 -0600
Message-ID: <20170112181524.GJ8339@harrier.slackbuilds.org>
References: <CAH-pVi-McTaVYJjvsBLbnSVk+wW2biD+0U8byK3exrFHfig1Hg@mail.gmail.com>
 <72f2e366-c823-40a6-17d6-330e803bc52e@plouf.fr.eu.org>
 <CAH-pVi-94=nY8zZJDQE_Kfq=01t9snXnBk-Rw3C8sbhsAM6i-w@mail.gmail.com>
 <20170108035307.GH8339@harrier.slackbuilds.org>
 <3d6b0822-d484-e41e-8141-94dc128b94ba@plouf.fr.eu.org>
 <CAH-pVi810QXjG5p_nhdpdGNcM2RWO7w9AZrE==t0-tzsyLEpLw@mail.gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAH-pVi810QXjG5p_nhdpdGNcM2RWO7w9AZrE==t0-tzsyLEpLw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

On Thu, Jan 12, 2017 at 07:29:31AM -0600, DOHC F22 wrote:
> On Sun, Jan 8, 2017 at 5:29 AM, Pascal Hambourg=20
> <pascal@plouf.fr.eu.org> wrote:
> > Le 08/01/2017 =E0 04:53, /dev/rob0 a =E9crit :
> >> On Sat, Jan 07, 2017 at 09:39:33PM -0600, DOHC F22 wrote:
> >>>
> >>> Are those two different modules?
> >>
> >> Yes.  Names in lowercase are match extensions, in this case,=20
> >> see:
> >>     iptables -m dscp -h
> >>
> >> UPPERCASE names indicate target extensions, so see this:
> >>     iptables -j DSCP -h
> >
> >
> > Note that these modules also support the older tos match and
> > TOS target extensions respectively.
>=20
> I'm having trouble finding those modules for the exact
> iptables/kernel version.  Should I be more focused on matching
> the kernel version?  Is there some repository somewhere with
> modules to download?

No.  Well, *maybe* depending on distro, but the Linux kernel is=20
distributed by the upstream project (kernel.org) as source code.

Are you saying that those modules are not found on your system?  If=20
that's the case you're going to have to recompile your kernel with
all necessary options enabled.

BTW just about any distro kernel gets this right.  Only custom=20
kernels built by inexperienced people have problems like this.
(This issue is often seen on VPS systems where you don't control
your own kernel, too.)

I suspect a hefty amount of "XY question" is involved here, in=20
addition to a lack of background information.  Perhaps if you share=20
the background on what you're trying to accomplish, you can get the=20
kind of help you can use.
--=20
  http://rob0.nodns4.us/
  Offlist GMX mail is seen only if "/dev/rob0" is in the Subject:
