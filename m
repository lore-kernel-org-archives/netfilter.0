From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: CPU usage of simple DROP rule
Date: Tue, 29 Sep 2009 21:27:44 +0200
Message-ID: <20090929212744.6679cfec@catlap>
References: <7d7f2e8c0909291131m5cd58372ta5907f1612d8fa05@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <7d7f2e8c0909291131m5cd58372ta5907f1612d8fa05@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Steve Fink <sphink@gmail.com>
Cc: netfilter@vger.kernel.org

Hello

>I have a single OUTPUT rule (drop a particular UDP host:port) that
>...
>My 8 cores are all at about 30% usage when I have no rules defined
>(and the packets are going out to the switch). When I add that rule,
>one of the cores shoots to 100%, another to 70% or so. The rest don't
>really change.

Looks like two cores are being hit by ksoftirqd. There are some paths
you can explore to achieve lower cpu usage/better core-load
distribution:
- try using smp_affinity - bind different nic irqs to different cores;
  you can also use bonding to achieve better traffic distribution
  among nics;
- are you using intel i/o at dma support? it should lower network
  overhead for localy generated traffic;
- try adjusting nic coalesce parameters - it should lower network
  cpu overhead at the cost of higher latency;

Cheers
Marek Kierdelewicz
