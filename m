From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: Re: [nftables 0.9.2] does jump require a kconf to be set to get it
 working?
Date: Wed, 12 Feb 2020 19:21:06 +0000
Message-ID: <452a8200-536c-4457-d6b5-4591c7781e48@gmx.net>
References: <a581ac40-f8ad-c009-4c83-40f1833b6ddb@gmx.net>
 <c81185d7-ff7c-9df7-c61d-29ed7c541e31@plushkava.net>
 <c88a5ed6-abcf-3318-363c-2e187d4bf533@gmx.net>
 <82365710-b3eb-e738-a181-9b18219cbbfe@plushkava.net>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1581535267;
        bh=npG15g31eXID0M4L0ajWAnh49xAZ7pe28oenHLKNw84=;
        h=X-UI-Sender-Class:Reply-To:Subject:To:References:From:Date:
         In-Reply-To;
        b=ifQkfmi4LsMy0VR5+SmrVUuW7377gpY1+1OXyQ5s3PjAosy1t1PNoKstcugln1Tes
         C9WxGSrL0NqTQsiUBCFa70JcokBBVsZCOGG4CKmX9CRNKvZhHzq7ZqUiiHdENOFqTg
         5k2VDS+tB2H7aPrUuzDL+1SuI59d7Fx6vPqG7xB0=
In-Reply-To: <82365710-b3eb-e738-a181-9b18219cbbfe@plushkava.net>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: kfm@plushkava.net, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


On 12/02/2020 19:01, kfm@plushkava.net wrote:
> On 12/02/2020 18:52, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 wrote:
>>
>> On 12/02/2020 18:40, kfm@plushkava.net wrote:
>>> On 12/02/2020 16:41, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 wrote:
>>>> Have tried to some online guidance which NFT features require which =

>>>> kernel config to be set to get them working and whether jump is=20
>>>> among such feature set.
>>>>
>>>> Because hitting:
>>>>
>>>> Error: Could not process rule: Not supported
>>>>
>>>> with:
>>>>
>>>> table inet filter=C2=A0 {
>>>> =C2=A0=C2=A0chain input=C2=A0 { type filter hook input priority 0; i=
ifname=20
>>>> pppoe-wan jump wan_i }
>>>> }
>>>
>>> As shown, this isn't quite valid nft syntax. Please post a minimal - =

>>> but complete - ruleset that reproduces your issue in a form that is=20
>>> verbatim. Include the wan_i definition, even if it merely an empty=20
>>> chain.
>>
>> table inet filter {
>> =C2=A0=C2=A0=C2=A0=C2=A0 chain input { type filter hook input priority=
 0; iifname=20
>> pppoe-wan jump wan_i; }
>> =C2=A0=C2=A0=C2=A0=C2=A0 chain wan_i=C2=A0 { type filter hook input pr=
iority 0; }
>> }
>>
>
> You may not jump to the wan_i chain because it is hooked. It makes as=20
> little sense as trying to run iptables -I INPUT -j INPUT.
>

So jump and goto are only good with non-base chains and those can only=20
be utilised for:

  * nft_immediate: loads an immediate value into a register.
  * nft_cmp: compare a given data with data from a given register.
  * nft_payload: set/get arbitrary data from packet headers.
  * nft_bitwise: perform bit-wise math operations over data in a given
    register.
  * nft_byteorder: perform byte order operations over data in a given
    register.
  * nft_counter: a basic counter for packet/bytes that gets incremented
    everything is evaluated for a packet.
  * nft_meta: set/get packet meta information, such as related
    interfaces, timestamps, etc.
  * nft_lookup: search for data from a given register (key) into a
    dataset. If the set is a map/dictionary, returns the value for that k=
ey.


then, that correct? I had hoped that I could organise the chain=20
structure for processing into something like WAN, LAN and WAN<>LAN.


