From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Iptables "-m time" option doesn't update when the clock
 changes
Date: Thu, 29 Mar 2012 11:12:08 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1203291111080.27349@frira.zrqbmnf.qr>
References: <4F7426FA.2060902@open-t.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4F7426FA.2060902@open-t.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sebastian Arcus <shop@open-t.co.uk>
Cc: netfilter@vger.kernel.org

On Thursday 2012-03-29 11:10, Sebastian Arcus wrote:

> I'm using the following line in my iptables firewall to block internet access
> for one of the machines on the network for one hour a day:
>
> Code:
>
> iptables -A FORWARD -p ALL -o $INET_IFACE -m mac --mac-source $BLOCKED_MAC1 -m
> time --timestart $BLOCKED_TIMESTART1 --timestop $BLOCKED_TIMESTOP1 -j DROP
>
>
> Everything works fine - except that when the clocks change from winter time to
> summer time (in UK) - the rule keeps on working on the old time.

This is documented behavior, see manpage (preferably that of a recent 
release).
