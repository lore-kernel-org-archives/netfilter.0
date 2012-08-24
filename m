From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: Double stack IPv4&&IPv6 for a firewall
Date: Sat, 25 Aug 2012 01:46:30 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1208250137290.30075@frira.zrqbmnf.qr>
References: <50375A06.6000808@cica.es> <1345818598.2977.265.camel@denise.theartistscloset.com> <alpine.LNX.2.01.1208241640240.16184@frira.zrqbmnf.qr> <CAPfcJatemcsT5PK+m8__xhB7gBRinAuq2wNX_g93CQrSmvtDhQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAPfcJatemcsT5PK+m8__xhB7gBRinAuq2wNX_g93CQrSmvtDhQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arturo Borrero <aborrero@cica.es>
Cc: netfilter@vger.kernel.org, "John A. Sullivan III" <jsullivan@opensourcedevel.com>


On Friday 2012-08-24 23:12, Arturo Borrero wrote:
>
>DNS lookups are a problem in a big ruleset (~10.000) rules, so the point is
>to do some kind of local cache.

So run a local BIND server, lwresd, dnsmasq, nscd, or whatever.

>As I supposed, the doble stack method is not being well aproached yet.

What isn't?

>The code (bash) is here:
>https://github.com/aborrero/fw-admin

sh is amongst the *slowest* of all. Your README.md says

>You usally set your ruleset in this way:
>
>$IPT -A INPUT -i $IF -s $INTERNET -d $MYSERVER -p tcp --sport 1024: --dport
>$SSH_PORT -j ACCEPT 

If you begin with something like this, no wonder it's all going slow,
because you are needlessy reloading all the damn rules.
That's why smart people use iptables-restore.

Also, the --sport 1024: is pretty dull, because there is no RFC
that forbids the use of numbers lower than that.


>Also, fw-admin is just a complex bash script

Its greatest problem, btw.


