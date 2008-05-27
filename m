From: "David Balnaves" <david@utopia.cable.nu>
Subject: Re: Building geoip against voyage kernel source fails
Date: Tue, 27 May 2008 22:06:33 +1000
Message-ID: <DD56BDDE964B41BFA022050ADCFA948B@Gamma>
References: <5AEFF5D121FC4228B90797FB303741CD@Gamma> <74BD5BE091304EFC96F804EB2869AA99@Gamma> <alpine.LNX.1.10.0805252112590.19084@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0805252112590.19084@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Jan Engelhardt <jengelh@medozas.de>, Nick Pasich <NewsLetters@NickAndBarb.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

Hi,

Does the Xtables-addons work with iptables-1.3.6?  From what I can see this 
is part of iptables-1.4.  If I want to use earlier than 1.4 I should 
probably stick to peejix's patchlet right?

----- Original Message ----- 
From: "Jan Engelhardt" <jengelh@medozas.de>
To: "Nick Pasich" <NewsLetters@NickAndBarb.net>; "David Balnaves" 
<david@utopia.cable.nu>
Cc: "Mail List - Netfilter" <netfilter@vger.kernel.org>
Sent: Monday, May 26, 2008 5:14 AM
Subject: Re: Building geoip against voyage kernel source fails


> On Sunday 2008-05-25 19:30, Nick Pasich wrote:
>>>
>>> I'm trying to build the voyage kernel source with after applying the 
>>> group
>>> external patchlet.  i see this error.  Can anybody suggest what I'm 
>>> doing
>>> wrong?  Also, where is the latest geoip patchlet?  Thanks
>>>
>>>  CC [M]  net/ipv4/netfilter/ipt_geoip.o
>>> net/ipv4/netfilter/ipt_geoip.c: In function 'match':
>>> net/ipv4/netfilter/ipt_geoip.c:113: error: 'const struct sk_buff' has no
>>> member named 'nh'
>>> net/ipv4/netfilter/ipt_geoip.c: At top level:
>>> net/ipv4/netfilter/ipt_geoip.c:280: warning: initialization from
>>> incompatible pointer type
>>> net/ipv4/netfilter/ipt_geoip.c:284: warning: initialization from
>>> incompatible pointer type
>>> net/ipv4/netfilter/ipt_geoip.c: In function 'init':
>>> net/ipv4/netfilter/ipt_geoip.c:291: error: implicit declaration of 
>>> function
>>> 'ipt_register_match'
>>> net/ipv4/netfilter/ipt_geoip.c: In function 'fini':
>>> net/ipv4/netfilter/ipt_geoip.c:296: error: implicit declaration of 
>>> function
>>> 'ipt_unregister_match'
>>> make[4]: *** [net/ipv4/netfilter/ipt_geoip.o] Error 1
>>> make[3]: *** [net/ipv4/netfilter] Error 2
>>> make[2]: *** [net/ipv4] Error 2
>>> make[1]: *** [net] Error 2
>>> make[1]: Leaving directory `/usr/src/linux-source-2.6.23-voyage'
>>> make: *** [debian/stamp-build-kernel] Error 2
>>> voyage:/usr/src/linux-source-2.6.23-voyage# cd ..
>>> voyage:/usr/src# rm -rf linux-source-2.6.23-voyage
>
> Please see the Xtables-addons package, which has Nicolas's latest
> geoip code (which was designed for 2.6.22) plus additional fixups, and
> extra code to make it work with 2.6.23 and up.
> 

