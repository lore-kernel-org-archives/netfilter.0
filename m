From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: conntrack-tools 0.9.14 can not block the connection
Date: Fri, 7 May 2010 09:55:44 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1005070954230.32277@obet.zrqbmnf.qr>
References: <201005061651.40203.rfeng@wurldtech.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201005061651.40203.rfeng@wurldtech.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Feng <rfeng@wurldtech.com>
Cc: netfilter@vger.kernel.org

On Friday 2010-05-07 01:51, Richard Feng wrote:

>Hi,
>
>I am using Linux 2.6.29. I have the problem for using 'conntrack' 
>(version:0.9.14) to block the traffic.
>Using the following command as example:
>  conntrack -D -s 1.1.1.1 -d 2.2.2.2
>After execution, it appears the connection info was deleted -
>  conntrack -L | grep 1.1.1.1 -- shows the entry was deleted.

If something does not exist, conntrack won't output it.

>However, the connection is still active - is this the correct behaviour? 

Yes.

>>From the documentation (from conntrack-tools.netfilter.org), somewhere it says 
>that "have to set /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_be_liberal to 
>zero".There is simply no 'netfilter' folder under my 
>folder '/proc/sys/net/ipv4'. Is this the problem? How could I fix it?

Upgrading to a newer kernel (you're probably running some stoneage 
thing).
