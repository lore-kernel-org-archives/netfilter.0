From: Andrea <andang76@gmail.com>
Subject: problems applying ipset patch
Date: Tue, 22 May 2007 12:30:11 +0200
Message-ID: <4652C633.902@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:user-agent:mime-version:to:subject:content-type:content-transfer-encoding;
	b=texbZRW8RipgIHionwo1d6TjfLXjTGVdgqRAVV7hVlIs6UyzKHgnxTQyy2iGBDt/KJphRj219+R9dq9yOz0hQh0L5AkW/cwVwawTqdeug5jEIBR4CWfl7RKVKffwYVmOOD+Ihuohms/JI5Q8f8eokFxXv/WY7d0fAxd3rS6er2Q=
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

hi, this is my first post here.  [don't know if I have to use the 
developer mailing list, sorry if i'm wrong].

I've tried to apply the ipset patch in my CentOS 4.4 distribution, 
without success.

I've followed instructions here 
http://www.howtoforge.com/kernel_compilation_centos_p2?s=aabdb730a09fa747d00f2b9a3ff431cc& 
   (CentOS Kernel Compile) and here 
http://ipset.netfilter.org/install.html (ipset patch apply).

The patch is applied successfully, but when I try to recompile, I obtain 
these errors (after a long list of compiled files):

...
   LD      .tmp_vmlinux1
net/built-in.o(.init.text+0x16f1): In function `ipt_ipset_init':
net/ipv4/netfilter/ipt_set.c:133: undefined reference to `xt_register_match'
net/built-in.o(.init.text+0x1700): In function `ipt_SET_init':
net/ipv4/netfilter/ipt_SET.c:151: undefined reference to 
`xt_register_target'
net/built-in.o(.exit.text+0x41): In function `ipt_ipset_fini':
net/ipv4/netfilter/ipt_set.c:138: undefined reference to 
`xt_unregister_match'
net/built-in.o(.exit.text+0x50): In function `ipt_SET_fini':
net/ipv4/netfilter/ipt_SET.c:156: undefined reference to 
`xt_unregister_target'
make: *** [.tmp_vmlinux1] Error 1

I've tried twice, using two combinations of kernel (downloaded from 
www.kernel.org) and patch-o-matic (downloaded first time from 
http://ipset.netfilter.org/, second from patch-o-matic snaptshots).

I've applied only the ipset patch (launching only the  ./runme set 
command, just as explained in the ipset site).

Maybe do I need to apply other patches from patch-o-matic?

Thanks for the help

