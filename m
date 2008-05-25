From: Nick Pasich <NewsLetters@NickAndBarb.net>
Subject: Re: Building geoip against voyage kernel source fails
Date: Sun, 25 May 2008 10:30:36 -0700
Message-ID: <20080525173036.GA8767@69.17.112.251>
References: <5AEFF5D121FC4228B90797FB303741CD@Gamma>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5AEFF5D121FC4228B90797FB303741CD@Gamma>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Balnaves <david@utopia.cable.nu>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

David,


I received this from "NICOLAS BOULIANE <nicboul@gmail.com>" awhile back...


***************************************************************************
***************************************************************************

Hello Nick,

I updated geoip,

now the new pom-ng url is:
http://people.netfilter.org/acidfu/patchlets/

change it manually in your pom-ng/sources.list ....
Peejix will send a patch soon so the url will be directly change.

Keep me in touch,
thank you

Nicolas Bouliane

***************************************************************************
***************************************************************************

On Sun, May 25, 2008 at 03:11:10PM +1000, David Balnaves wrote:
> Hi,
> 
> I'm trying to build the voyage kernel source with after applying the group 
> external patchlet.  i see this error.  Can anybody suggest what I'm doing 
> wrong?  Also, where is the latest geoip patchlet?  Thanks
> 
>  CC [M]  net/ipv4/netfilter/ipt_geoip.o
> net/ipv4/netfilter/ipt_geoip.c: In function 'match':
> net/ipv4/netfilter/ipt_geoip.c:113: error: 'const struct sk_buff' has no 
> member named 'nh'
> net/ipv4/netfilter/ipt_geoip.c: At top level:
> net/ipv4/netfilter/ipt_geoip.c:280: warning: initialization from 
> incompatible pointer type
> net/ipv4/netfilter/ipt_geoip.c:284: warning: initialization from 
> incompatible pointer type
> net/ipv4/netfilter/ipt_geoip.c: In function 'init':
> net/ipv4/netfilter/ipt_geoip.c:291: error: implicit declaration of function 
> 'ipt_register_match'
> net/ipv4/netfilter/ipt_geoip.c: In function 'fini':
> net/ipv4/netfilter/ipt_geoip.c:296: error: implicit declaration of function 
> 'ipt_unregister_match'
> make[4]: *** [net/ipv4/netfilter/ipt_geoip.o] Error 1
> make[3]: *** [net/ipv4/netfilter] Error 2
> make[2]: *** [net/ipv4] Error 2
> make[1]: *** [net] Error 2
> make[1]: Leaving directory `/usr/src/linux-source-2.6.23-voyage'
> make: *** [debian/stamp-build-kernel] Error 2
> voyage:/usr/src/linux-source-2.6.23-voyage# cd ..
> voyage:/usr/src# rm -rf linux-source-2.6.23-voyage
> 
> -- 
> David Balnaves
> david@utopia.cable.nu
> 
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
--------
WebSite: http://NickAndBarb.net
--------

