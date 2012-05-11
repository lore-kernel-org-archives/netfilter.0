From: Andreas Herz <andi@geekosphere.org>
Subject: Re: [ANNOUNCE] ipset 6.12 released
Date: Fri, 11 May 2012 08:09:13 +0200
Message-ID: <20120511060913.GN27670@workstation>
References: <alpine.DEB.2.00.1205101211080.18562@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.00.1205101211080.18562@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On 10/05/12 at 12:18, Jozsef Kadlecsik wrote:
>  - Fix timeout value overflow bug at large timeout parameters
>    (bug reported by Andreas Herz)

I just tested and inspected your release, thanks for that.
But i can still reproduce the bug i reported.

You changed "ip_set_timeout_uget" but the bug occurs in
"ip_set_timeout_get" and the the userspace tool still reports a higher
range for the value (0-4294967).

> ipset create test hash:ip timeout 1000
> ipset add test 192.168.0.0/24 timeout 2147484
> ipset list

results in

> 192.168.0.0/24 timeout 1073741

on a 32 bit system.

But this is not really your fault, cause the kernel has a bug as i
mentioned here:

http://lkml.org/lkml/2012/4/20/36

But i didn't get a response yet :)

-- 
Andreas Herz
