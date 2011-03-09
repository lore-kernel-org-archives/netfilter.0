From: Pandu Poluan <pandu@poluan.info>
Subject: Re: Query regarding NAPT using iptables
Date: Thu, 10 Mar 2011 06:19:38 +0700
Message-ID: <AANLkTinTwUOC8MdCrso_UpMWf+ZHCmrHTXWADi=8DhWU@mail.gmail.com>
References: <AANLkTimsWbnXpVn0BCCJmTe7_dM4KPhTK6hxzbMA33P-@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTimsWbnXpVn0BCCJmTe7_dM4KPhTK6hxzbMA33P-@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: ajay seshadri <seshajay@gmail.com>, netfilter@vger.kernel.org

(sorry for top posting; Gmail mobile client)

I'll try to answer your questions.

1. For an example: ICMP does not have ports. You should split the rule:

-p tcp -g nr_napt
-p udp -g nr_napt
-p sctp -g nr_napt
-p tcp -g nr_napt
-j SNAT (without ports)
-A nr_napt -j SNAT (with ports)

2. Yes, with helper. Prior to the SNAT rules above, place a rule with
helper match:

-m helper --helper ftp

3. Netfilter will perform a defragmentation in this case.

4. One-to-one will happen only if (in the case of SNAT) you use a -s
match. If (like in your example) you use a -d match, it will still be
NAPT, and port multiplexing will still happen.

Others, feel free to CMIIW.

Rgds,


On 2011-03-09, ajay seshadri <seshajay@gmail.com> wrote:
> Hi all,
>
> I was trying to write some iptables rules to perform NAPT. I had the
> following doubts:
>
> 1. When I specified the following rule:
>
>>sudo iptables -t nat -A POSTROUTING -d 10.20.3.81 -j SNAT --to
>> 10.19.11.1:1-500 I got the following error:-=C2=A0 iptables v1.4.4: =
Need TCP,
>> UDP, SCTP or DCCP with port specification.
>
> Is there anyway to specify a single rule to cover all the protocols? =
I
> got the same error when i specified '-p 0'. Are there any protocols
> that don't work with NAPT?
>
> 2. Would NAPT work in case of application layer protocols like FTP,
> where the application code requires port numbers? I came across ALG
> and conntrack modules. I don't really have clarity in this regard to
> know if there are any application layer protocols that would fail to
> work with NAPT. If yes, is there anyway to get around this?
>
> 3. If I am not mistaken the NAT RFC states that NAPT won't work if th=
e
> packets are already segmented as the segments don't contain port
> information. Is there anyway to get around this? Also, are there any
> such scenarios where NAPT would fail?
>
> 4. If NAT is done instead of NAPT, by specifying a one - to - one
> mapping for each flow using iptables, does that guarantee that port
> multiplexing will not be used?=C2=A0 Is NATing more stable that NAPT?
>
>
> Thanks,
> Ajay
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


--=20
--
Pandu E Poluan - IT Optimizer
My website: http://pandu.poluan.info/
