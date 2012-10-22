From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: AW: Possible bug in iptables : -m --uid-owner not working with
 ping
Date: Mon, 22 Oct 2012 18:19:38 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1210221816210.11589@nerf07.vanv.qr>
References: <50855A6B.1070000@lavabit.com> <304595783255CB4682E86E67D63E6FEE2AEA96@dc2008r2.sh-solutions.intern>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <304595783255CB4682E86E67D63E6FEE2AEA96@dc2008r2.sh-solutions.intern>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steffen Heil <lists@steffen-heil.de>
Cc: =?UTF-8?Q?matja=C5=BE?= <matjazbercic@lavabit.com>, Netfilter user mailing list <netfilter@vger.kernel.org>, rob0@gmx.co.uk, Eric Lebond <eric@regit.org>

On Monday 2012-10-22 16:43, Steffen Heil (Mailinglisten) wrote:

>Hi
>
>On my system /bin/ping has suid-bit set.
>So it it always executed as root, not as the user invoking it.
>
>As far as I know, ping requires root privileges...

Linux supports

	socket(AF_INET, SOCK_DGRAM, IPPROTO_ICMP)

since v3.0, so ping does not _strictly_ need root anymore - and 
meanwhile fixes your owner "mismatch".
