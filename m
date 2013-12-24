From: <remoteshaman.com@gmail.com>
Subject: compat_xtables.c:633: error: too few arguments to function 'ipv6_find_hdr'
Date: Tue, 24 Dec 2013 03:16:39 +0200
Message-ID: <642E6E7980C54326848418623297C590@torbaf407ff5ef>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:from:to:subject:date:mime-version:content-type
         :content-transfer-encoding;
        bh=m4BZ9XC31Qb4FO5vumIgs4huP44R0/lua/2TTyITrgM=;
        b=iKXf0MguaaAOjwmABnCVJOZLl36GYoVgJVOW0xAVUBCO6tl8mtE9j7B7GQkBJ491PB
         gNnBAohRSVaDlSLWMapDrbU3cuGQzhfehNq4W01i4kaAX4hz1vXx8cOZdvMiIG5JuuQu
         rokXcJLDNVRNU+Pfs85nM7xhyLr/rAW9/PTxNTY8cxFDPy02m3Yj8iEfYtxKgWg++mGU
         v/X5p3QWYSnVF2fvu/loI39R3rQ/7hnfCEwYaNTDKYGJZly9TZ0tb2Cq0oN0IZn9XZ6X
         uC5u+hJG3QQMoTwFcKml7iZlGaOIT4Di5JYk9s/7RPXkGVrTZ1xLXUh9GbVeV3EOWZ40
         T7gA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@vger.kernel.org

Hello!

compilation failed in CentOS: 2.6.32-431.1.2.0.1.el6.x86_64
--------------------------------------
# ./configure
# make
make  all-recursive
make[1]: Entering directory `/usr/local/src/xtables-addons-1.47.1'
Making all in extensions
make[2]: Entering directory 
`/usr/local/src/xtables-addons-1.47.1/extensions'
Xtables-addons 1.47.1 - Linux 2.6.32-431.1.2.0.1.el6.x86_64
if [ -n "/lib/modules/2.6.32-431.1.2.0.1.el6.x86_64/build" ]; then make -C 
/lib/
modules/2.6.32-431.1.2.0.1.el6.x86_64/build 
M=/usr/local/src/xtables-addons-1.47
.1/extensions modules; fi;
make[3]: Entering directory `/usr/src/kernels/2.6.32-431.1.2.0.1.el6.x86_64'
  CC [M]  /usr/local/src/xtables-addons-1.47.1/extensions/compat_xtables.o
/usr/local/src/xtables-addons-1.47.1/extensions/compat_xtables.c: In 
function 'x
tnu_ipv6_find_hdr':
/usr/local/src/xtables-addons-1.47.1/extensions/compat_xtables.c:633: error: 
too
 few arguments to function 'ipv6_find_hdr'
make[4]: *** 
[/usr/local/src/xtables-addons-1.47.1/extensions/compat_xtables.o]
Error 1
make[3]: *** [_module_/usr/local/src/xtables-addons-1.47.1/extensions] Error 
2
make[3]: Leaving directory `/usr/src/kernels/2.6.32-431.1.2.0.1.el6.x86_64'
make[2]: *** [modules] Error 2
make[2]: Leaving directory `/usr/local/src/xtables-addons-1.47.1/extensions'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/usr/local/src/xtables-addons-1.47.1'
make: *** [all] Error 2
--------------------------------------
# diff /usr/src/kernels/2.6.32-358.23.2.el6.x86_64/include/li
nux/netfilter_ipv6/ip6_tables.h 
/usr/src/kernels/2.6.32-431.1.2.0.1.el6.x86_64/i
nclude/linux/netfilter_ipv6/ip6_tables.h
320,322d319
< /* find specified header and get offset to it */
< extern int ipv6_find_hdr(const struct sk_buff *skb, unsigned int *offset,
<                        int target, unsigned short *fragoff);
-------------------------------------- 

