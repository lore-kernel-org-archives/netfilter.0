From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: Re: [nftables 0.9.2] does jump require a kconf to be set to get it
 working?
Date: Thu, 13 Feb 2020 11:41:11 +0000
Message-ID: <a27d6244-60a5-7b32-fcd9-bb0364f69224@gmx.net>
References: <a581ac40-f8ad-c009-4c83-40f1833b6ddb@gmx.net>
 <c81185d7-ff7c-9df7-c61d-29ed7c541e31@plushkava.net>
 <c88a5ed6-abcf-3318-363c-2e187d4bf533@gmx.net>
 <82365710-b3eb-e738-a181-9b18219cbbfe@plushkava.net>
 <452a8200-536c-4457-d6b5-4591c7781e48@gmx.net>
 <7cd325dd-e028-9b98-9b15-ddfdad3845bf@plushkava.net>
 <17defc0c-6d30-f098-99ca-7594cc63071d@gmx.net>
 <da48838e-d67d-13a0-c349-b51ca3c050a7@plushkava.net>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1581594074;
        bh=IsjPfuZvTooAssIHTPBZXgOdJ5zBakR0Pe+hs5d8W90=;
        h=X-UI-Sender-Class:Reply-To:Subject:To:References:From:Date:
         In-Reply-To;
        b=UZAU+zI33IzTr8xzG5OaVxCvMawMyF5R98NLpOqBlvJmYe1GLCpIqWS1cJZOAtw6H
         nmw7RshB5WPEosmTU8mRAso442Ec/8pdMpRgtAvBGBfHfFLdH6NxjF1YMSDcDCg5O2
         oho5N4U/rV9N5XvkMBdfZ9U+AUsfd/3u+3slFIEw=
In-Reply-To: <da48838e-d67d-13a0-c349-b51ca3c050a7@plushkava.net>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: kfm@plushkava.net, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


On 12/02/2020 20:57, kfm@plushkava.net wrote:
> On 12/02/2020 19:51, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 wrote:
>>
>> On 12/02/2020 19:44, kfm@plushkava.net wrote:
>>> On 12/02/2020 19:21, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 wrote:
>>>>
>>>> On 12/02/2020 19:01, kfm@plushkava.net wrote:
>>>>> On 12/02/2020 18:52, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 wrote:=

>>>>>>
>>>>>> On 12/02/2020 18:40, kfm@plushkava.net wrote:
>>>>>>> On 12/02/2020 16:41, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 wrot=
e:
>>>>>>>> Have tried to some online guidance which NFT features require=20
>>>>>>>> which kernel config to be set to get them working and whether=20
>>>>>>>> jump is among such feature set.
>>>>>>>>
>>>>>>>> Because hitting:
>>>>>>>>
>>>>>>>> Error: Could not process rule: Not supported
>>>>>>>>
>>>>>>>> with:
>>>>>>>>
>>>>>>>> table inet filter=C2=A0 {
>>>>>>>> =C2=A0=C2=A0chain input=C2=A0 { type filter hook input priority =
0; iifname=20
>>>>>>>> pppoe-wan jump wan_i }
>>>>>>>> }
>>>>>>>
>>>>>>> As shown, this isn't quite valid nft syntax. Please post a=20
>>>>>>> minimal - but complete - ruleset that reproduces your issue in a =

>>>>>>> form that is verbatim. Include the wan_i definition, even if it=20
>>>>>>> merely an empty chain.
>>>>>>
>>>>>> table inet filter {
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 chain input { type filter hook input prio=
rity 0; iifname=20
>>>>>> pppoe-wan jump wan_i; }
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 chain wan_i=C2=A0 { type filter hook inpu=
t priority 0; }
>>>>>> }
>>>>>>
>>>>>
>>>>> You may not jump to the wan_i chain because it is hooked. It makes =

>>>>> as little sense as trying to run iptables -I INPUT -j INPUT.
>>>>>
>>>>
>>>> So jump and goto are only good with non-base chains and those can=20
>>>> only be utilised for:
>>>>
>>>> =C2=A0=C2=A0* nft_immediate: loads an immediate value into a registe=
r.
>>>> =C2=A0=C2=A0* nft_cmp: compare a given data with data from a given r=
egister.
>>>> =C2=A0=C2=A0* nft_payload: set/get arbitrary data from packet header=
s.
>>>> =C2=A0=C2=A0* nft_bitwise: perform bit-wise math operations over dat=
a in a given
>>>> =C2=A0=C2=A0=C2=A0 register.
>>>> =C2=A0=C2=A0* nft_byteorder: perform byte order operations over data=
 in a given
>>>> =C2=A0=C2=A0=C2=A0 register.
>>>> =C2=A0=C2=A0* nft_counter: a basic counter for packet/bytes that get=
s=20
>>>> incremented
>>>> =C2=A0=C2=A0=C2=A0 everything is evaluated for a packet.
>>>> =C2=A0=C2=A0* nft_meta: set/get packet meta information, such as rel=
ated
>>>> =C2=A0=C2=A0=C2=A0 interfaces, timestamps, etc.
>>>> =C2=A0=C2=A0* nft_lookup: search for data from a given register (key=
) into a
>>>> =C2=A0=C2=A0=C2=A0 dataset. If the set is a map/dictionary, returns =
the value for=20
>>>> that key.
>>>>
>>>>
>>>> then, that correct? I had hoped that I could organise the chain=20
>>>> structure for processing into something like WAN, LAN and WAN<>LAN.
>>>
>>> The obvious solution is to remove the hook from the wan_i chain.=20
>>> There is no apparent reason for it to have one. Also, you may find=20
>>> it useful to jump from your input chain to others by way of a=20
>>> verdict map.
>>
>> If the hook is removed then packages are not processed in the chain,=20
>> e.g.
>
> I do not understand what is meant by "not processed". If the packet is =

> directed to the wan_i chain, then it will be processed there.
>
>>
>> table inet filter {
>> =C2=A0=C2=A0=C2=A0=C2=A0 chain input=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 { type filter hook input priori=
ty 0;=20
>> iifname pppoe-wan jump wan_i; }
>> =C2=A0=C2=A0=C2=A0=C2=A0 chain wan_i=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 { policy drop; ct state 1 drop;=
 ct=20
>> state 2,4 accept; }
>> }
>>
>> which does not help with organising chains in the sense/way I had=20
>> mind. Looks like it requires a more circuitous route with=20
>> more/different tables and negating interfaces (iif =3D ! | oik =3D !) =
for=20
>> each such table.
>>
> Consider the following ruleset as a possible foundation (formatted to=20
> be somewhat post-friendly).
>
> table ip filter {
> =C2=A0 chain input {
> =C2=A0=C2=A0=C2=A0 type filter hook input priority 0; policy drop;
> =C2=A0=C2=A0=C2=A0 ct state vmap {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 established : accept,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 related=C2=A0=C2=A0=C2=A0=C2=A0 : accept=
,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 invalid=C2=A0=C2=A0=C2=A0=C2=A0 : drop,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 untracked=C2=A0=C2=A0 : drop }
> =C2=A0=C2=A0=C2=A0 # At this point, the packet can only have a ct state=
 of new
> =C2=A0=C2=A0=C2=A0 iifname vmap {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "lo"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 : accept,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ppoe-wan" : jump wan_i,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "eth0-lan" : jump lan_i }
> =C2=A0 }
> =C2=A0 chain wan_i {
> =C2=A0=C2=A0=C2=A0 tcp dport 22 accept
> =C2=A0 }
> =C2=A0 chain lan_i {
> =C2=A0=C2=A0=C2=A0 accept
> =C2=A0 }
> }
>
> Here, you accept whatever you intend to accept in the wan_i and lan_i=20
> chains. If the packet isn't accepted then it will return to the input=20
> chain and fall through to its drop policy.
>
> There are nuances that could stand to be altered. For example, you=20
> might want to accept lo up front, rather than subject it to the=20
> ravages of connection tracking, and ICMP isn't dealt with in any=20
> capacity, which would become pertinent in an inet table.
>
> Still, from a basic structural standpoint, it's not clear to me why=20
> your ruleset would need to be markedly more circuitous than this.
>
> --=20
> Kerin Millar

The current kernel deployed, which kconf is beyond my control, is=20
missing the flag to support sets and thus vmap. But that aside something =

like this seems to work

table inet filter {
 =C2=A0=C2=A0=C2=A0 chain input=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 { type filter hook input priority 0;=20
policy drop; iifname pppoe-wan jump wan_i; }
 =C2=A0=C2=A0=C2=A0 chain wan_i=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 { ip saddr 0.0.0.0/32 udp sport 67 ip=20
daddr 255.255.255.255/32 udp dport 68 accept; }
}



