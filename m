From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: Re: [nftables] log flood protection?
Date: Fri, 25 Sep 2020 09:41:00 +0000
Message-ID: <c740ba1a-e485-a6ed-3fe7-b343754b0481@gmx.net>
References: <a3a88c99-9164-f56a-6368-d59230c647e6@gmx.net>
 <20200925093119.GB31471@breakpoint.cc>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1601026868;
        bh=gChmWbbr4kBKAirjpoyCy3CnTPaJLWRwAO9Z4AbDP0k=;
        h=X-UI-Sender-Class:Reply-To:To:References:From:Subject:Date:
         In-Reply-To;
        b=C1ecD4F8X40ysSVuHrOelfObxoRvdMzRiwI/mk5KgkZ++zILGB0gE4seeaxd4guxB
         aX46LzbzrBcL5WrMB9UFkC9hRMQFIKIeRaH+C3KO3MCDzrPjyjcRRbz0zZBlHcm7wt
         3R42M08txKgH/mkS8SC9SNu8v3liMbYRBJ+jxS1M=
In-Reply-To: <20200925093119.GB31471@breakpoint.cc>
Content-Language: en-GB
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 25/09/2020 11:31, Florian Westphal wrote:
> =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 <vtol@gmx.net> wrote:
>> Trying to limit log entries as a preventive measure for log flooding w=
ith
>>
>> log flags all prefix "foo DROP: " limit rate 1/second
> This applies the limit after the log has taken place.
>
> limit rate 1/second log flags ...

Thank you, that works now. Humble suggestion to mention the correct log=20
rate limit syntax in wiki a/o man.

