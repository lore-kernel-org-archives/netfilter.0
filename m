From: =?UTF-8?B?R8Ohc3DDoXIgTGFqb3M=?= <swifty@freemail.hu>
Subject: Re: Dropped packets logged which should be accepted by Conntrack
Date: Tue, 15 Nov 2011 10:47:01 +0100
Message-ID: <4EC23515.8020808@freemail.hu>
References: <1321326448.2936.43.camel@denise.theartistscloset.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1321326448.2936.43.camel@denise.theartistscloset.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Cc: netfilter@vger.kernel.org

Hi John,

2011-11-15 04:07 keltez=C3=A9ssel, John A. Sullivan III =C3=ADrta:
> Hello, all.  I find myself perplexed by what I often see in our logs.
> At the end of our FORWARD chain, we log drops for no matches:
>
> [root@fw01 log]# iptables -v -n -L FORWARD
> Chain FORWARD (policy DROP 528K packets, 85M bytes)
>   pkts bytes target     prot opt in     out     source
> destination
>    16M  925M TCPMSS     tcp  --  *      *       0.0.0.0/0
> 0.0.0.0/0           tcp flags:0x06/0x02 TCPMSS clamp to PMTU
> 2284M 1690G ACCEPT     all  --  *      *       0.0.0.0/0
> 0.0.0.0/0           state RELATED,ESTABLISHED
> 7890K  594M VPN_ALLOW  all  --  *      *       0.0.0.0/0
> 0.0.0.0/0           MARK match 0xcccc/0xcccc
>    27M 2609M UPEPIN_DENY  all  --  *      *       0.0.0.0/0
> 0.0.0.0/0
>    27M 2609M UPEPIN     all  --  *      *       0.0.0.0/0
> 0.0.0.0/0
>   528K   85M LOG        all  --  *      *       0.0.0.0/0
> 0.0.0.0/0           LOG flags 0 level 4 prefix `No Match: '
>

> The above shows SMTP, LDAP, and memcached replies which should have b=
een
> accepted.  Why would I see this?

I do not know what kind of rules do you have between the=20
"RELATED,ESTABLISHED" and the "LOG/DROP" rules, but I do not see any=20
"conntrak NEW" rule there...
And as far as I can tell, your UPEPIN_DENY chain does not get any hit..=
=2E=20
(If that chain ment to deny any unwanted traffic.)

To answer your question:
You see those logs becaus the packets are:
  - not "RELATED" or "ESTABLISHED",
  - not filtered in the VPN_ALLOW chain, (not marked with 0xcccc)
  - not droped in the UPEPIN_DENY chain,
  - not accepter the UPEPIN chain...

These packets can be:
  a, "NEW'",
  b, "INVALID",
  c, "UNTRACKED",
  and none of them are "ACCEPT"-ed... :D

Swifty
