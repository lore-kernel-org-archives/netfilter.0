From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: [ANNOUNCE] ipset 6.11 released
Date: Sun, 15 Jan 2012 22:38:10 +0000
Message-ID: <4F135552.4070804@googlemail.com>
References: <alpine.DEB.2.00.1201141542490.26282@blackhole.kfki.hu> <4F130A03.7080208@googlemail.com> <alpine.DEB.2.00.1201151825570.29134@blackhole.kfki.hu> <4F131551.2090608@googlemail.com> <alpine.DEB.2.00.1201152100050.29766@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=message-id:disposition-notification-to:date:from:user-agent
         :mime-version:to:cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=IpVOiyeyMOBoiLaFcOTy3rBZF4bM0KR581gaZy0YhH0=;
        b=gxQLA70DdzhiFp6ml6wD5HS/ClRU1fqTq4F3HDWMVWe0lg6quhzwjB0wEwEnyO9Aic
         KRM/pTUwcKK2pTDmZOhZGJjqBF0uzjAzasPqcc5RKvN2wDbXvP/1j6X6SAkdugeDC5h8
         bxfslyPgR3/Ohv9CCNQqodYSq8OC7PBQw7Hso=
In-Reply-To: <alpine.DEB.2.00.1201152100050.29766@blackhole.kfki.hu>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org


> Your request means a third mode, which could lead to even more confusion, 
> because that way one could not check whether the tested address as 
> *element* is added to the set or not.
>   
This is not a feature request, it is a bug fix!

If ipset, for whatever reason, can't (or won't) handle ip range for 
match testing, then such requests should be discarded with the 
appropriate error or warning message on the console given by the ipset 
binary, or, the appropriate functionality should be implemented so that 
such test matches give the right result.

Neither of this currently happens - ipset accepts the ip range value and 
then outputs the wrong result (indicating that there is no match where 
it clearly is). So, what I have highlighted in my previous posts is, 
evidently, *not* a feature request, but a *bug fix*.

> There's no magical element-aggregation in the hash:* types. That is, even 
> if 10.1.0.0/16 is added as an element, 10.1.0.0/24 can be added again as 
> an independent element: either it should be rejected (when the command was 
> issued without the --exist flag) or silently ignored (when was issued with 
> it).
I am not very familiar with the inner intricacies of ipset (I am just a 
user at the end of the day), so I can't comment on whether this ip range 
match could (or should) be implemented, but the way ipset now works is 
wrong, unless you believe that the 10.1.12.0/24 ip range is not matched, 
in its entirety, by the 10.1.0.0/16 one. Not to mention that the above 
bug is a clear *regression* as the v4.x version of the ipset binary was 
able, for whatever reason , to produce matches - successfully - using ip 
ranges like the one I used as an example in my initial post.

> So even to consider your feature requests, it could come only after 
> implementing element-aggregation.
>   
Again, this is *not* a feature request - it is a bug fix and I think I 
already pointed out above why that is so.
