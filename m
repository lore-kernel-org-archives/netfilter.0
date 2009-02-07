From: Vincent Bernat <bernat@luffy.cx>
Subject: Re: Empty Target
Date: Sat, 07 Feb 2009 08:12:07 +0100
Message-ID: <m3skmq7mbc.fsf@neo.luffy.cx>
References: <498cb439.20018e0a.3be8.ffffc9e3@mx.google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <498cb439.20018e0a.3be8.ffffc9e3@mx.google.com> (Gilad
	Benjamini's message of "Fri, 6 Feb 2009 14:05:40 -0800")
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Gilad Benjamini <gilad.benjamini@gmail.com>
Cc: netfilter@vger.kernel.org

OoO La nuit ayant d=C3=A9j=C3=A0 recouvert  d'encre ce jour du vendredi=
 06 f=C3=A9vrier
2009, vers 23:05, "Gilad Benjamini" <gilad.benjamini@gmail.com> disait=C2=
=A0:

> I am trying to troubleshoot an iptables rule set, trying to understan=
d where
> different packets are going. I have found that using "iptables -L -v"=
 is a
> useful tool, with the counters telling me what's going on.
> To "trigger" counters I currently use LOG rules. I would actually pre=
fer
> some sort of empty rule; a rule that would do nothing beyond increasi=
ng the
> counters.

> Does something like that exist ?
> Seems trivial to implement.=20

You can also use the TRACE target if your kernel is recent enough.
--=20
I WILL NOT GREASE THE MONKEY BARS
I WILL NOT GREASE THE MONKEY BARS
I WILL NOT GREASE THE MONKEY BARS
-+- Bart Simpson on chalkboard in episode 7F17
