From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Packets stops traversing after nat PREROUTING
Date: Wed, 14 Apr 2010 11:59:08 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1004141158560.9397@obet.zrqbmnf.qr>
References: <s2sc4ada2161004140130ve00e5873qc38aebaa842d3b6e@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <s2sc4ada2161004140130ve00e5873qc38aebaa842d3b6e@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oguz Yilmaz <oguzyilmazlist@gmail.com>
Cc: netfilter@vger.kernel.org

On Wednesday 2010-04-14 10:30, Oguz Yilmaz wrote:

>OS is CentOS 5.4
>Kernel is 2.6.18-164
>
>Sometimes my firewall blocks the internet. When I inspect I have seen:
>- nat PREROUTING counters increase
>- filter FORWARD counters do not increase
>- nat POSTROUTING counters do not increase
>
>According to the diagram of Engelhardt,
>http://jengelh.medozas.de/images/nf-packet-flow.png, the problem
>should be in Bridging Decision point or acc.to former diagrams in
>Routing Decision point.
>
>I have tried to flush routing cache by "ip ro fl ca".
>
>Problem is recovered only after /etc/init.d/iptables stop / start
>
>I need further cues for deepen the problem, or exact reasons for
>updating/recompling to newer kernel/netfilter.

We need further cues like the ruleset.
