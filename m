From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Bug in ipset with big timeouts
Date: Fri, 20 Apr 2012 15:31:57 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1204201531010.1373@blackhole.kfki.hu>
References: <20120419124750.GA22975@sweethome.fritz.box>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20120419124750.GA22975@sweethome.fritz.box>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Herz <andi@geekosphere.org>
Cc: netfilter@vger.kernel.org

Hi,

On Thu, 19 Apr 2012, Andreas Herz wrote:

> If you create sets or add an element with a big timeout this can result
> in a wrong timeout or even no entry. This occurs on 32 and 64 Bit and
> the problem comes from the msecs_to_jiffies function. But first the
> steps to reproduce the bug:
> 
> x86_64/amd64:
>  
> > ipset create test1 hash:net timeout 4294967
> > ipset create test2 hash:net timeout 4294968
> > ipset add test1 192.168.0.0/24
> > ipset add test2 192.168.0.0/24
> > ipset list
> 
> this will result in an empty test2 set and in an test1 set with the
> entry and correct timeout.
> 
> Another example
> 
> > ipset create test hash:net timeout 1
> > ipset add test 192.168.0.0/24 timeout 4294968
> > ipset list
> 
> empty list, but
> 
> > ipset add test 192.168.0.0/24 timeout 42949680
> > ipset list
> 
> results in
> 
> > 192.168.0.0/24 timeout 5
> 
> so an overflow.
> 
> x86/32-Bit:
> 
> > ipset create test hash:net timeout 1000
> > ipset add test 192.168.0.0/24 timeout 2147484
> > ipset list
> 
> results in:
> 
> > 192.168.0.0/24 timeout 1073741
> 
> it's working up to 2147483.
> 
> This is imho a bug as ipset says 
> 
> > ipset v6.11: Syntax error: '4294967296' is out of range 0-4294967295
> 
> so 4294967295 should be the maximum and it isn't.
> 
> I checked the source code and i think the following fix could help:
> 
> in kernel/include/linux/netfilter/ipset/ip_set_timeout.h the
> ip_set_timeout_set needs to look like this:
> 
> > if ((timeout > (INT_MAX/1000)) || ((int)(timeout*1000) < 0)) timeout =
> > (INT_MAX/1000);
> > t = msecs_to_jiffies(timeout * 1000) + jiffies;
> 
> I added this if clause so "t" won't get bigger then 2147483 (32-Bit) or
> 4294967 (64-Bit). The problem is, that msecs_to_jiffies() returns
> "MAX_JIFFY_OFFSET" in the case mentioned at 32-Bit, this explains the
> 1073741 value. And with the other values there is an overflow. My fix
> may be wrong, so no guarantee, i'm still testing around and the overflow
> isn't clear to me right now, i just figured out the problem with
> "MAX_JIFFY_OFFSET".

It looks like a bug, I'm going to fix it at the weekend. A new ipset 
release is to be expected...

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
