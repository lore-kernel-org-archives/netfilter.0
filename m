From: James Lamanna <james@warp2biz.com>
Subject: Re: Disable port translation in SNAT
Date: Thu, 24 Jul 2014 15:09:09 -0400
Message-ID: <53D159D5.3090904@warp2biz.com>
References: <2F6A61C9-C112-4C17-9BE7-9B6438B19893@warp2biz.com> <53D153B7.6000302@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <53D153B7.6000302@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi,
I have one device (an IP phone) on an AirRouter (based on linux, uses i=
ptables).
it still is translating ports in the 16000 range all the way down to 10=
25, which breaks RTP (it apparently doens't have very good SIP/SDP=20
conn-tracking on it).

That's why I was a bit puzzled as to why it keeps translating the ports=
 down to the low 1000s. I had thought it was the default to preserve it=
=2E

-- James


On 7/24/2014 2:43 PM, Pascal Hambourg wrote:
> Hello,
>
> James Lamanna a =E9crit :
>> Hi,
>> Is there a way to disable port translation during SNAT so that traff=
ic
>> originates from the same external port as it did internally?
>
> When possible this is already the default when you don't specify a po=
rt
> range nor --random. From the man page :
>
> --to-source  ipaddr[-ipaddr][:port-port]
>       which  can  specify a single new source IP address, an inclusiv=
e
>       range of IP addresses, and optionally, a port  range  (which  i=
s
>       only  valid if the rule also specifies -p tcp or -p udp).	 If n=
o
>       port range is specified, then source ports  below	 512  will  b=
e
>       mapped  to  other	 ports	below  512: those between 512 and 1023
>       inclusive will be mapped to ports below 1024,  and  other	 port=
s
>       will  be mapped to 1024 or above. Where possible, no port alter=
-
>       ation will occur.
>
> Sometimes the source port must be translated in order to avoid a
> conflict with an existing connection to the same destination which
> already uses that source port.
>

