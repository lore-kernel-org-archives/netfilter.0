From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrack performance test results in INVALID packets
Date: Fri, 18 Jul 2008 14:14:20 +0200
Message-ID: <4880891C.4090004@netfilter.org>
References: <488064DD.5080509@bock.nu> <alpine.LNX.1.10.0807181212331.12734@fbirervta.pbzchgretzou.qr> <488075F1.80901@bock.nu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <488075F1.80901@bock.nu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bernhard Bock <mailinglists@bock.nu>
Cc: Jan Engelhardt <jengelh@medozas.de>, netfilter@vger.kernel.org

Bernhard Bock wrote:
> Jan,
> 
> Jan Engelhardt schrieb:
>> Vague guess..
>> You have too few memory and/or your connection table is full, hence
>> connections are dropped and future packets can't find their
>> original connection, resulting in INVALID. (Though I'd say they
>> should become NEW again)
> 
> Thanks for your answer. How can I check and/or increase the memory limit
> for the netfilter connection tracking?
> 
> The machine has 4G of RAM, so I guess the overall memory should not be a
> problem.

This document is a nice kick off:

http://www.wallfire.org/misc/netfilter_conntrack_perf.txt

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
