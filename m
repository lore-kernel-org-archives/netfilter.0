From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: Re: [nftables 0.9.2] does jump require a kconf to be set to get it
 working?
Date: Wed, 12 Feb 2020 19:51:37 +0000
Message-ID: <17defc0c-6d30-f098-99ca-7594cc63071d@gmx.net>
References: <a581ac40-f8ad-c009-4c83-40f1833b6ddb@gmx.net>
 <c81185d7-ff7c-9df7-c61d-29ed7c541e31@plushkava.net>
 <c88a5ed6-abcf-3318-363c-2e187d4bf533@gmx.net>
 <82365710-b3eb-e738-a181-9b18219cbbfe@plushkava.net>
 <452a8200-536c-4457-d6b5-4591c7781e48@gmx.net>
 <7cd325dd-e028-9b98-9b15-ddfdad3845bf@plushkava.net>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1581537098;
        bh=nVvYGH9HL8x1o1CWh0piHBVdwATRk5taOA/puykNqA8=;
        h=X-UI-Sender-Class:Reply-To:Subject:To:References:From:Date:
         In-Reply-To;
        b=VkKLam0aGQWpeNRdebsfHtgwyuTUJmqGy6NhiL3yRq6U8E/13HeKghBcAjIGX2CPd
         0+AHeRfMOmbNFC7CVO9p6abxo86NiZQLr5XUa8Azv08rBZFjB93DOqMknmljHWM/mZ
         Y4xtS0VnXpJR4W3QcWy87Yi4f2K7Mu020EtOcF9M=
In-Reply-To: <7cd325dd-e028-9b98-9b15-ddfdad3845bf@plushkava.net>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: kfm@plushkava.net, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


On 12/02/2020 19:44, kfm@plushkava.net wrote:
> On 12/02/2020 19:21, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 wrote:
>>
>> On 12/02/2020 19:01, kfm@plushkava.net wrote:
>>> On 12/02/2020 18:52, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 wrote:
>>>>
>>>> On 12/02/2020 18:40, kfm@plushkava.net wrote:
>>>>> On 12/02/2020 16:41, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 wrote:=

>>>>>> Have tried to some online guidance which NFT features require=20
>>>>>> which kernel config to be set to get them working and whether=20
>>>>>> jump is among such feature set.
>>>>>>
>>>>>> Because hitting:
>>>>>>
>>>>>> Error: Could not process rule: Not supported
>>>>>>
>>>>>> with:
>>>>>>
>>>>>> table inet filter=C2=A0 {
>>>>>> =C2=A0=C2=A0chain input=C2=A0 { type filter hook input priority 0;=
 iifname=20
>>>>>> pppoe-wan jump wan_i }
>>>>>> }
>>>>>
>>>>> As shown, this isn't quite valid nft syntax. Please post a minimal =

>>>>> - but complete - ruleset that reproduces your issue in a form that =

>>>>> is verbatim. Include the wan_i definition, even if it merely an=20
>>>>> empty chain.
>>>>
>>>> table inet filter {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 chain input { type filter hook input priori=
ty 0; iifname=20
>>>> pppoe-wan jump wan_i; }
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 chain wan_i=C2=A0 { type filter hook input =
priority 0; }
>>>> }
>>>>
>>>
>>> You may not jump to the wan_i chain because it is hooked. It makes=20
>>> as little sense as trying to run iptables -I INPUT -j INPUT.
>>>
>>
>> So jump and goto are only good with non-base chains and those can=20
>> only be utilised for:
>>
>> =C2=A0=C2=A0* nft_immediate: loads an immediate value into a register.=

>> =C2=A0=C2=A0* nft_cmp: compare a given data with data from a given reg=
ister.
>> =C2=A0=C2=A0* nft_payload: set/get arbitrary data from packet headers.=

>> =C2=A0=C2=A0* nft_bitwise: perform bit-wise math operations over data =
in a given
>> =C2=A0=C2=A0=C2=A0 register.
>> =C2=A0=C2=A0* nft_byteorder: perform byte order operations over data i=
n a given
>> =C2=A0=C2=A0=C2=A0 register.
>> =C2=A0=C2=A0* nft_counter: a basic counter for packet/bytes that gets =
incremented
>> =C2=A0=C2=A0=C2=A0 everything is evaluated for a packet.
>> =C2=A0=C2=A0* nft_meta: set/get packet meta information, such as relat=
ed
>> =C2=A0=C2=A0=C2=A0 interfaces, timestamps, etc.
>> =C2=A0=C2=A0* nft_lookup: search for data from a given register (key) =
into a
>> =C2=A0=C2=A0=C2=A0 dataset. If the set is a map/dictionary, returns th=
e value for=20
>> that key.
>>
>>
>> then, that correct? I had hoped that I could organise the chain=20
>> structure for processing into something like WAN, LAN and WAN<>LAN.
>
> The obvious solution is to remove the hook from the wan_i chain. There =

> is no apparent reason for it to have one. Also, you may find it useful =

> to jump from your input chain to others by way of a verdict map.

If the hook is removed then packages are not processed in the chain, e.g.=


table inet filter {
 =C2=A0=C2=A0=C2=A0 chain input=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 { type filter hook input priority 0;=20
iifname pppoe-wan jump wan_i; }
 =C2=A0=C2=A0=C2=A0 chain wan_i=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 { policy drop; ct state 1 drop; ct state =

2,4 accept; }
}

which does not help with organising chains in the sense/way I had mind.=20
Looks like it requires a more circuitous route with more/different=20
tables and negating interfaces (iif =3D ! | oik =3D !) for each such tabl=
e.

