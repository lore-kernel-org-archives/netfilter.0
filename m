From: "David Balnaves" <david@utopia.cable.nu>
Subject: Building geoip against voyage kernel source fails
Date: Sun, 25 May 2008 15:11:10 +1000
Message-ID: <5AEFF5D121FC4228B90797FB303741CD@Gamma>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Hi,

I'm trying to build the voyage kernel source with after applying the group 
external patchlet.  i see this error.  Can anybody suggest what I'm doing 
wrong?  Also, where is the latest geoip patchlet?  Thanks

  CC [M]  net/ipv4/netfilter/ipt_geoip.o
net/ipv4/netfilter/ipt_geoip.c: In function 'match':
net/ipv4/netfilter/ipt_geoip.c:113: error: 'const struct sk_buff' has no 
member named 'nh'
net/ipv4/netfilter/ipt_geoip.c: At top level:
net/ipv4/netfilter/ipt_geoip.c:280: warning: initialization from 
incompatible pointer type
net/ipv4/netfilter/ipt_geoip.c:284: warning: initialization from 
incompatible pointer type
net/ipv4/netfilter/ipt_geoip.c: In function 'init':
net/ipv4/netfilter/ipt_geoip.c:291: error: implicit declaration of function 
'ipt_register_match'
net/ipv4/netfilter/ipt_geoip.c: In function 'fini':
net/ipv4/netfilter/ipt_geoip.c:296: error: implicit declaration of function 
'ipt_unregister_match'
make[4]: *** [net/ipv4/netfilter/ipt_geoip.o] Error 1
make[3]: *** [net/ipv4/netfilter] Error 2
make[2]: *** [net/ipv4] Error 2
make[1]: *** [net] Error 2
make[1]: Leaving directory `/usr/src/linux-source-2.6.23-voyage'
make: *** [debian/stamp-build-kernel] Error 2
voyage:/usr/src/linux-source-2.6.23-voyage# cd ..
voyage:/usr/src# rm -rf linux-source-2.6.23-voyage

-- 
David Balnaves
david@utopia.cable.nu

