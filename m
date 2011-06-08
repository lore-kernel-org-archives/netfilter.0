From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: ipset 6.6 bug: subnet (mis)matching
Date: Wed, 08 Jun 2011 12:21:31 +0100
Message-ID: <4DEF5B3B.3050609@googlemail.com>
References: <alpine.DEB.2.00.1105241039080.1846@blackhole.kfki.hu> <4DEECD8C.6050302@googlemail.com> <alpine.DEB.2.00.1106080859230.31443@blackhole.kfki.hu> <4DEF49FE.4080708@googlemail.com> <alpine.DEB.2.00.1106081214130.31592@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=xKi2M1v59KB4z7N2f6FndgrVsjKb6DwKZmrjxw5XdV4=;
        b=sjNs5dVIpG+JZMFkJAS0wYxk9ku1pyJLs4q01oEzCXrd6k9G9fy6L3rF4EkUWTE3Mr
         Ci7rpvR5f2cCXkzLhzOx0FNKVGfdiPulTnOrDZSDe1EK4ssWQB9wEpHukPFsjKehsd+S
         K8AoLRrdGtfJChMPUug1yEE4dr9i+DGIt7UEc=
In-Reply-To: <alpine.DEB.2.00.1106081214130.31592@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>


> I can only repeat myself: for the hash:*net* types the testing with a host 
> address is special and handled as the kernel would test an IP address.
> However network addresses are handled as a whole and overlapping is *not* 
> checked. It's documented in the manpage.
>   
I can understand that to a point as far as adding/deleting 
elements/subranges goes - it makes sense. Testing, however, is a 
different story.

> Maybe an example helps: when you add 10.6.0.0/16, you add an "apple". You 
> can also add 10.6.0.0/24, a "pear". Nothing prevents you, both can be the 
> member of the set, because overlapping is not handled. At deleting, 
> testing they are handled as "apple" and "pear", too. If "pear" is not 
> added to the set, it's not "in" the set as a member - even if we know, 
> that the elements of "apple" fully cover the elements of "pear". However 
> at testing 10.16.224.1[/32] you test a "seed", which is checked inside 
> "apple".
>   
Your basic presumption above is wrong - 10.16.224.1 *is* a member - i.e. 
it belongs, in network terms at least - to both 10.16.0.0/16 and 
10.16.224.0/24 ranges. Similarly, 10.16.224.0/24 also belongs to 
10.16.0.0/16 in the same way that 10.16.224.1 does to 10.16.224.0/24 and 
10.16.0.0/16.

10.16.224.1 is a member of the 10.16.224.0/24 "set", which, in turn, is 
also a member of 10.16.0.0/16 "set" (in mathematical as well as in 
networking terms). They are both in a way "subsets". Any tests for 
matching a subset belonging to a bigger set should return positive 
results. In the case of ipset they don't and that is my point.

There are no "apples" and "oranges" compared here as both ranges belong 
to each other, so they are not different from each other, apart from the 
fact that one set is bigger than the other. Basic grasp of maths would 
tell you all that.

> Merging with already existing elements (or breaking up if a network from a 
> larger network were deleted) would be very expensive. I know, you compare 
> the types to iptreemap, but iptreemap was a very special case where 
> merging/breaking up was a natural process and costed almost nothing.
>   
No, I don't make comparisons with iptreemap at all - there is no 
iptreemap set type involvement here, so there is no need for me to 
mention that type of set.

My basic (and only!) issue is that subnet ranges testing should either 
be implemented properly or not tested at all. The way I see it, that is 
not the case and I pointed out above why I think that is.

>> That's all well and good for hosts, but ip ranges should either be tested
>> properly or testing of those should be disabled altogether (which, if
>> introduced, would be a severe restriction for me - I am not going to run a
>> couple of thousand "ipset t" tests just to see that all of the single IP
>> addresses in the range I am interested in match - that simply isn't going to
>> happen!).
>>     
>
> I don't quite follow you here:
OK, if I have 10.16.0.0/16 as a member and then test a subnet range 
which is covered by the /16 address - again, lets say 10.16.1.0/24 - I 
expect to get a match as clearly, from both mathematical as well as 
networking terms, all "members" of 10.16.1.0/24 are also "members" of 
10.16.0.0/16, so the test result should return a positive. It doesn't!

I can understand a negative result if I test the other way around - not 
all "members" of 10.16.0.0/16 would belong to 10.16.1.0/24 and returning 
a negative test result in this instance is OK.

It doesn't work like that in ipset though - ipset seems to be operating 
either on "exact match" (say if I have 10.16.0.0/16 as a member and test 
with 10.16.0.0/16) or when a single ip address is tested, which I don't 
think is right and that was my point all along.
