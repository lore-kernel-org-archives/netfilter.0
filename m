From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: Re: [nftables] netdev rate limiting | timeouts rfq
Date: Mon, 28 Sep 2020 16:47:00 +0000
Message-ID: <1d252cae-37cc-f457-932c-2c1ada59e2a0@gmx.net>
References: <5c60c340-d6d8-1f7c-67da-2782360a92fe@gmx.net>
 <20200923083042.GB10267@salvia>
 <cd739cba-9f79-2669-b5cb-e504e851c49d@gmx.net>
 <20200928115210.GA21841@salvia>
 <f536fd2e-a9f2-730a-d2ae-0579ccb3b48d@gmx.net>
 <20200928122443.GA24572@salvia>
 <c9a8646f-69b6-7333-b7ed-74f3d9747665@gmx.net> <20200928154339.GA2605@salvia>
 <aca6a166-d5be-3d3c-536e-116f1aa65249@gmx.net> <20200928162307.GA3343@salvia>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1601311635;
        bh=g+abisbJCv/ZNrwWg0q7fk8ReQ1FKWhv3PWcfeKY7dM=;
        h=X-UI-Sender-Class:Reply-To:To:Cc:References:From:Subject:Date:
         In-Reply-To;
        b=WpAYwcMG1Y01MGdf0W9BKzpJC3Fb5RCMiUJxydAw7hLNOBPNhosoC8+Y1vct6j7Ja
         3cP26DnB7cuwNU439nNYRJz9Ynh7oHFztVa1+cPEfTGfeAaaioPFgiGNl26ZJu0Edx
         kSkhwqRJzjYOHXaPETWhuAtZSpXIadGXVIsUR6IU=
In-Reply-To: <20200928162307.GA3343@salvia>
Content-Language: en-GB
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org
Cc: Pablo Neira Ayuso <pablo@netfilter.org>


On 28/09/2020 18:23, Pablo Neira Ayuso wrote:
> On Mon, Sep 28, 2020 at 04:03:00PM +0000, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=
=E2=84=A0 wrote:
>> On 28/09/2020 17:43, Pablo Neira Ayuso wrote:
>>> On Mon, Sep 28, 2020 at 01:10:00PM +0000, =D1=BD=D2=89=E1=B6=AC=E1=B8=
=B3=E2=84=A0 wrote:
>>>> On 28/09/2020 14:24, Pablo Neira Ayuso wrote:
>>>>> On Mon, Sep 28, 2020 at 12:08:00PM +0000, =D1=BD=D2=89=E1=B6=AC=E1=B8=
=B3=E2=84=A0 wrote:
>>>>>> In the below example it does not print any logs and since that sta=
nza is
>>>>>> right prior drop I reckon that since the log printing does not hap=
pen the
>>>>>> frame dropping does neither.
>>>>>>
>>>>>> table inet filter {
>>>>> [...]
>>>>>>    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chain wan_pr {
>>>>>>    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ct state { new } update @glv4 { ip saddr limi=
t rate over
>>>>>> 15/day burst 3 packets } log prefix "glv4 DROP: " flags all drop
>>>>>>    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>> }
>>>>> ct state new is restricting to match only on the first packet of th=
e
>>>>> connection.
>>>> Right, it should be then rather something with ct count, like:
>>>>
>>>> ct state new update @glv4 { ip saddr ct count over 15 } log flags al=
l prefix
>>>> "glv4 DROP: " drop
>>>>
>>>> but that produces:
>>>>
>>>> Error: Could not process rule: Not supported
>>> What would you like to achieve in first place?
>>>
>>> This thread is starting to diverge from the original question.
>> It is still about (rate) limiting offending saddrs with sets, probably=
 in a
>> staged approach, say log and drop saddrs like
>>
>> * ct state update @glv4 { new , invalid } count over 50 timeout 1s
>> * ct state update @glv4 { new , invalid } count over 75 timeout 1h
>> * ct state update @glv4 { new , invalid } count over 150 timeout 1d
> Sorry I don't understand what you're trying to express with this
> syntax.

To get a flexible evaluation period for the count value:


* ct state { new , invalid } update @glv4 { ip saddr ct count over 50=C2=A0=
=20
timeout 1s } log flags all prefix "glv4 DROP: " drop

update set element for any saddr that exceeds the count of 50 within 1 s =

for ct state new | invalid


* ct state { new , invalid } update @glv4 { ip saddr ct count over 75=C2=A0=
=20
timeout 1s } log flags all prefix "glv4 DROP: " drop

update set element for any saddr that exceeds the count of 75 within 1 h =

for ct state new | invalid


* ct state { new , invalid } update @glv4 { ip saddr ct count over 75=C2=A0=
=20
timeout 1s } log flags all prefix "glv4 DROP: " drop

update set element for any saddr that exceeds the count of 150 within 1=20
d for ct state new | invalid




