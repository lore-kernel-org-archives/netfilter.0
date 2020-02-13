From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: Re: [nftables 0.9.2] does jump require a kconf to be set to get it
 working?
Date: Thu, 13 Feb 2020 12:09:40 +0000
Message-ID: <a12c778a-9c4a-bcea-e588-25db496f6bde@gmx.net>
References: <a581ac40-f8ad-c009-4c83-40f1833b6ddb@gmx.net>
 <c81185d7-ff7c-9df7-c61d-29ed7c541e31@plushkava.net>
 <c88a5ed6-abcf-3318-363c-2e187d4bf533@gmx.net>
 <82365710-b3eb-e738-a181-9b18219cbbfe@plushkava.net>
 <452a8200-536c-4457-d6b5-4591c7781e48@gmx.net>
 <7cd325dd-e028-9b98-9b15-ddfdad3845bf@plushkava.net>
 <17defc0c-6d30-f098-99ca-7594cc63071d@gmx.net>
 <da48838e-d67d-13a0-c349-b51ca3c050a7@plushkava.net>
 <a27d6244-60a5-7b32-fcd9-bb0364f69224@gmx.net>
 <44ce1f43-7bc4-4f1c-c5d1-566a34483036@plushkava.net>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1581595783;
        bh=Rm9yqLwedOCqS7v6aSZl3wZbO11VD17KUHCsPzVigUQ=;
        h=X-UI-Sender-Class:Reply-To:Subject:To:References:From:Date:
         In-Reply-To;
        b=MM1Uuwa05piEvxSCy77iZCTIQIkKd2occJPHeP50hoUwBKPcZcOUfoa9/seXGNVkf
         h+DgyLooGnQRgOqS0UH4a0zBjgZDYpgrBvmyUZOrFSew+pT0tjPzcNXFiTcmaF3GRD
         fKMvNCbTPfoFt+3eCheDHRXGHggq66Ag2n3aqDhU=
In-Reply-To: <44ce1f43-7bc4-4f1c-c5d1-566a34483036@plushkava.net>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: kfm@plushkava.net, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 13/02/2020 11:59, kfm@plushkava.net wrote:
> On 13/02/2020 11:41, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 wrote:
>
> <snip>
>
>> The current kernel deployed, which kconf is beyond my control, is=20
>> missing the flag to support sets and thus vmap. But that aside=20
>> something like this seems to work
>>
>> table inet filter {
>> =C2=A0=C2=A0=C2=A0=C2=A0 chain input=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 { type filter hook input priori=
ty 0;=20
>> policy drop; iifname pppoe-wan jump wan_i; }
>> =C2=A0=C2=A0=C2=A0=C2=A0 chain wan_i=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 { ip saddr 0.0.0.0/32 udp sport=
 67 ip=20
>> daddr 255.255.255.255/32 udp dport 68 accept; }
>> }
>
> Indeed, vmap is by no means required. This is equivalent to the=20
> previously suggested input chain, only marginally less efficient:
>
> chain input {
> =C2=A0 type filter hook input priority 0; policy drop;
> =C2=A0 ct state established,related accept
> =C2=A0 ct state invalid,untracked drop
> =C2=A0 iifname "lo" accept
> =C2=A0 iifname "pppoe-wan" goto wan_i
> =C2=A0 iifname "eth0-lan" goto lan_i
> }
>
> Note that goto is an optimisation. It would still be appropriate to=20
> use jump in the case that you need for the packet to be able to fall=20
> through one of the user-defined chains and return to the input chain=20
> in order to be subjected to other rules there. In this particular=20
> example, it is not possible for iifname to match "eth0-lan" if it did=20
> not already match "pppoe-wan" and, because there are no further rules=20
> in the input chain, the use of goto is fine.

Thanks for the hint/tip (and other input) - goto makes sense in this=20
case, saves CPU cycles (even if just a tiny bit - but why waste it anyway=
).

