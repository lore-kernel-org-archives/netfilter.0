From: "G.W. Haywood" <ged@jubileegroup.co.uk>
Subject: Re: Special firewall for wannabee dmz machine
Date: Wed, 26 Dec 2007 16:24:56 +0000 (GMT)
Message-ID: <Pine.LNX.4.58.0712261551300.14361@mail3.jubileegroup.co.uk>
References: <87abnyubhl.fsf@newsguy.com> <Pine.LNX.4.58.0712251639470.21533@mail3.jubileegroup.co.uk>
 <87r6hagkic.fsf@newsguy.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <87r6hagkic.fsf@newsguy.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi there,

On Tue, 25 Dec 2007 reader@newsguy.com wrote:

> "G.W. Haywood" <ged@jubileegroup.co.uk> writes:
>
> >> I'm setting up a gentoo linux machine who's sole purpose is to get
> >> traffic coming to a NETGEAR router upstream [snip]
> >
> > Why not install a purpose-made firewall distro, and maybe some addons?
> > You'll get logs, a GUI, graphs, all kinds of fun stuff.
>
> I'm not sure what you are talking about there.  Do you mean something
> like the `Soekris' board running openbsd?

No, not at all.

> Can you name a few of these purpose built distros?

ClarkConnect, Endian, Firestarter, Fli4l, Floppyfw, Gibraltar,
GuardDog, IPCop, LutelWall, m0n0wall, NuFW, pfSense, Shorewall,
SmoothWall, Turtle, Zorp...  You have heard of Google? :)

As you can see there are quite a few.  They have different design
criteria, they started from different places, and most of them made
detours along the way.  Mainly I use IPCop and SmoothWall, with a
substantial amount of fine-tuning by the addition of iptables rules,
both scripted and hand-crafted.  By the sound of it, you might want
something less 'packaged' than the distros that I use.

--

73,
Ged.
