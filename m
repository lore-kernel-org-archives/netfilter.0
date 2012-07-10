From: Andreas Herz <andi@geekosphere.org>
Subject: Re: [ANNOUNCE] ipset 6.13 released
Date: Tue, 10 Jul 2012 11:12:55 +0200
Message-ID: <20120710091255.GP9358@workstation>
References: <alpine.DEB.2.00.1206292201340.29738@blackhole.kfki.hu>
 <20120701132152.GD9358@workstation>
 <alpine.DEB.2.00.1207011642300.2749@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.00.1207011642300.2749@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

On 01/07/12 at 16:44, Jozsef Kadlecsik wrote:
> On Sun, 1 Jul 2012, Andreas Herz wrote:
> 
> > On 29/06/12 at 22:04, Jozsef Kadlecsik wrote:
> > > I have just released ipset 6.13 with a few bugfixes and some new features.
> > 
> > Great, perfect timing, because i will go back to the testing and coding
> > stuff for my ipset setup :)
> > 
> > >  - Timeout fixing bug broke SET target special timeout value, fixed
> > >  - Use MSEC_PER_SEC instead of harcoded value
> > 
> > Does this also fix the jiffies issue with the kernel?
> 
> That was fixed in the previous version. 
> 

I thought so, but:

> > But i will see it in my testcases nevertheless.
> 
> I'm looking forward your testing results!

$IPSET create bset32 hash:ip family inet hashsize 1024 maxelem 65536
timeout 1000

ipset add bset32 192.168.0.21 timeout 2147483; ipset list
=> 192.168.0.21 timeout 2147482
ipset add bset32 192.168.0.20 timeout 2147485; ipset list
=> 192.168.0.20 timeout 1073650

although the range should be 0-4294967 as pointed when i enter a value
much higher.

This is for 32-Bit. But i still think this is caused by the kernel bug i
mentioned some time ago. Can you or anyone else confirm this issue with
32-Bit?
I have a workaround patch but i would love to get the maximum value to
lock IPs for more then ~12 days :)

-- 
Andreas Herz
