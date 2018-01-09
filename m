From: Mauro Santos <registo.mailling@gmail.com>
Subject: Re: Using dynamic IP lists to block forwarding
Date: Tue, 9 Jan 2018 16:59:28 +0000
Message-ID: <699a50b3-5279-1275-c985-9448969d6b8e@gmail.com>
References: <57cdc69a-1be8-d117-61a9-0de376f54152@osbourne.uk.eu.org>
 <20180109095832.qhetdvawgkzb2gak@Redstar.dorchain.net>
 <a2194be6-ac9a-5631-7e55-def8cb240b45@osbourne.uk.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=Qhvi1ebWpVCO2wVviTGYE+WFyWp7/V9vDbqi3aq9gJA=;
        b=LcYVOQkfnn1DwM+OCkSG1QIVsfwL05e8eYODycgBZSEiFlZgaQ10fUXeSSVnWkk8u7
         mhbMqF8LAR04bINr22HuRfi2aZClA0XS4fT7ZneqixSROVQ7A0qDacSyJbM1545bgQXA
         0ralerv4rgwAsX7IGxUgzz/k2Ug8c/8Q+E1Xfy+0UxCKLI5NwGauC3Ym7GcV8ulp28sz
         09WHNer7LO6j2xNCioywB7yqpqNtVEMo6VDfIV/3e9BmhdFEg9QGH6AWWf8q+fwsc15E
         izApN/EU1MVHbHUma4tpM/kdTvkpS3uvC9iEgD58XuC7MsSutuH8ozVnUIOsMrpXK/KR
         /LlA==
In-Reply-To: <a2194be6-ac9a-5631-7e55-def8cb240b45@osbourne.uk.eu.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Dave Osbourne <dave@osbourne.uk.eu.org>, netfilter@vger.kernel.org

On 09-01-2018 16:24, Dave Osbourne wrote:
>=20
>=20
> On 2018-01-09 09:58, Joerg Dorchain wrote:
>> On Tue, Jan 09, 2018 at 09:28:26AM +0000, Dave Osbourne wrote:
>>> 1. The list might be incorrect and legit requests will be blocked, the
>>> =A0=A0=A0 list will have to regularly derived (there might be a source =
who
>>> knows)
>>> 2. "bad" IPs might be on that list and allowed
>>>
>>>
>>> My response is to implement a dynamic block list (say)
>>> http://iplists.firehol.org/?ipset=3Dblocklist_net_ua - using iptables
>>> on (say)
>>> Debian.=A0 I've looked at an hour of probe data and it seems that that
>>> /*specific */list would have blocked 97+% of known bad probe attempts
>>> (and
>>> the list is updated regularly).
>>>
>>> I hope someone might be able to provide argument for / against... or
>>> share
>>> an alternative...
>> I have been doing this for a while, but now have found that ipset
>> fit in very well here.
>> - Adding and removing ips from a set is easier than fiddling with
>> =A0=A0 iptables syntax.
>> - The timeout feature comes in very handy.
>> - Basically the iptables rules can be static.
>>
>> Bye,
>>
>> Joerg
>=20
> Ah - I looked at that (ipset) - didn't even know it existed...!!
>=20
> I'm getting a lot of resistance from our outsourced IT supplier on
> this...=A0 the excuses are variously:
>=20
> * block based on SRCIP being in <insert unfriendly state here> or
> * why don't you migrate to Office365 or
> * don't worry if you patch regularly and have a good passwd policy then
> just let the traffic come
>=20
> all completely pointless given the constrains and facts of the case.
>=20
> Does *anyone* have some kind of a reference or best practice for this,
> or their own motivation even?
>=20
> I feel the resistance I'm getting (not from the list) is through a lack
> of awareness by IT professionals...=A0 this seems like such an obvious
> thing to do, yet 3 IT support companies I've spoken to don't seem keen....
>=20

The only experience with something simpler (trying to reduce the number
of ssh bruteforce attempts) is allowing only IPs from $MYCOUNTRY. Your
concern about the list of IPs not being correct is a valid one but I've
never had problems or complaints (machines have only a few users though)
when using the lists from here:

ftp://ftp.ripe.net/pub/stats/ripencc/

The files there are updated daily. You'll have to massage the file first
to get a range of IPs you can use.

That said your idea sounds good and if it could help catch the few
corner cases the static lists (firehol + ripe) don't catch I don't see
why not use it (maybe false positives concern?).

> Dave
>=20
>=20
> --=20
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at=A0 http://vger.kernel.org/majordomo-info.html
>=20


--=20
Mauro Santos
