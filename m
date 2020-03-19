From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: Re: [nftables 0.9.2] NETDEV packet drop vs. packet capture visibility
Date: Thu, 19 Mar 2020 21:55:44 +0000
Message-ID: <6b5addf7-b289-d389-771b-9b667f43e044@gmx.net>
References: <076ce710-b294-7360-77ff-204d1848603a@gmx.net>
 <20200319194347.sqppl54l43istjco@salvia>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1584654951;
        bh=Ub8AUEpQzNWAsNtLXKhBH9BkykADbiAZgLThXNsndXU=;
        h=X-UI-Sender-Class:Reply-To:Subject:To:References:From:Date:
         In-Reply-To;
        b=OYqwB9TGtXknlJv2oABcIs5IIvBQdlpytHiqziyMSzT75aV9ASdiBgjEBVcksWk4p
         +fLPRIZMQXzu9HeKMHZfsH3gotvIIGtpaeD+eotqYymiNK4dFxtV9oSIeBhqmhJQFm
         IUWpN6O+mJQ+oc7XOfC/GiQ8toiIPqLv36TypykA=
In-Reply-To: <20200319194347.sqppl54l43istjco@salvia>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 19/03/2020 19:43, Pablo Neira Ayuso wrote:
> On Thu, Mar 19, 2020 at 04:11:01PM +0000, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=
=E2=84=A0 wrote:
>> With
>>
>> table netdev filter {
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chain input {
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 type filter hook ingress device "eth2" priority filt=
er;
>> policy accept;
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ether type arp drop
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ether type vlan drop
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ether type 0x9000 drop
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> }
>>
>> in place those package types are visible (showing) during a packet capt=
ure
>> (wirehshark ssh remote) on that interface. Is this to be expected as th=
e
>> packet is being captured prior being dropped by NFT or does indicate th=
at
>> the packages are not being dropped?
> The ingress packet filtering happens right after the "taps", ie.
> packet capture, e.g. wireshark.
>
> The packet is captured before nft ingress drops them.
>
> This is where the nf_ingress() hook is invoked:
>
> https://elixir.bootlin.com/linux/v5.6-rc6/source/net/core/dev.c#L5056
>
> Just a few lines before, you can see the routines for the packet
> captures ("taps"):
>
> https://elixir.bootlin.com/linux/v5.6-rc6/source/net/core/dev.c#L5043

Thank you for the explanation/pointer.
