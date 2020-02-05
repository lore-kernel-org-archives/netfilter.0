From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: Re: [nftables v0.9.2 | kernel 4.19.93] logging protocols in inet
 family table require explicit protocol statement?
Date: Wed, 5 Feb 2020 14:45:27 +0000
Message-ID: <03b849bc-48f3-0e47-2d94-47b2a74f988a@gmx.net>
References: <7f4e6968-d2c8-7b14-0d42-137c7f7d7f85@gmx.net>
 <20200205142935.GG26952@breakpoint.cc>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1580913928;
        bh=LCj9U7oAL7N6dsdLd+6oZk8Y4qFdYB99d1GiphnpOuI=;
        h=X-UI-Sender-Class:Reply-To:Subject:To:Cc:References:From:Date:
         In-Reply-To;
        b=IQRou9KxTXKDZEqtAx8dbPyHO6LPEK7LtisfzbQFDusbYdvvpJ2Cx+ZZjGxG1cKpc
         ZYWt9IQqeVP9wWmd2+KnDieZaqBFNlp9FNXICbcujHonY4cN8AhAI5dTUOOj6OMadN
         RiRWh37kJKcWtGGKoknAyWJKUbp4MDsMSAZrWGTg=
In-Reply-To: <20200205142935.GG26952@breakpoint.cc>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Florian Westphal <fw@strlen.de>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 05/02/2020 14:29, Florian Westphal wrote:
> =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 <vtol@gmx.net> wrote:
>> Having perused the WIKI [1] I tried to get protocol specific logging g=
oing,
>> but ended up with
>>
>> * tcp log -> Error: syntax error, unexpected log
>> * icmpv6 log -> Error: syntax error, unexpected log
>>
>> Only with an explicit protocol statement logging works
>>
>> * ip protocol tcp log
>> * ip6 nexthdr=C2=A0 icmpv6 log
> You mean "log" doesn't work?  (no "tcp" prefix).

Yes, logging does not work with

icmpv6 log

and throws the error, whilst

ip6 nexthdr icmpv6 log

works and does not exhibit the error, similar with tcp | udp.

For package filtering it is however not necessary to make such explicit=20
ip protocol | ip6 nexthdr statements. And since there is no mention of=20
such (explicit) requirement in the WIKI I raised the question here=20
because I find it inexplicable that filtering does work one way and=20
logging another way.

>
>> cat /proc/net/netfilter/nf_log
>>  =C2=A00 NONE (nfnetlink_log)
>>  =C2=A01 NONE (nfnetlink_log)
>>  =C2=A02 nf_log_ipv4 (nf_log_ipv4,nfnetlink_log)
>>  =C2=A03 NONE (nfnetlink_log)
>>  =C2=A04 NONE (nfnetlink_log)
>>  =C2=A05 NONE (nfnetlink_log)
>>  =C2=A06 NONE (nfnetlink_log)
>>  =C2=A07 NONE (nfnetlink_log)
>>  =C2=A08 NONE (nfnetlink_log)
>>  =C2=A09 NONE (nfnetlink_log)
>> 10 nf_log_ipv6 (nf_log_ipv6,nfnetlink_log)
>> 11 NONE (nfnetlink_log)
>> 12 NONE (nfnetlink_log)
> This means that ipv4 is logged by nf_log_ipv4 and ipv6 via
> nf_log_ipv6.  Everything should be working for ipv4, ipv6 and inet
> without any further action (provided you want to use printk-based
> logging via dmesg rather than nfnetlink).

Just installed nfnetlink_log module to see whether it would make a=20
difference but it did not and it is now removed again.

>> Tried with
>>
>> echo "nf_log_icmp" > /proc/sys/net/netfilter/nf_log/1
> There is no layer 4 logger. nf_log_XXX, where XXX is a l3 protocol
> family, i.e.  nf_log_{ipv4,ipv6,arp,bridge} or nfnetlink_log.


