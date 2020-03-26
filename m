From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: Re: [libnftnl] documentation?
Date: Thu, 26 Mar 2020 09:36:44 +0000
Message-ID: <4748cc27-b3e4-0d44-87c8-2013b8819601@gmx.net>
References: <2b42de23-1291-58b1-48d4-1863bc9772a6@gmx.net>
 <d29b4165-34cc-ab98-e2cd-d83b2cc7f815@fhmtech.com>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1585215430;
        bh=oo5MYfzG09zQqxze1H7PMG0U1c1mJCMqsttTkMUWP4A=;
        h=X-UI-Sender-Class:Reply-To:Subject:To:References:From:Date:
         In-Reply-To;
        b=EZCA25Vi9KF7N+4IuB7C8ruvUJZWJgeEMZzaHlwzFlxxE2Ez6XGupEY+0EeOzCEE7
         QQwRlgHy47pMfDnOkqmoYJU67HPLR7M8uD/vs47Q/vSRBZ4qpq0J3QKxxpYA3vG0+F
         58RDRtgsERupNrfdkuAsnuLtWtQdTtQhGsv/rRqo=
In-Reply-To: <d29b4165-34cc-ab98-e2cd-d83b2cc7f815@fhmtech.com>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 26/03/2020 09:32, Frank Myhr wrote:
> On 2020/03/26 04:38, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 wrote:
>> Been trying to find some documentation in these places:
>>
>> * https://netfilter.org/projects/libnftnl/
>> * https://www.netfilter.org/documentation/
>> * https://git.netfilter.org/libnftnl/tree/
>> *
>> https://wiki.nftables.org/wiki-nftables/index.php/Portal:DeveloperDocs/=
nftables_internals
>>
>>
>> but either I missed it - and thus appreciate a pointer - or there is
>> none?
>>
>> The aim/goal is to utilise libnftnl with json.
>
> Do these help you?:
> https://git.netfilter.org/nftables/tree/doc/libnftables.adoc
> https://git.netfilter.org/nftables/tree/doc/libnftables-json.adoc
>
> AFAIK libnftnl=3Dlibnftables, the older name just persists (confusingly)
> in many places.
>
> Best regards,
> Frank

Indeed, thank you. Probably missed it, as pointed out, due to the (old)
naming.
