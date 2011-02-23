From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: ipset -R
Date: Wed, 23 Feb 2011 22:58:10 +0000
Message-ID: <4D659102.8090501@googlemail.com>
References: <4D645BC7.7030306@googlemail.com> <alpine.DEB.2.00.1102232009001.16917@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=/P4FRspvvPt6rkK6jZ6jBChGIsUwqzDtE5X+ZYDx8W4=;
        b=DwQAzwKZ6hc585NvUvsZ6QxUjB5zYrsEjDBZ6CnkzmnPJnaUwds2sH0UbW/RyzSjG6
         tqWFYrAbnKDHIGE5//wf0hGxtPxxz8/sa1UEw0galKMmjP6I2hLauMCwOpt1R7M9TLkm
         JOxZtzMApSU1QBrq7XrTi2D2aKuI0CnbT465w=
In-Reply-To: <alpine.DEB.2.00.1102232009001.16917@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>


> The iptreemap type of ipset 4.x had the feature you are referring here.
>
> The iptree and iptreemap types are not implemented in ipset 5.x. However 
> you can achieve the same effect by using two sets, the first one for the 
> pinholes and the second one for the networks.
>   
It would be a bit cumbersome to achieve that.

I use the geoip database to construct, among other things, a permanent 
block lists (mainly based on country of origin, but there are other 
factors which I won't go in here) and these sets are only present in my 
block chains (there is also a bit of logic involved, but that is another 
set of issues altogether). I also have a separate list with host ip 
addresses/ranges (my 'whitelist' so to speak) against which I 
subsequently execute the delete statements to create the pinholes 
(another useful ipset feature is that it silently ignores delete 
requests if the ip address/range is not present in the set).

As you know the geoip database regularly changes (so does, albeit 
occasionally, the country of origin of various ip address ranges), so I 
normally execute an automated set of scripts to update the database, 
pick the right address ranges for blocking, construct-and-replace my 
ipsets in the 3 or so blocking chains I have on the main firewall and 
then apply the deletion statements to the same sets to create the pinholes.

The problem I see with your approach above is that I would have to 
explicitly grant some sort of access to my 'whitelist' addresses (those 
with which I create the pinholes), which isn't possible as I do not know 
which ports (or port ranges) would need to be enabled - that depends on 
various factors which I cannot always control. Besides, I would like the 
'whitelist' addresses to be traversed further down the ip chain as there 
may be other rules which catch them. In other words, I cannot explicitly 
allow access to the whitelist addresses as you are suggesting above (so 
is my understanding).

The ideal scenario, as I pointed out above, would be to use the 
whitelist to create the pinholes (i.e. execute a deletion against 
already registered sets) without explicitly allowing access to those ip 
addresses/ranges.

Another pretty good alternative would be (if I am, somehow, able) to 
'subtract' my whitelist members from the blacklisted ones and then use 
the resulting set (or sets), but as far as I know I can't do that in 
ipset, can I?

