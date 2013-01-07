From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Wrapper script for ipset listing
Date: Mon, 7 Jan 2013 08:59:53 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1301070852290.591@blackhole.kfki.hu>
References: <50E84F5E.8060704@airpost.net> <alpine.LNX.2.01.1301051809460.23031@nerf07.vanv.qr> <50E8F495.40307@airpost.net> <alpine.LNX.2.01.1301062030320.14070@nerf07.vanv.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1301062030320.14070@nerf07.vanv.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@inai.de>
Cc: Born Without <blackhole@airpost.net>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Sun, 6 Jan 2013, Jan Engelhardt wrote:

> On Sunday 2013-01-06 04:50, Born Without wrote:
> >>> As I was missing those features in the ipset set listing capabilities:
> >>>
> >>> - show sum of set members
> >>> - suppress listing of headers
> >>> - choose a delimiter character for separating member entries
> >>>
> >>> I wrote a little wrapper script (for the bash shell) to support them.
> >>> For those who like, you'll find it attached.
> >>
> >> There's libipset, with which this task should be achievable to the
> >> maximum customizable degree without involving ugly text parsing with sh.
> >
> > good you mention libipset, because not even the man page does, nor does any
> > documentation or similar exist.
> 
> I have taken Joszef into Cc..
> 
> > Interesting, that you belittle text parsing, it's such a common task 
> > in linux. And thank you for telling us, that C has more power that sh. 
> > Really great insight!
> 
> "Common" does not mean "the right thing", especially if the output is 
> prone to change - and by definition, everything that has not been 
> declared as giving a stable output can easily change at inconvenient 
> times, depending on moon phase and locale settings.
> 
> Stable output does not necessarily mean a C API. Tools default to output
> human-readable prose, and may require specific options to put them into
> machine-parseable mode. Compare: `date` vs. `date -d +"%F %T"` (parseable).

In order to parse the output produced by ipset, one should take into 
account the followings:

- New header elements may appear but the header part is always 
  started by "Name:" and ended by "Members:".
- New value parameters may appear but those are appended to the existing
  ones.

If those "rules" are taken into account, then shell/perl/etc scripts can 
safely parse the output.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
