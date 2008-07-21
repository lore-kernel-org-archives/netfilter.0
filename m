From: Vladislav Kurz <vladislav.kurz@webstep.net>
Subject: Re: Iptables find invalid packets
Date: Mon, 21 Jul 2008 16:49:19 +0200
Message-ID: <200807211649.20343.vladislav.kurz@webstep.net>
References: <48847F16.8040604@itool.com> <200807211506.29492.vladislav.kurz@webstep.net> <48849F8F.70103@itool.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48849F8F.70103@itool.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Dimitri GOURDON <dgourdon@itool.com>
Cc: netfilter@vger.kernel.org

On Monday 21 of July 2008, you wrote:
> Vladislav Kurz a =E9crit :
> > On Monday 21 of July 2008, Dimitri GOURDON wrote:
> >> Hi all,
> >>
> >> I've setup LVS on a box using Keepalived (and Iptables) to load ba=
lance
> >> traffic between 2 web servers. I have a problem :
> >>
> >> A lot of TCP packets with FIN or RST flags (all I think) from clie=
nts
> >> are dropped by Iptables as state INVALID. The consequence is that =
I have
> >> a lot of connection in FIN_WAIT state (shown by netstat) on the 2 =
web
> >> servers...
> >
> > I have similar problem, and asked about it here. I was told to try =
newer
> > kernel (I run debian stable - 2.6.18). However I didn't upgrade yet=
, but
> > If you run the same kernel as I do and upgrade would help you I'd l=
ike to
> > here about that.
>
> I run 2.6.18-4-bigmem kernel. I've passed just a little to test a mor=
e
> recent but I stop because I've encountered problem with some iptables
> rules...

Temporary workaround is only to LOG invalid packets instead of DROP. Th=
e=20
system then becomes quite usable. Anyway try newer kernel if you can.
Or describe more in detail what problems with what rules did you have.


--=20
regards
        Vladislav Kurz
