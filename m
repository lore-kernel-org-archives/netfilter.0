From: Andreas Herz <andi@geekosphere.org>
Subject: Re: [ANNOUNCE] ipset 6.13 released
Date: Sun, 1 Jul 2012 15:21:52 +0200
Message-ID: <20120701132152.GD9358@workstation>
References: <alpine.DEB.2.00.1206292201340.29738@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.00.1206292201340.29738@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On 29/06/12 at 22:04, Jozsef Kadlecsik wrote:
> I have just released ipset 6.13 with a few bugfixes and some new features.

Great, perfect timing, because i will go back to the testing and coding
stuff for my ipset setup :)

>  - Timeout fixing bug broke SET target special timeout value, fixed
>  - Use MSEC_PER_SEC instead of harcoded value

Does this also fix the jiffies issue with the kernel?
But i will see it in my testcases nevertheless.

-- 
Andreas Herz
