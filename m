From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Question about dropped packets
Date: Tue, 19 Oct 2010 07:51:19 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1010190748110.2667@obet.zrqbmnf.qr>
References: <4CBD21C7.2080604@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CBD21C7.2080604@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: JD <jd1008@gmail.com>
Cc: netfilter@vger.kernel.org

On Tuesday 2010-10-19 06:42, JD wrote:

> I am seeing a lot of
>
> Dropped by firewall: IN=wlan0 OUT=
> MAC=ff:ff:ff:ff:ff:ff:60:fb:42:d1:69:71:08:00 SRC=0.0.0.0 DST=255.255.255.255
> LEN=328 TOS=0x00 PREC=0x00 TTL=255 ID=25801 PROTO=UDP SPT=68 DPT=67 LEN=308
>
>
> How can I know who is sending it

60:fb:42:d1:69:71 is. If it's wired, you can track down its location.

> I have no idea if it is coming from the lan or from the wan?

"wlan0" of course.
