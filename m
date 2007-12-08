From: Martijn Lievaart <m@rtij.nl>
Subject: Re: Completely DROP for UDP packets.
Date: Sat, 08 Dec 2007 21:34:54 +0100
Message-ID: <475AFFEE.5010906@rtij.nl>
References: <1368.121.163.60.159.1197142746.squirrel@211.111.194.2>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1368.121.163.60.159.1197142746.squirrel@211.111.194.2>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: msn@vtopia.co.kr
Cc: netfilter@vger.kernel.org

msn wrote:
> Hi, I'm trying to dropping all UDP packets from specific address
> but it still has higher CPU usages. anyone has ideas for this
> issues ? here's example
>
> A   --+--->  F
> B   --+
> C   --+
>
> A/B/C sending massive UDP packets to F, also it has address dropping
> rules fro A/B/C. Yes, it is works fine. But if i see the CPU usages
> of 'F' some of cases it is using more than 20-30% when its(A/B/C)
> sending 100M to F. is there any best way to decreasing the CPU usage
> of the 'F' ? thanks in advance.
>
> Cheers.
>
> P.S :
> 1. INPUT filter dropping very higher CPU usages
> 2. TARPIT and prestate PREROUTING dropping less higher but not satisfied.
>
>   

TARPITTING does not work on UDP, it's for TCP only. Just DROP in the raw 
table.

HTH,
M4

