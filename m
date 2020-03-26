From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: Re: [libnftnl] documentation?
Date: Thu, 26 Mar 2020 09:58:04 +0000
Message-ID: <a69e199c-f1f3-0c22-9917-e1bac493ee8b@gmx.net>
References: <2b42de23-1291-58b1-48d4-1863bc9772a6@gmx.net>
 <d29b4165-34cc-ab98-e2cd-d83b2cc7f815@fhmtech.com>
 <20200326094529.GD878@breakpoint.cc>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1585216696;
        bh=Y3m98IVMsnEmx8vmZTnK6Kg2ZRTNJfG8EHWDg1VRFjU=;
        h=X-UI-Sender-Class:Reply-To:Subject:To:References:From:Date:
         In-Reply-To;
        b=ISqyGdD5oknAMGdcVL28EW1DuWtP/PHKwCTkyLu8cQ0cIdyPhKaM5SA1GekbLAjrZ
         nN7vtUXxZig3cl9DzVM07d6gNrNnyQDw5IWMsT1Pu5arTHW9CXEq1wtxDSiV8EhwVh
         9Fc8MCxH4dC4PYw4EUuFpJuBI71sxfrh1l2Ok4nA=
In-Reply-To: <20200326094529.GD878@breakpoint.cc>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 26/03/2020 09:45, Florian Westphal wrote:
> Frank Myhr <fmyhr@fhmtech.com> wrote:
>> On 2020/03/26 04:38, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 wrote:
>>> Been trying to find some documentation in these places:
>>>
>>> * https://netfilter.org/projects/libnftnl/
>>> * https://www.netfilter.org/documentation/
>>> * https://git.netfilter.org/libnftnl/tree/
>>> *
>>> https://wiki.nftables.org/wiki-nftables/index.php/Portal:DeveloperDocs=
/nftables_internals
>>>
>>>
>>> but either I missed it - and thus appreciate a pointer - or there is n=
one?
>>>
>>> The aim/goal is to utilise libnftnl with json.
>> Do these help you?:
>> https://git.netfilter.org/nftables/tree/doc/libnftables.adoc
>> https://git.netfilter.org/nftables/tree/doc/libnftables-json.adoc
>>
>> AFAIK libnftnl=3Dlibnftables, the older name just persists (confusingly=
) in
>> many places.
> No, these are different libraries. libnftnl is a standalone library
> with low-level helpers.
>
> libnftables is the highlevel library, its part of nftables itself.
>
> libnftables contains the ruleset parser, for example.
Bit confusing as
https://wiki.nftables.org/wiki-nftables/index.php/Building_and_installing_=
nftables_from_sources
states

"libnftnl (formerly known as libnftables)"

Similar https://lwn.net/Articles/789528/

"The library libnftnl has been previously known as libnftables."

libnftnl then cannot parse json but "Is responsible for creating/parsing
the nf_tables netlink messages"?
