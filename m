From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: [ANNOUNCE] ipset 6.5 released
Date: Tue, 17 May 2011 13:51:32 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1105171346350.31927@blackhole.kfki.hu>
References: <alpine.DEB.2.00.1105151540340.25248@blackhole.kfki.hu> <4DD145C0.4060705@googlemail.com> <alpine.DEB.2.00.1105170941590.31848@blackhole.kfki.hu> <4DD255EF.1040209@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DD255EF.1040209@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: netfilter@vger.kernel.org

On Tue, 17 May 2011, Mr Dash Four wrote:

> I have quickly tried the new version last night on a freshly compiled kernel
> (with ipset kernel modules included into the kernel - not as modules though) -
> the loading performance of "bulk" ranges is much, much better now, though I've
> got an error when trying to load a set which consisted of just 3 different
> subnet ranges (that set was using the "old" treemap syntax). When I have some
> more time - probably later this evening - I will post details of that error (I
> think it was to do with hashes again).

Just send me the errors. The "treemap" backward compatibility support did 
not change between 6.4 and 6.5.
 
> Also, I don't know whether you will be interested in this, but when I modified
> ipset 4.5 in order to split the kernel modules from the userspace tool and
> include these in two separate building streams for my systems, I managed to
> change ipset 4.5 to enable the use of autogen/automake tools and then the
> execution of "./configure" as part of building that package. As part of that
> process I introduced 2 extra "parameters" to it - "--hash-size" and
> "--max-elements". I could send you this patch to "refresh" the ipset 4.5
> version or just have a look at it, if you so desire - just let me know. ipset
> 4.5 has served me very well since I started using it and was a vital
> contributor to the improved stability and performance on all my systems.

More control over the building process is good, so I'm interested in your 
patches.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
