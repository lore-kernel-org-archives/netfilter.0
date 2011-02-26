From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: ipset -R
Date: Sat, 26 Feb 2011 13:35:26 +0000
Message-ID: <4D69019E.7050703@googlemail.com>
References: <4D645BC7.7030306@googlemail.com> <alpine.DEB.2.00.1102232009001.16917@blackhole.kfki.hu> <4D659102.8090501@googlemail.com> <AANLkTi=06RAwFaiQzjiTMmJaoy+EgXSbq3UdOfonH4UQ@mail.gmail.com> <4D664C9F.3020701@googlemail.com> <alpine.DEB.2.00.1102250915200.20179@blackhole.kfki.hu> <4D67AE2C.3010902@googlemail.com> <alpine.DEB.2.00.1102251431210.20179@blackhole.kfki.hu> <4D67D537.2080009@googlemail.com> <alpine.DEB.2.00.1102252252290.21696@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=EpCTGVciUzzkfz//TBNWdyO0M+Or58jHo+RB96Cwk/w=;
        b=vK8UPye2nMki6OywyUhLMuaPCVUnjZAhjt7lF19vYWsITYyYQbNZ8mwARkx7XoTQ/L
         PUiYVNufwCHXcT5AF9dlfXIQxKzdlXDZzE17doEV6xAlMVg6dHd0f+4Qz7V/DLy8ZuvF
         EdUUjp+bi7NJ/GmNVxMS2DfG/qkvuHio4Yrjc=
In-Reply-To: <alpine.DEB.2.00.1102252252290.21696@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Pandu Poluan <pandu@poluan.info>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


>> Call be dumb, but I still fail to see what is the sense in implementing the
>> above, or are you suggesting that the above would create a pinhole with the
>> "--nomatch" option instead of deleting the element itself and therefore remove
>> the need for a 'whitelist'?
>>     
>
> Yes, that is what I'm thinking. One could just punch holes into networks, 
> even stacked, i.e.
>
> ipset -A test 10.1.1.0/24
> ipset -A test 10.1.1.64/26 --nomatch
> ipset -A test 10.1.1.80/28
>
> would mean a match for the elements in the inclusive ranges
> 10.1.1.0-10.1.1.63,10.1.1.80-10.1.1.95,10.1.1.128-10.1.1.255
>   
I see! Yes, I think that is a very good idea (you could also introduce a 
separate ipset option to only list '--nomatch' elements, something like 
'ipset -L --nomatch test' for example), though I have to admit I am 
coming round to the idea of using my whitelist as a separate set - I 
think this is a much cleaner solution and it also gives me a greater 
deal of flexibility as I can easily see the whitelist members and employ 
them freely anywhere in the ip chains.

>> Please clarify - can I remove elements of a set, i.e. execute "ipset -D
>> blacklist-2 <blacklist-2 member(s)>", if blacklist-2 is part (i.e. a member)
>> of a list set called blacklist-all, or do you mean that I cannot remove
>> blacklist-2 from blacklist-all once added?
>>     
>
> You can add, delete, even flush the entries from a member set, that's not 
> problem. But it's not possible to delete the set while it's the member of 
> another set.
>   
Makes perfect sense. I also take it since the subsets are referenced as 
soon as a particular subset is changed that change is 'automatically' 
applied to every list set this subset belongs to, right?

> Yes, you can have different types as subsets, even different dimensions of 
> set types. But the dimension of the matching plays an important role: lets 
> assume you have got the following sets
>
> ipset create a hash:ip,port,ip
> ipset create b hash:ip,port
> ipset create c hash:ip
> ipset create d list:set
> ispet add d a
> ipset add d b
> ipset add d c
>
> then when called from the rule
>
> -m set --match-set d dst,dst
>
> then the first subset "a" is always skipped, because the matching 
> dimension is smaller than the dimension of the set.
>
> However if you have got the rule
>
> -m set --match-set d dst,dst,src
>
> then all subsets are tried in order until a match is found.
>   
That's brilliant - I avoided using list sets as, to be honest, I was 
unclear as to how the matching is performed (particularly with different 
subset types), but the above clarifies matters for me completely.

Have you considered using the subsets in a given list set as a 
mathematical entities and applying the usual (mathematical) set 
operations (like intersection, union, complement etc)? Currently, you 
are applying a union of all subsets when they are registered in a list 
set, but this could be expanded as I see the list set as a potentially 
very powerful tool.

For example I could define the whitelist as a set and then register it 
together with all of my blacklist-x in a new list set and then say 
'apply (blacklist-1 + blacklist-2 + ... blacklist-x) - whitelist' (in 
other words, build a union of all blacklist-x subsets and then subtract 
the whitelist subset from that resulting union). I don't know how easy 
this would be to implement though!
