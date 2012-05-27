From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: 'swap table' feature
Date: Sun, 27 May 2012 14:03:36 -0400
Message-ID: <201205271403.36372.neal.p.murphy@alum.wpi.edu>
References: <201205231725.58158.neal.p.murphy@alum.wpi.edu> <alpine.LNX.2.01.1205232352360.9230@frira.zrqbmnf.qr>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1205232352360.9230@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Wednesday 23 May 2012 17:53:39 Jan Engelhardt wrote:
> What, never heard of iptables-restore? Atomic replace has been in
> iptables since a long long time.

Yes, now that a few more neurons have fired, I experimented with iptables-
restore a while back.

I tested iptables-restore alongside Smoothwall/Roadster's ipbatch (custom 
libiptc interface). I don't recall the system details exactly; the kernel 
would've been around 2.6.32 and iptables would've been around 1.4.8. SWE3's 
ipbatch program was generally 5% faster than iptables-restore. Nothing to 
write home about. The bigger deal was that both programs exhibited errors when 
I applied more than 14k-25k rules without a commit. As long as there was a 
commit every 14k-25k rules, I could enter well over 250k rules; IIRC, I 
entered more than 1M rules a time or two.

Granted, not many systems have more than 14k rules. And I haven't tested newer 
versions of the software since. But I believe that 14k-25k limit was enough to 
prevent a larger table from being atomically replaced.

N
