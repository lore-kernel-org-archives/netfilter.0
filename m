From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: Re: [nftables] netdev rate limiting | timeouts rfq
Date: Mon, 28 Sep 2020 18:15:00 +0000
Message-ID: <23c4b835-489c-2f0e-46a1-f86ad50add8c@gmx.net>
References: <20200928115210.GA21841@salvia>
 <f536fd2e-a9f2-730a-d2ae-0579ccb3b48d@gmx.net>
 <20200928122443.GA24572@salvia>
 <c9a8646f-69b6-7333-b7ed-74f3d9747665@gmx.net> <20200928154339.GA2605@salvia>
 <aca6a166-d5be-3d3c-536e-116f1aa65249@gmx.net> <20200928162307.GA3343@salvia>
 <1d252cae-37cc-f457-932c-2c1ada59e2a0@gmx.net> <20200928170136.GA4278@salvia>
 <0989cfd6-7966-d1eb-8103-b9d6902b40c0@gmx.net>
 <20200928175611.GA23901@salvia>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1601316908;
        bh=b350lEmuGdaAu+5uKC5pYCNCzj7l+auPSNI3Ls0/umE=;
        h=X-UI-Sender-Class:Reply-To:To:Cc:References:From:Subject:Date:
         In-Reply-To;
        b=XGtAj8IMDnjqrBjild0JdYApL+ACTDnP/UKZcc//L176hABu61wtFKStOd5mLKsUT
         znYEHL7tNhaUIQuHax5cHcKyeVQRiIAJ0lQFVqI/MpHjRZv7He/aPqDkYhTM0MKmhM
         ZB+UCYGSMWAlKSupIr9u8LvNhMN+cafkpeFh1198=
In-Reply-To: <20200928175611.GA23901@salvia>
Content-Language: en-GB
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org
Cc: Pablo Neira Ayuso <pablo@netfilter.org>


On 28/09/2020 19:56, Pablo Neira Ayuso wrote:
> On Mon, Sep 28, 2020 at 05:38:00PM +0000, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=
=E2=84=A0 wrote:
>> On 28/09/2020 19:01, Pablo Neira Ayuso wrote:
>>> On Mon, Sep 28, 2020 at 04:47:00PM +0000, =D1=BD=D2=89=E1=B6=AC=E1=B8=
=B3=E2=84=A0 wrote:
>>>> To get a flexible evaluation period for the count value:
>>>>
>>>> * ct state { new , invalid } update @glv4 { ip saddr ct count over 5=
0
>>>> timeout 1s } log flags all prefix "glv4 DROP: " drop
>>>>
>>>> update set element for any saddr that exceeds the count of 50 within=
 1 s for
>>>> ct state new | invalid
>>>>
>>>>
>>>> * ct state { new , invalid } update @glv4 { ip saddr ct count over 7=
5
>>>> timeout 1s } log flags all prefix "glv4 DROP: " drop
>>>>
>>>> update set element for any saddr that exceeds the count of 75 within=
 1 h for
>>>> ct state new | invalid
>>>>
>>>>
>>>> * ct state { new , invalid } update @glv4 { ip saddr ct count over 7=
5
>>>> timeout 1s } log flags all prefix "glv4 DROP: " drop
>>>>
>>>> update set element for any saddr that exceeds the count of 150 withi=
n 1 d
>>>> for ct state new | invalid
>>> Thanks, these are looking better, although still not correct.
>>>
>>> Two issues:
>>>
>>> * 'ct count' relies on the connection tracking table. This is countin=
g
>>>     the number of existing connections in this table according to you=
r
>>>     key, ie. ip saddr. You do not have to specify timeouts here becau=
se
>>>     it is the connection tracking time that governs when the conntrac=
k
>>>     entries expire.
>> suppose those are stipulated in net.netfilter.nf_conntrack_[proto]_tim=
eout ?
>>
>> This is a bit inflexible though, an offender might not probe within su=
ch
>> conntrack stipulated timeout but say in infrequent intervals, one woul=
d have
>> to stipulate a count of 1 to catch such saddr at any given time (connt=
rack
>> timeout), which would be fine for ct state new but could lead to some =
false
>> positive with ct state invalid.
>>
>> Moreover, if not specifying a timeout for the set then how is the sadd=
r
>> element going to be removed ever? As far as I comprehend there are two=

>> parameters (whichever yields first) for elements being purged (save fo=
r
>> manual purging)=C2=A0 from a set:
>>
>> * size - if exceeded oldest elements being purged first
>>
>> or
>>
>> * timeout - if counted down to zero element being purged.
>>
>> With no timeout in the set elements may live forever, which is not rea=
lly
>> wanted for a dynamic sort of set.
> That's not how it works: ct count implements a garbage collector to
> purge old list of connections whose key is ip saddr.
>
> http://workshop.netfilter.org/2018/wiki/images/2/23/Connlimit.pdf
>
> The connection tracking table entries are released once they expire.
> Connection in TIME_WAIT and CLOSE state are already assumed to be
> close, hence not being counted.

How is that in less abstract (sort of layman) terms?

nft_connlimit stores conntrack objects from the conntrack table and once =

those objects expire in the conntrack table said garbage collector is=20
retiring elements from the set?

With 'gc-interval'=C2=A0 one could then exercise some sort of control ove=
r=20
the element's lifespan in the ct state set?


>
>>> * You have to use 'add' instead of 'update'. Update makes sense to
>>>     refresh timeouts when they are in place, but there is no timeouts=
 in
>>>     this case.
>>>
>>> Therefore, make sure you define the dynamic set with not timeouts at
>>> all when combining this with ct count.
>>>
>>> Using 'update' in your rule with ct count and/or 'timeout' in your se=
t
>>> definition will make you hit "Operation not supported".
>> Having the set then as:
>>
>>  =C2=A0 set glv4 {
>>  =C2=A0=C2=A0=C2=A0 type ipv4_addr
>>  =C2=A0=C2=A0=C2=A0 size 65535
>>  =C2=A0=C2=A0=C2=A0 flags dynamic
>>  =C2=A0=C2=A0=C2=A0 counter
>>  =C2=A0 }
>>
>> and the rule in pre-routing chain
>>
>> ct state new add @glv4 { ip saddr ct count over 25 }
>>
>> and still been hitting:
>>
>>  =C2=A0Error: Could not process rule: Not supported
>>
>> until removed 'counter' from the set, then reading
>>
>>  =C2=A0 set glv4 {
>>  =C2=A0=C2=A0=C2=A0 type ipv4_addr
>>  =C2=A0=C2=A0=C2=A0 size 65535
>>  =C2=A0=C2=A0=C2=A0 flags dynamic
>>  =C2=A0 }
> The counter is a stateful expression and ct count is also a stateful
> expression too.
>
> You can only use one single stateful expression per set set element at
> this stage.

That is curious/confusing (me) because adding 'counter' to the rule does =

not throw an error:

ct state new add @glv4 { ip saddr ct count over 25 } counter





