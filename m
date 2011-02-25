From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: ipset -R
Date: Fri, 25 Feb 2011 16:27:33 +0000
Message-ID: <4D67D875.4000103@googlemail.com>
References: <4D645BC7.7030306@googlemail.com>	<alpine.DEB.2.00.1102232009001.16917@blackhole.kfki.hu>	<4D659102.8090501@googlemail.com>	<AANLkTi=06RAwFaiQzjiTMmJaoy+EgXSbq3UdOfonH4UQ@mail.gmail.com>	<4D664C9F.3020701@googlemail.com>	<alpine.DEB.2.00.1102250915200.20179@blackhole.kfki.hu>	<4D67AE2C.3010902@googlemail.com> <AANLkTi=_igg_4QXup3uU1A-UhhTNPXG_GOBvSqGMLzgW@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=Y7lVDGfnH2CVzqFVM/1Ojcqz7SconcZCopjDmg/oFxA=;
        b=iRZ15U8BPJv0i14Ix54zUzLNqCtDNejCtTRt4bkw0i8skrTyGnZODx6p4cYzlgGQS6
         ggeqXDvF1p3WnVTPFKXOj3DxEbAuY8nAsMhi+4lPVhD7VJMucirIT4XaYO8NEad5SlbJ
         ltiMnPTtSSpKmCvBLodSZJ9NcWVX657WvwdJU=
In-Reply-To: <AANLkTi=_igg_4QXup3uU1A-UhhTNPXG_GOBvSqGMLzgW@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pandu Poluan <pandu@poluan.info>
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


> I haven't perused netfilter code yet, so what I'll say is highly conjectural.
>
> IMO, the single (1) rule will be a lot faster:
> * Only 1 (one) check for whitelist
> * x checks for blacklist-checks
>
> Total checks (worst-case): 1+x (and if the negated result of whitelist
> check == false, no need for x blacklist-checks)
>
> Best case: 1 check ( IP in whitelist, so ! whitelist == false,
> iptables' rule is short-circuited )
>
> Rule (2):
> * A total of x times ( whitelist check + blacklist-check )
>
> Total checks (worst-case): x * 2
>
> Best case: x * 1 ( only check against whitelist, but repeated for x rules )
>   
The above makes perfect sense and is more or less what I assumed would 
be the case, though I thought of even a better way, which would remove 
the need of using a list-type set:

-m set ! --match-set whitelist src -j $BLACKLIST_PROCESSING_CHAIN

where $BLACKLIST_PROCESSING_CHAIN contains all the blacklist elements 
and another jump to DROP - as is the case at present. There are at least 
two major advantages as far as I can see: 1) I could log/see the number 
of packets dropped for each particular blacklist-x set (something I 
would have lost with the use of list-type set as everything would have 
been lumbered in one place); and 2) performance-wise there won't be any 
difference from what is the case at present - with deleting set members 
and only using the blacklist-x sets, although I have to admit that if I 
have used a single list-type set with a single iptables statement I 
think the performance would have been a little bit better.

> IMO, iptables lookups are much more expensive than ipset lookups. (
> IOW, n * iptables checks is much more expensive than 1 * iptables
> check against a setlist with n members ). So, the speedup of (1)
> against (2) will be even more significant.
>   
Absolutely - the main reason I switched to ipset, as asking iptables to 
traverse through more than, say, 2500 statements in a single chain is 
asking for trouble!

