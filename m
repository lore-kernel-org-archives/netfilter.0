From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: Re: [nftables] netdev rate limiting | timeouts rfq
Date: Mon, 28 Sep 2020 13:10:00 +0000
Message-ID: <c9a8646f-69b6-7333-b7ed-74f3d9747665@gmx.net>
References: <5c60c340-d6d8-1f7c-67da-2782360a92fe@gmx.net>
 <20200923083042.GB10267@salvia>
 <cd739cba-9f79-2669-b5cb-e504e851c49d@gmx.net>
 <20200928115210.GA21841@salvia>
 <f536fd2e-a9f2-730a-d2ae-0579ccb3b48d@gmx.net>
 <20200928122443.GA24572@salvia>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1601298625;
        bh=7nwUY4yGRZpCpa0ROjN34agcnWW/qVfJ6iYdWqkR2KU=;
        h=X-UI-Sender-Class:Reply-To:To:References:From:Subject:Date:
         In-Reply-To;
        b=SLtepjbpF1cD/qdZPzu276p2wFj5DmgQzQqJP91LROUtKRDXlw0dWt2wmkY5jgZO/
         4+oRC5b87wyAVgoBXlkbF4jVOkntsjKq5z/xgGaEJ2smxnaWObKm5tXDZQe3sX27QU
         4HbkbAfZNygKLA0YYCQK6sZKE8PFJSbsKSy8UXSU=
In-Reply-To: <20200928122443.GA24572@salvia>
Content-Language: en-GB
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

On 28/09/2020 14:24, Pablo Neira Ayuso wrote:
> On Mon, Sep 28, 2020 at 12:08:00PM +0000, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=
=E2=84=A0 wrote:
>> In the below example it does not print any logs and since that stanza =
is
>> right prior drop I reckon that since the log printing does not happen =
the
>> frame dropping does neither.
>>
>> table inet filter {
> [...]
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chain wan_pr {
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ct state { new } update @glv4 { ip saddr limit rate=
 over
>> 15/day burst 3 packets } log prefix "glv4 DROP: " flags all drop
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> }
> ct state new is restricting to match only on the first packet of the
> connection.

Right, it should be then rather something with ct count, like:


ct state new update @glv4 { ip saddr ct count over 15 } log flags all=20
prefix "glv4 DROP: " drop


but that produces:

Error: Could not process rule: Not supported

??


