From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: POM Xtables???
Date: Mon, 30 Jun 2008 22:18:47 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0806302209120.30639@fbirervta.pbzchgretzou.qr>
References: <935fab200806271054oa7c340evbf465b7a9984498b@mail.gmail.com>  <alpine.LNX.1.10.0806272003170.12725@fbirervta.pbzchgretzou.qr>  <4866F152.7030109@riverviewtech.net> <935fab200806300904rc7dc7b2kf58ab7893c3ef20a@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <935fab200806300904rc7dc7b2kf58ab7893c3ef20a@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave <finalglide@gmail.com>
Cc: netfilter@vger.kernel.org


On Monday 2008-06-30 18:04, Dave wrote:

>Over the weekend I managed to get the Xtables-addons working with
>Kernel 2.6.25.  Throughout this process many questions have come up
>that were unanswered by the documentation or Netfilter site.  I'll
>point them out.
>
>1) Confusion on just what Xtables is.  Is Xtables really just
>Iptables?  It seems to be, but there is nothing saying so officially.
>2) Is Xtables the same things as Xtables-addons, Jan in your
>directory, the files go from Xtables..... to Xtables-addons.... , does
>this mean they are the same thing or different?

I recently had updated http://en.wikipedia.org/wiki/Netfilter , maybe it gives
a few hints.

Xtables, is x_tables.ko, in other words, the firewall, and the table
structure as you know it. It is the mold of ip_tables.ko and
ip6_tables.ko, though of course the latter two still exist, for
reasons of simple "unsharability", code that applies to just one of
IPv4 or IPv6, respectively.

Sometimes people call it Iptables too, it has become synonymous. The
same holds true for the userspace tool. When in doubt, the suffix
"kernel components" or "userspace components" should be added when
mentioning xtables and/or iptables if we cannot figure out.

Hence xtables-addons. The name was strongly inspired by
asterisk-addons, actually.

>3) Still don't know where Xtables-addons fits in with Netfilter?  Why
>is Xtables not on the Netfilter site or even mentioned there at all?

It is a relatively new name that had not yet had much widespread use
(in the process of promoting it though); people still call iptables
and xtables interchangably. Xtables is not a completely shiny new
product, but a gradual evolution from previous code, so people see
less need to call it that way, especially since most of the users
only deal with the IPV4-specific part of the userspace tools anyway
(aka /usr/sbin/iptables).

