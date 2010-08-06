From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Different limits in 32bit vs 64bit?
Date: Fri, 6 Aug 2010 22:05:21 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1008062203190.15439@obet.zrqbmnf.qr>
References: <4C5C2DE4.8080007@gac.edu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C5C2DE4.8080007@gac.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ethan Sommer <sommere@gac.edu>
Cc: netfilter@vger.kernel.org


On Friday 2010-08-06 17:44, Ethan Sommer wrote:
>
> Problem: This week we attempted to move our traffic shaping box to a new
> machine. The old one is 32 bit Centos. The new box was running Centos 5.5
> x86_64. When we went to "restore" our /etc/sysconfig/iptables file, it failed
> on the COMMIT line. We could get it to work if we only did the first 101 class
> C subnets.
>
> I just reinstalled Centos on the new machine running 32 bit, and now it can
> load the exact same file it failed on with 64 bit.
>
>
> Is this a known limitation of Netfilter/iptables? Is it a bug?

Probably a very _classic_ bug. Because CentOS uses such outdated software
(kernel 2.6.18 iptables 1.3.5), anything can happen. I'm not completely
sure, but I think 64-bit issues were not completely addressed until
at least 2.6.20. So yeah with RHEL/CentOS you easily have problems..
