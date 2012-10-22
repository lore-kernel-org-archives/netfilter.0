From: =?UTF-8?B?bWF0amHFvg==?= <matjazbercic@lavabit.com>
Subject: Re: AW: Possible bug in iptables : -m --uid-owner not working with
 ping
Date: Mon, 22 Oct 2012 20:56:49 +0200
Message-ID: <508596F1.6090802@lavabit.com>
References: <50855A6B.1070000@lavabit.com> <304595783255CB4682E86E67D63E6FEE2AEA96@dc2008r2.sh-solutions.intern> <alpine.LNX.2.01.1210221816210.11589@nerf07.vanv.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1210221816210.11589@nerf07.vanv.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Jan Engelhardt <jengelh@inai.de>
Cc: Steffen Heil <lists@steffen-heil.de>, Netfilter user mailing list <netfilter@vger.kernel.org>, rob0@gmx.co.uk, Eric Lebond <eric@regit.org>

Thank you all for your explanations.
And yes, my ping is suid and this solves my problems.
Best regards,
Matja=C5=BE

On 10/22/2012 06:19 PM, Jan Engelhardt wrote:
> On Monday 2012-10-22 16:43, Steffen Heil (Mailinglisten) wrote:
>
>> Hi
>>
>> On my system /bin/ping has suid-bit set.
>> So it it always executed as root, not as the user invoking it.
>>
>> As far as I know, ping requires root privileges...
>
> Linux supports
>
> 	socket(AF_INET, SOCK_DGRAM, IPPROTO_ICMP)
>
> since v3.0, so ping does not _strictly_ need root anymore - and
> meanwhile fixes your owner "mismatch".
>

