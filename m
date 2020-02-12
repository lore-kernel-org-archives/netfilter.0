From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: Re: [nftables 0.9.2] does jump require a kconf to be set to get it
 working?
Date: Wed, 12 Feb 2020 18:52:41 +0000
Message-ID: <c88a5ed6-abcf-3318-363c-2e187d4bf533@gmx.net>
References: <a581ac40-f8ad-c009-4c83-40f1833b6ddb@gmx.net>
 <c81185d7-ff7c-9df7-c61d-29ed7c541e31@plushkava.net>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1581533562;
        bh=nmki/x2I9rOAg/UQr/UbVp0yl1Kv2EWmt+sdEijfnRA=;
        h=X-UI-Sender-Class:Reply-To:Subject:To:References:From:Date:
         In-Reply-To;
        b=dnpevMiBvMUM1pri4FXuhMCSUzNv0g/8VkcEgfLu0TPyLFIkddyy1jiUOO6PC89Ae
         5rfGBBfPcSjWWbBM6yHe0u6ki8jLhlZiFcl+StC5gO1KKs78iAAC8kAzb31/czecia
         2srX+5YedHYmAcJBHZr8WJQB4uNacY/msp8H80AE=
In-Reply-To: <c81185d7-ff7c-9df7-c61d-29ed7c541e31@plushkava.net>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: kfm@plushkava.net, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


On 12/02/2020 18:40, kfm@plushkava.net wrote:
> On 12/02/2020 16:41, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 wrote:
>> Have tried to some online guidance which NFT features require which=20
>> kernel config to be set to get them working and whether jump is among =

>> such feature set.
>>
>> Because hitting:
>>
>> Error: Could not process rule: Not supported
>>
>> with:
>>
>> table inet filter=C2=A0 {
>> =C2=A0=C2=A0chain input=C2=A0 { type filter hook input priority 0; iif=
name pppoe-wan=20
>> jump wan_i }
>> }
>
> As shown, this isn't quite valid nft syntax. Please post a minimal -=20
> but complete - ruleset that reproduces your issue in a form that is=20
> verbatim. Include the wan_i definition, even if it merely an empty chai=
n.

table inet filter {
 =C2=A0=C2=A0=C2=A0 chain input { type filter hook input priority 0; iifn=
ame pppoe-wan=20
jump wan_i; }
 =C2=A0=C2=A0=C2=A0 chain wan_i=C2=A0 { type filter hook input priority 0=
; }
}

>
> That aside, you would definitely need CONFIG_NF_TABLES_INET for "inet" =

> support.
>

That is fine, CONFIG_NF_TABLES_INET=3Dy


