From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: Re: [nftables v0.9.2 | kernel 4.19.93] ICMPv6 ingress dropped despite
 accept rule
Date: Mon, 3 Feb 2020 12:30:21 +0000
Message-ID: <7904c819-c3de-2e65-bd36-afc048c79325@gmx.net>
References: <f8914acf-6487-c9bd-e452-d253069aebe5@gmx.net>
 <20200203115603.GA32621@dimstar.local.net>
 <20200203121508.GB32621@dimstar.local.net>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1580733020;
        bh=mHK/QPxDvBhbSQfB8WHPtP7HpYDPpPlRN+ZM3Z1DPC4=;
        h=X-UI-Sender-Class:Reply-To:Subject:To:References:From:Date:
         In-Reply-To;
        b=hi2Mp5RAF2d6vLOGoGxGp9YvsMrdDAPELyrsjGQwVCOR1+Mv2ieUukv/nc1neZW73
         C1CdcR4FXPbuC0xIzUz5A9gU+qFql9ohd7EeHg/+OVqRAljF+bQ2DOLbsZdMQEPkt5
         CnuTgZnfxRgkWfWYRn/uiuY7DKQGL8Tian2499is=
In-Reply-To: <20200203121508.GB32621@dimstar.local.net>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 03/02/2020 12:15, Duncan Roe wrote:
> On Mon, Feb 03, 2020 at 10:56:03PM +1100, Duncan Roe wrote:
>> On Mon, Feb 03, 2020 at 10:56:24AM +0000, ????????????? wrote:
>>> Appreciate if someone could be obliged and have a look at the below r=
uleset
>>> and let me know where I am going wrong since ICMPv6 is being (policy)=

>>> dropped:
>>>
>>> DROP_WAN_IN IN=3Dpppoe-wan OUT=3D MAC=3D
>>> SRC=3Dfe80:0000:0000:0000:e2ac:f1ff:fe65:51ba
>>> DST=3Dff02:0000:0000:0000:0000:0000:0000:0001 LEN=3D72 TC=3D224 HOPLI=
MIT=3D255
>>> FLOWLBL=3D0 PROTO=3DICMPv6 TYPE=3D134 CODE=3D0
>>>
>>> despite an accept statement
>>>
>>> --- ruleset
>>>
>>> table arp filter { # handle 141
>>>          chain input { # handle 1
>>>                  type filter hook input priority filter; policy accep=
t;
>>>                  iif "eth2" drop # handle 3
>>>          }
>>>
>>>          chain output { # handle 2
>>>                  type filter hook output priority filter; policy acce=
pt;
>>>                  oif "eth2" drop # handle 4
>>>          }
>>> }
>>> table inet filter { # handle 142
>>>          chain input { # handle 1
>>>                  type filter hook input priority filter; policy drop;=

>>>                  ct state established,related accept # handle 4
>>>                  ct state invalid drop # handle 5
>>>                  iif "lo" accept # handle 6
>>>                  iif "br-lan" accept # handle 7
>>>                  iif "lan0" accept # handle 8
>>>                  iif "lan1" accept # handle 9
>>>                  iif "lan2" accept # handle 10
>>>                  iif "lan3" accept # handle 11
>>>                  iif "lan4" accept # handle 12
>>>                  log prefix "DROP_WAN_IN " # handle 13
>>>          }
>>> }
>>> table ip6 filter { # handle 145
>>>          chain input { # handle 1
>>>                  iif "eth2" ip6 saddr fc00::/6 udp sport 547 udp dpor=
t 546
>>> ip6 daddr fc00::/6 accept # handle 3
>>>                  icmpv6 type destination-unreachable meta nftrace set=
 1
>>> accept # handle 4
>>>                  icmpv6 type packet-too-big meta nftrace set 1 accept=
 #
>>> handle 5
>>>                  icmpv6 type time-exceeded meta nftrace set 1 accept =
# handle
>>> 6
>>>                  icmpv6 type parameter-problem meta nftrace set 1 acc=
ept #
>>> handle 7
>>>                  icmpv6 type echo-reply meta nftrace set 1 accept # h=
andle 8
>>>                  icmpv6 type nd-router-advert meta nftrace set 1 acce=
pt #
>>> handle 9
>>>                  icmpv6 type nd-neighbor-advert meta nftrace set 1 ac=
cept #
>>> handle 10
>>>                  icmpv6 type nd-redirect meta nftrace set 1 accept # =
handle
>>> 11
>>>                  icmpv6 type 149 meta nftrace set 1 accept # handle 1=
2
>>>                  icmpv6 type 151 meta nftrace set 1 accept # handle 1=
3
>>>                  icmpv6 type 153 meta nftrace set 1 accept # handle 1=
4
>>>          }
>>> }
>>>
>> table ip6 filter chain input is probably not run at all becaue it is m=
issing
>> type, hook and priority parameters which the man page says are mandato=
ry for
>> base chains.
>>
>> Even if it were run, table inet filter chain input will drop icmpv6 an=
yway. This
>> will happen whichever of the 2 chains runs first, since accept is only=
 final
>> w.r.t the current chain. Drop is completely final btw.
>>
>> You need to do 3 things:
>>
>>   1. Make sure table ip6 filter chain input runs first, by e.g. giving=
 it
>> priority filter-1
>>   2. In table ip6 filter chain input, set a packet mark on accepted pa=
ckets
>>   3. In table inet filter chain input, accept packets with the packet =
mark set by
>> item 2
>>
>> Cheers ... Duncan.
> Simpler solution: rename table ip6 filter chain input (to input2, say),=
 then
> move that chain into table inet filter.
>
> Insert the rule "icmpv6 jump input2" into chain input somewhere before =
the log
> rule.
>
> Also move the rule starting iif "eth2" from chain input2 to chain input=
=2E
>
> Cheers ... Duncan.

Thank you all for the input/clarification, apparently a misconception on =

my part having erroneously assumed, based on:

"Tables of this family will see both IPv4/IPv6 traffic/packets, designed =

to improve dual stack support. Both IPv4/IPv6 packets will traverse the=20
same rules."

that the chain hook definitions from the inet table would apply to the=20
ip and ip6 tables as well.

Hooks aside, what about policies and ct state stipulated in the inet=20
table rules - are they applicable to the inet table only as well or=20
spawn to ip | ip6 as too?

