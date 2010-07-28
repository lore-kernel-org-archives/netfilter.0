From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: How Expensive?
Date: Wed, 28 Jul 2010 08:12:57 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1007280811370.26636@obet.zrqbmnf.qr>
References: <4C4F7893.9020900@abpni.co.uk> <B163F0EB-13C5-4804-95D2-31224AFC296C@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <B163F0EB-13C5-4804-95D2-31224AFC296C@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Payam Chychi <pchychi@gmail.com>
Cc: Jonathan Tripathy <jonnyt@abpni.co.uk>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Wednesday 2010-07-28 03:17, Payam Chychi wrote:

>it's much less and actually recommended than running all rules in 
>default/less chains as each pkt must traverse the entire chain to be 
>processed

Packets need not traverse an entire chain! All of -j ACCEPT, -j DROP,
-j RETURN and -g xxx cause an early exit from the current chain in one 
way or another.
