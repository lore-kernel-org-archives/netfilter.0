From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: Re: [nftables v0.9.2] inet <> ip | ip6 family tables processing
 order?
Date: Wed, 5 Feb 2020 11:56:19 +0000
Message-ID: <5ac9783b-f841-a5a9-763d-9f794cf9216a@gmx.net>
References: <dad1e392-ae29-a3bf-7411-d1dfe2095de2@gmx.net>
 <20200205112104.GA26952@breakpoint.cc>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1580903782;
        bh=dwgM6RP+2fsJUj3cMvACn7DKRjJ5TTCNMTqcuWvis8A=;
        h=X-UI-Sender-Class:Reply-To:Subject:To:Cc:References:From:Date:
         In-Reply-To;
        b=K5KMcHplxlY5AsOKd2UHCfOm+HFb8Rm4QwH0uOE/Ao8gQNaGcbIsU+tq5iTake8Pe
         ik98UROJ9+RrrVe7K6enhjNTDPwW4EENnTX9mwK0i42r0fp0oOlvXBDPjbPEhnDpcH
         7c7R2OaBSSWhh/l6Dzabd/a0Vo3d40Z1KKk9VoZk=
In-Reply-To: <20200205112104.GA26952@breakpoint.cc>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Florian Westphal <fw@strlen.de>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 05/02/2020 11:21, Florian Westphal wrote:
> =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 <vtol@gmx.net> wrote:
>> Having deployed family tables:
>>
>> * inet
>> * ip
>> * ip6
>>
>> and to my understanding the _base chain definitions_, hook priority an=
d
>> policy, are only applicable to chains within the same family table but=
 are
>> mutually exclusive between the different family tables I am struggling=
 to
>> comprehend as to the order of packet processing among the aforemention=
ed
>> family tables:
>>
>> * which family table the packet is processed trough first/last - inet =
or ip
>> | ip6?
> None.  Ordering is by prio, not by family.
>
> In ip vs ip6 case its even irrelevant because an ipv4 packet will never=

> travel any of the ip6 base chains, ever (and vice versa).

That was clear, it was meant inet <> ip or inet <> ip6

>
>> * if the hook priority in the base chains of each family is the same b=
ut
>> different policies being applied how would such conflict, inet vs. ip =
| ip6,
>> resolve?
> Implementation defined, right now its 'last added'.

Does that pertain to table handle value?
Does a lower handle value mean that the packet is first seen by that tabl=
e?
Noticed from the WIKI that rules can be positioned - does that work for=20
table as well, e.g.

* table inet filter position X
* table inet filter { position X

throwing an error.

> But result is the same, if verdict is "drop", packet is discarded and
> evaluation ends.
>
> Just like with iptables: if you drop in mangle input, filter table won'=
t
> even get a chance to see the packet.
>
>> As far as I comprehend jump | goto works with chains in the same famil=
y
>> table but it is not possible to jump | goto from the inet table to ip =
| ip6
>> or vice versa, or is it?
> Its not, each table is a distinct entity.

The question was with same chain/hook priority in inet versus ip | ipv6=20
but a different verdict and how would such conclict resolve, e.g.

* inet chain input prio 0=C2=A0 policy drop
* ip chain input prio 0 policy drop
* ip6 chain input prio 0 policy continue

?

