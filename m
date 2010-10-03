From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipporthash, ipportiphash, ipportnethash problems
Date: Sun, 3 Oct 2010 21:13:54 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1010032106460.26617@blackhole.kfki.hu>
References: <4CA5091B.1090200@googlemail.com> <alpine.DEB.2.00.1010010913200.11563@blackhole.kfki.hu> <4CA5C48E.9010603@googlemail.com> <alpine.DEB.2.00.1010012302530.19869@blackhole.kfki.hu> <4CA70B3B.90001@googlemail.com> <alpine.DEB.2.00.1010022104571.23216@blackhole.kfki.hu>
 <4CA7978B.9020900@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CA7978B.9020900@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: netfilter@vger.kernel.org

On Sat, 2 Oct 2010, Mr Dash Four wrote:

> OK, I quickly tested the new version with my previous test on the ssh port and
> it all works now, though I found some other (minor) issues:
> 
> When I do 'make IP_NF_SET_MAX=xx IP_NF_SET_HASHSIZE=xx' and then do 'make
> install' (as root) both values I have given during my first 'make' were
> completely disregarded.
> 
> If I do 'make IP_NF_SET_MAX=xx IP_NF_SET_HASHSIZE=xx' and 'make
> IP_NF_SET_MAX=xx IP_NF_SET_HASHSIZE=xx install' I can see that at least the
> default hash size has also been disregarded (built a set without specifying
> --hashsize and when I executed 'ipset -L' the hashsize was 1024 and not the
> number I have given during make). I cannot check whether IP_NF_SET_MAX has
> also been disregarded (don't know how to do it!).

IP_NF_SET_MAX is honored. Run "make ... V=1" and you see that the value is 
passed to CONFIG_IP_NF_SET_MAX which is used up directly in 
kernel/ip_set.c. However, IP_NF_SET_HASHSIZE is forgotten and not 
referenced in the userspace code, so setting the default hashsize at 
compiling time does not work yet.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
