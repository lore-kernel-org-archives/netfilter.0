From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: ipset v6.latest bugs?
Date: Mon, 25 Apr 2011 21:36:10 +0100
Message-ID: <4DB5DB3A.8000708@googlemail.com>
References: <4DB5614C.3040808@googlemail.com> <alpine.DEB.2.00.1104252144230.31185@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=7NSsiJA76j24RUW+1PqZQvmy1DjHQ7NQTKk+ybLb/cc=;
        b=MthPT7j+uGg4oze3CNLufZUhjs9+4kGk8K9/TqWACMSQUjV3LOi5XjaDvklSsOAsul
         I9BJPGVJN2OXoaf3IN3KJOc6SFJEzkPSv8MSDp7EfgZZfK+AyxsbP2+/J8HD0ehbf9YL
         XYseHqf7kUE4tHI6Mgpvnop5IJ7Qf1CRR6Gmo=
In-Reply-To: <alpine.DEB.2.00.1104252144230.31185@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


> It's a non-critical bug, I'll fix it this week.
>   
OK, thanks.

>> 2. There seems to be a huge memory leak - don't know whether this is as a
>> result of the error in 1 above. When I add elements to hash:ip set and then
>> clear the entire set, the "Size in memory" value of the set doubles every time
>> I do that (16512 initially, then 32896, 65664 ...). I have tried a similar
>> operation with hash:net set, but there is no memory leak there at all.
>>     
>
> No, there's no memory leak there: if you check the list of the elements 
> you can see that more and more elements could successfully be added to the 
> growing hash.
>   
Yeah, but the set is empty!

It is flushed, so why is it that after the set is cleared (and there are 
no elements in that set!), it still occupies 4 times as much memory it 
had initially with the same number of elements, i.e. zero? If this isn't 
a memory leak it is a very bad practice I would think.

I have just (tried) to add a single /14 net, what's going to happen if I 
add more, much more to it, and then flush the entire set? Would it be 
still occupying that amount of memory then?

>> 3. Don't know whether this is a bug, but thought to report it too - hash:net,
>> different to hash:ip set, seems unable to accept ip ranges
>> (10.4.0.0-10.7.255.255 in my example above) - I get an error every time I
>> attempt this operation. Could this behaviour be corrected and I am allowed to
>> specify ranges please?
>>     
>
> No, because what would be the network you'd want to add to the set then? 
>   
My understanding of hash:net is that it could have various subnets 
registered there; 10.0.4.0/14, 192.1.10.0/24 etc. So, instead of adding 
these by specifying the cidr addresses would it be possible to specify 
their ranges - "10.4.0.0-10.7.255.255" and "192.1.10.0-192.1.10.255" in 
this case? I indicated the reasons for this in my previous post.

> Every /24 in the given range? Or every /16? Or the set type should convert 
> the range to a network and add that to the set? And if that can't be 
> covered by one network, then add a combination of networks which cover the 
> range exactly?
>   
If there are "overlapping" cidr ranges, like with 10.0.0.0-10.0.0.9 
(which, in cidr terms, is "10.0.0.0/29" and "10.0.0.8/31") then 
obviously there will be two elements added - "10.0.0.0/29" and 
"10.0.0.8/31", so I do not understand where the problem is?

>> 4. The "old" format of iptreemap set is automatically converted to an hash:ip
>> set. Why? I think that is wrong, given that such a set could contain, in all
>> probability, more than 64k individual ip addresses and when that limit is
>> reached no elements could then be added.
>>     
>
> Hm, iptreemap should have been limited to 64k elements...
 From my understanding, iptree has this limitation. iptreemap is like 
"hash:net on steroids" :-) (if my understanding of hash:net is correct, 
of course) - I can register any subnet from any subnet range (this is 
the primary reason I use it for storing these, seemingly random, net 
ranges from the geoip database) - it is perfect for the job, save for 
the initial loading time, and its performance is also superb.

>  That was an 
> error on my part, that I forgot to limit that type.
>
> hash:ip type allows more than 64k elements, when defined with a 
> non-default "maxelem" parameter.
>   
So, for the number of disparate net ranges I pick from the geoip 
database (about 30k ranges, not single ip addresses!) what type of set 
should I choose then and can I also specify ip ranges instead of using 
the cidr ip address notation?

