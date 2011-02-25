From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: ipset -R
Date: Fri, 25 Feb 2011 16:13:43 +0000
Message-ID: <4D67D537.2080009@googlemail.com>
References: <4D645BC7.7030306@googlemail.com> <alpine.DEB.2.00.1102232009001.16917@blackhole.kfki.hu> <4D659102.8090501@googlemail.com> <AANLkTi=06RAwFaiQzjiTMmJaoy+EgXSbq3UdOfonH4UQ@mail.gmail.com> <4D664C9F.3020701@googlemail.com> <alpine.DEB.2.00.1102250915200.20179@blackhole.kfki.hu> <4D67AE2C.3010902@googlemail.com> <alpine.DEB.2.00.1102251431210.20179@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=+cK6SmL3aCqcHP2U3O+4TyufwXkXGyd8+aJRUe2Dc2g=;
        b=H7LMQIXinFMH6AkmhDwLQVwA+oP4vvp6o+4DzCV1SPvLBUCxJ5n/b3kR869ISeWOfR
         P6yPP0ZLh2B9utlZ+Cg/rT6gudxsaFn0FDZCYlXg2ToqW7BeaGQ6Noq2Sd5viU7Ki8OO
         SB+3itGsOqxNWV8usSLSnly/IALdd5TrOGIW8=
In-Reply-To: <alpine.DEB.2.00.1102251431210.20179@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Pandu Poluan <pandu@poluan.info>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


>>> However with hash:net type
>>>
>>> # ipset -N test hash:net
>>> # ipset -A test 10.1.1.0/24
>>> # ipset -D test 10.1.1.12
>>> ipset v6.0: Element cannot be deleted from the set: it's not added
>>>   
>>>       
>> Well, that's plain wrong, isn't it? The 'element' 10.1.1.12 does exist and it
>> is added (albeit implicitly as part of 10.1.1.0/24). I also presume 'ipset -T
>> test 10.1.1.12' will return a positive result, so there is something which
>> isn't quite right.
>>     
>
> 10.1.1.12/32 is not an explicit member of the set above, therefore you 
> cannot delete it.
>   
Right, so the error message should probably say "Element cannot be 
deleted from the set: it's not *explicitly* added" as this makes it more 
clear as the element in question is clearly added, though implicitly, 
via the 10.1.1.0/24 route.

I know this might be interpreted as 'just semantics', but it would avoid 
any type of confusion and would have spared me the typing trying to ask 
for clarify as to what the above error message means.

> At testing elements, the host addresses are a special case and checked 
> from the kernel point of view. So *testing* 10.1.1.12 returns a true 
> value. The reason for the exception is that the kernel at matching, 
> deleting, adding entries works on host addresses and that way one can 
> check the kernel view of the set from userspace.
>   
I take it that was done differently in the same kernel modules for ipset 
4.x, right?

>>> The hash:*net* types could be extended to store non-matching elements,
>>> something like this:
>>>
>>> # ipset -N test hash:net
>>> # ipset -A test 10.1.1.0/24
>>> # ipset -A test 10.1.1.12 --nomatch
>>>
>>> That way overlapping entries with different "access right" could be stored
>>> in a single set. But any coding needs time and testing.
>>>   
>>>       
>> I am not sure I understand the above - is this already implemented (in 6.0?)
>> or is this on the 'drawing board' so to speak? What do you mean by 'access
>> right'?
>>     
>
> Not implemented, just thinking. If the feature were implemented then the 
> testing in the set would return false for 10.1.1.12 and true for every 
> other element from 10.1.1.0/24.
>   
Call be dumb, but I still fail to see what is the sense in implementing 
the above, or are you suggesting that the above would create a pinhole 
with the "--nomatch" option instead of deleting the element itself and 
therefore remove the need for a 'whitelist'?

> With first case you spare the iptables rules and the matchings in 
> "whitelist".
>   
And, presumably, improve performance, right?

>  
>   
>> If so, how is the blacklist-all set stored - do you copy all the elements of
>> all the sets into a separate memory space or do you just reference the set
>> (which means that if I alter, say, blacklist-2, the changes are
>> 'automatically' applied to blacklist-all as well)?
>>     
>
> No copying whatsoever: the member sets are referenced and pointed to. 
> Please note, you cannot delete the member sets, however you can swap them 
> anytime with another, same type of set.
>   
Please clarify - can I remove elements of a set, i.e. execute "ipset -D 
blacklist-2 <blacklist-2 member(s)>", if blacklist-2 is part (i.e. a 
member) of a list set called blacklist-all, or do you mean that I cannot 
remove blacklist-2 from blacklist-all once added?

>> I can't combine all elements of my blacklist-x sets into one big one because
>> 1) I use separate blacklist-x sets elsewhere in my ip chains; and 2) my
>> blacklist-x sets are not of the same type.
>>     
You didn't clarify this point - can I have different type sub-sets as 
part of a list set or do they have to be of the same type?

