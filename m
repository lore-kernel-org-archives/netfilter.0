From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Building geoip against voyage kernel source fails
Date: Sun, 25 May 2008 21:14:43 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0805252112590.19084@fbirervta.pbzchgretzou.qr>
References: <5AEFF5D121FC4228B90797FB303741CD@Gamma> <74BD5BE091304EFC96F804EB2869AA99@Gamma>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <74BD5BE091304EFC96F804EB2869AA99@Gamma>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nick Pasich <NewsLetters@NickAndBarb.net>, David Balnaves <david@utopia.cable.nu>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

On Sunday 2008-05-25 19:30, Nick Pasich wrote:
>> 
>> I'm trying to build the voyage kernel source with after applying the group 
>> external patchlet.  i see this error.  Can anybody suggest what I'm doing 
>> wrong?  Also, where is the latest geoip patchlet?  Thanks
>> 
>>  CC [M]  net/ipv4/netfilter/ipt_geoip.o
>> net/ipv4/netfilter/ipt_geoip.c: In function 'match':
>> net/ipv4/netfilter/ipt_geoip.c:113: error: 'const struct sk_buff' has no 
>> member named 'nh'
>> net/ipv4/netfilter/ipt_geoip.c: At top level:
>> net/ipv4/netfilter/ipt_geoip.c:280: warning: initialization from 
>> incompatible pointer type
>> net/ipv4/netfilter/ipt_geoip.c:284: warning: initialization from 
>> incompatible pointer type
>> net/ipv4/netfilter/ipt_geoip.c: In function 'init':
>> net/ipv4/netfilter/ipt_geoip.c:291: error: implicit declaration of function 
>> 'ipt_register_match'
>> net/ipv4/netfilter/ipt_geoip.c: In function 'fini':
>> net/ipv4/netfilter/ipt_geoip.c:296: error: implicit declaration of function 
>> 'ipt_unregister_match'
>> make[4]: *** [net/ipv4/netfilter/ipt_geoip.o] Error 1
>> make[3]: *** [net/ipv4/netfilter] Error 2
>> make[2]: *** [net/ipv4] Error 2
>> make[1]: *** [net] Error 2
>> make[1]: Leaving directory `/usr/src/linux-source-2.6.23-voyage'
>> make: *** [debian/stamp-build-kernel] Error 2
>> voyage:/usr/src/linux-source-2.6.23-voyage# cd ..
>> voyage:/usr/src# rm -rf linux-source-2.6.23-voyage

Please see the Xtables-addons package, which has Nicolas's latest
geoip code (which was designed for 2.6.22) plus additional fixups, and 
extra code to make it work with 2.6.23 and up.
