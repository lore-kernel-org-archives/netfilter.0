From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: POM Xtables???
Date: Mon, 30 Jun 2008 22:46:56 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0806302218500.30639@fbirervta.pbzchgretzou.qr>
References: <935fab200806271054oa7c340evbf465b7a9984498b@mail.gmail.com>  <alpine.LNX.1.10.0806272003170.12725@fbirervta.pbzchgretzou.qr>  <4866F152.7030109@riverviewtech.net> <935fab200806300904rc7dc7b2kf58ab7893c3ef20a@mail.gmail.com>
 <486907EA.60105@trash.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <486907EA.60105@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick McHardy <kaber@trash.net>
Cc: Dave <finalglide@gmail.com>, netfilter@vger.kernel.org


On Monday 2008-06-30 18:20, Patrick McHardy wrote:
>
>> 3) Still don't know where Xtables-addons fits in with Netfilter?  Why
>> is Xtables not on the Netfilter site or even mentioned there at all?
>> What does the core Netfilter team think of Xtables-addons?
>
> I have no opinion about this except that already mentioned by
> Jan: useful patches in proper state should be upstream, all
> others I don't care about.

Well at least I want to give it some care. POM, and Xtables-addons
exist because modules were rejected upstream.

- xt_CHAOS, xt_DELUDE, xt_portscan:
  http://lkml.org/lkml/2007/3/8/218 ("what do we gain?")

- xt_IPMARK: http://marc.info/?l=netfilter-devel&m=121148746823147&w=2
  ("Thats another special-casing module, exactly
  the think I *don't* like. How many more of these (with slightly
  differing semantic and features) should we add?")

- sample modules (xt_ECHO)
  These obviously don't belong into the kernel.

- the rest: dunno?


>> 4) How does one patch for ACCOUNT and IPSET?  I couldn't find any
>> modules for Xtables-addons to patch for these extensions, although I
>> did find mention of a xt_account extension, but couldn't find any
>> download or anyway to add it to addons.  I had to patch ACCOUNT and
>> IPSET with Patch-O-Matic.  It seems we really have to use both these
>> patchers to get everything.
>
> ipset is an exception as its the only patch maintained by
> someone from the Core Team that has not been merged upstream
> yet. As such it shouldn't be included in Jan's package since
> Jozsef is doing official releases in pom.

ACCOUNT and a few others (IMQ, layer7) do not use pom.
ipset does not actively live in pom, but strangely uses its patch
system... well it's perhaps the only one that still does ;-)

ipset is kinda floating. Joszef wanted to revamp it into a
nf_ipset, but nothing has surfaced so far. (Well, neither has my
ultimate code unification, heh.) It's a special case.

So for the above-mentioned three (ACCOUNT et al) you would just
use their documented method aka `patch -p1 -i /path/to/account.diff`
and hope that it works. Of course it would be much nicer if they
could make use of the kernel version glue in Xtables-addons.

>> 6) Currently the extensions and patching systems seems to be a
>> hodge-podge of items, all with different web sites, maintainers and
>> writers, from a newbie perspective it's confusing, would be nice if it
>> was wrapped up into something more straitforward. Hopefully this is
>> what Xtables-addons is doing, BUT would be really nice if this all
>> started officially at Netfilter.org.
>
> Short answer - don't do it, the module provided by the kernel
> should be enough for 99.99% of all cases. If it isn't, convince
> us to merge the patch, which usually isn't very hard.
>
> History has repeatedly shown that out of tree patches are buggy
> and cause more problems than they solve, which is why there
> is no interest from the netfilter team in maintaining external
> patches.

Hence I have taken up some and fixed them to be straight.
Patrick, what's your judgment on the existing
xt_{LOGMARK,TARPIT,TEE,condition,geoip,ipp2p} modules in xtables-addons?
