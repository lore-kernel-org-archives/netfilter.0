From: Pandu Poluan <pandu@poluan.info>
Subject: Re: ipset -R
Date: Thu, 24 Feb 2011 12:16:33 +0700
Message-ID: <AANLkTinRdR7D963JindQOdfYBF=uJr7F24WZmo=ATeL4@mail.gmail.com>
References: <4D645BC7.7030306@googlemail.com>
	<alpine.DEB.2.00.1102232009001.16917@blackhole.kfki.hu>
	<4D659102.8090501@googlemail.com>
	<AANLkTi=06RAwFaiQzjiTMmJaoy+EgXSbq3UdOfonH4UQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=06RAwFaiQzjiTMmJaoy+EgXSbq3UdOfonH4UQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Okay, the 2nd rule should be:

-m set --match-set $WHITELIST -j $WHITELIST_HANDLING_CHAIN

but I think you'd get my drift.

Rgds,


On 2011-02-24, Pandu Poluan <pandu@poluan.info> wrote:
> What if:
>
> -m set ! --match-set $WHITELIST src -m set --match-set $BLACKLIST src -j
> DROP
>
> The first -m set (with the "!") punches 'holes' into the 2nd. You can
> follow up with
>
> -m set --match-set $WHITELIST src -j ACCEPT
>
> Rgds,
>
>
> On 2011-02-24, Mr Dash Four <mr.dash.four@googlemail.com> wrote:
>>
>>> The iptreemap type of ipset 4.x had the feature you are referring here.
>>>
>>> The iptree and iptreemap types are not implemented in ipset 5.x. However
>>> you can achieve the same effect by using two sets, the first one for the
>>> pinholes and the second one for the networks.
>>>
>> It would be a bit cumbersome to achieve that.
>>
>> I use the geoip database to construct, among other things, a permanent
>> block lists (mainly based on country of origin, but there are other
>> factors which I won't go in here) and these sets are only present in my
>> block chains (there is also a bit of logic involved, but that is another
>> set of issues altogether). I also have a separate list with host ip
>> addresses/ranges (my 'whitelist' so to speak) against which I
>> subsequently execute the delete statements to create the pinholes
>> (another useful ipset feature is that it silently ignores delete
>> requests if the ip address/range is not present in the set).
>>
>> As you know the geoip database regularly changes (so does, albeit
>> occasionally, the country of origin of various ip address ranges), so I
>> normally execute an automated set of scripts to update the database,
>> pick the right address ranges for blocking, construct-and-replace my
>> ipsets in the 3 or so blocking chains I have on the main firewall and
>> then apply the deletion statements to the same sets to create the
>> pinholes.
>>
>> The problem I see with your approach above is that I would have to
>> explicitly grant some sort of access to my 'whitelist' addresses (those
>> with which I create the pinholes), which isn't possible as I do not know
>> which ports (or port ranges) would need to be enabled - that depends on
>> various factors which I cannot always control. Besides, I would like the
>> 'whitelist' addresses to be traversed further down the ip chain as there
>> may be other rules which catch them. In other words, I cannot explicitly
>> allow access to the whitelist addresses as you are suggesting above (so
>> is my understanding).
>>
>> The ideal scenario, as I pointed out above, would be to use the
>> whitelist to create the pinholes (i.e. execute a deletion against
>> already registered sets) without explicitly allowing access to those ip
>> addresses/ranges.
>>
>> Another pretty good alternative would be (if I am, somehow, able) to
>> 'subtract' my whitelist members from the blacklisted ones and then use
>> the resulting set (or sets), but as far as I know I can't do that in
>> ipset, can I?
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>
>
> --
> --
> Pandu E Poluan - IT Optimizer
> My website: http://pandu.poluan.info/
>


-- 
--
Pandu E Poluan - IT Optimizer
My website: http://pandu.poluan.info/
