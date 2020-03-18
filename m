From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: Re: [nftables 0.9.2 | kernel 4.19.93] dropping ct state untracked
 stops ipv6 connectivity
Date: Wed, 18 Mar 2020 12:16:22 +0000
Message-ID: <1ef6eb05-1f82-fc88-8d1f-8bb5b98ae67a@gmx.net>
References: <9a55ac25-719e-49fb-c414-7467e67cb686@gmx.net>
 <20200318120726.GA13921@breakpoint.cc>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1584533771;
        bh=LfwD7mOVgfjLp4V4CECUwX+dwoEVFj0RRfmjmtTAARQ=;
        h=X-UI-Sender-Class:Reply-To:Subject:To:Cc:References:From:Date:
         In-Reply-To;
        b=LP1x9QodGun8te59NNaRVkRXmiKTh3ypcZvsRd0tCPtKJ22TLxPYKFjlj07xBifmk
         taB/Y5k9Jam6a+5cL31FvWTzqQynzHeULdcHZ03/hzqJCRBMVCcNxDLfmoqozk/4+R
         qxJrmhZeqniA3rqzf918W+jQh8jrGQSfZew3zEeM=
In-Reply-To: <20200318120726.GA13921@breakpoint.cc>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Florian Westphal <fw@strlen.de>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 18/03/2020 12:07, Florian Westphal wrote:
> =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 <vtol@gmx.net> wrote:
>> This works (i.e. ipv4 and ipv6 connectivity)
>>
>> table inet filter {
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chain input {
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 type filter hook input priority filter; policy drop;
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ct state established,related accept
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ct state invalid drop
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>
>> }
>>
>> This cuts ipv6 connectivity entirely (ipv4 connectivity works)
>>
>> table inet filter {
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chain input {
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 type filter hook input priority filter; policy drop;
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ct state established,related accept
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ct state invalid,untracked drop
> Yes.
>
>> It reproduces on each toggle: ct state invalid,untracked drop <-> ct st=
ate
>> invalid drop (ct db/cache needs to clear in between toggling).
>> Enabled logging but nothing been printed that would provide a hint.
>>
>> Is this something to be expected, and if so why, or is it a bug in kern=
el /
>> nft?
> Expected, conntrack marks icmpv6 neigh resolution as untracked.


Thanks for the instant feedback. Might be worth to mention in wiki/man.

That is one protocol (icmpv6 neigh resolution) being untracked but that
implies that NFT is then subsequently blocking the source ipv6 entirely?
It is not even possible to reach a ssh server that runs on the NFT instanc=
e.
