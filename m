From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: 'swap table' feature
Date: Wed, 23 May 2012 23:53:39 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1205232352360.9230@frira.zrqbmnf.qr>
References: <201205231725.58158.neal.p.murphy@alum.wpi.edu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201205231725.58158.neal.p.murphy@alum.wpi.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Cc: netfilter@vger.kernel.org

On Wednesday 2012-05-23 23:25, Neal Murphy wrote:

>I knew I'd eventually remember why I subscribed to this list....
>
>While working on enhancing my firewall, it occurred to me that it'd be real 
>nice to have a 'swap chain' feature in iptables that is equivalent to the 
>'swap set' feature in ipset.

>Such a feature would minimize the amount of time that rules are unavailable 
>when adding, changing or deleting them. At present, all the rules in the chain 
>being modified are deleted, then the new rules are added. So there is a period 
>of time, albeit brief, that rules are not available in that chain.

What, never heard of iptables-restore? Atomic replace has been in 
iptables since a long long time.
