From: Kiet Tran <kiet@pillarsys.com>
Subject: Missing iptables file and compiling problem when upgrading iptables to 1.3.0
Date: Wed, 02 Mar 2005 04:58:32 -0800
Message-ID: <4225B878.7010105@pillarsys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hi there;

I am using a BlueCat distribution of Linux Kernel 2.6.7 on an x86 target.

1) When enabled iptables and netfilter options in the kernel config, the 
kernel
seems to be recompiled without a problem; however, I could not find the 
executable
iptables anywhere. I need it for trying out Rusty's tutorial to 
add/delete rules, etc.

2) Downloaded iptables 1.3.0 release, the code failed compilation with 
the errors
similar to what reported by Eric Poulin in July 2004, replied by Jose 
Teves. I pasted
the original email at the end of this message.

I would like to check if I need to apply the patch-o-matic (the lastest 
version?) first then
upgrade to 1.3.0 or if there is a method to remove the previous 
netfilter out of the kernel
prior to placing 1.3.0.

3) I compiled and upgraded 1.3.0 to my host RH 9.0 running 2.4.x . 
Without any rules
added (iptables -L showing empty), I found that my system is having 
trouble with resolving
hostnames with DNS servers. Has anybody seen a similar problem?

Thank you in advanced.
Regards,
Kiet



>----- Original Message -----=20
>From: "Eric Poulin" <epoulin@onepost.net <mailto:epoulin@onepost.net>>
>To: <netfilter@lists.netfilter.org <mailto:netfilter@lists.netfilter.org>>
>Sent: Tuesday, July 06, 2004 3:28 PM
>Subject: Problem compiling Iptables 1.2.11 on Kernel 2.6.7
>
>
>
>
>>Hello Guys,
>>
>>Any people succesfully compiled iptables 1.2.11 on 2.6.7?  Oddly, even
>>without applying any patch-o-matics packages, I'm getting the following
>>error while doing the make:
>>
>># make BINDIR=3D/sbin KERNEL_DIR=3D/usr/src/linux
>>Making dependencies: please wait...
>>Extensions found: IPv4:ROUTE IPv4:recent IPv6:ROUTE IPv6:ah IPv6:esp
>>IPv6:frag IPv6:ipv6header IPv6:hbh IPv6:dst IPv6:rt
>>
>>
>>
>gcc -O2 -Wall -Wunused -I/usr/src/linux/include -Iinclude/ -DIPTABLES_VE=
RSI
O
>
>
>>N=3D\"1.2.11\"  -fPIC -o extensions/libipt_ah_sh.o -c extensions/libipt=
_ah.c
>>In file included from include/libiptc/libiptc.h:6,
>>                 from include/iptables.h:5,
>>                 from extensions/libipt_ah.c:8:
>>/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:255: warning: n=
o
>>semicolon at end of struct or union
>>/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:255: error: syn=
tax
>>error before '*' token
>>/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:259: error: syn=
tax
>>error before '}' token
>>/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:339: warning: t=
ype
>>defaults to `int' in declaration of `DECLARE_MUTEX'
>>/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:339: warning:
>>parameter names (without types) in function declaration
>>/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:339: warning:
>>`DECLARE_MUTEX' declared `static' but never defined
>>make: *** [extensions/libipt_ah_sh.o] Error 1
>>
>>
>>I'm getting this with a vanilla source code of the kernel and iptables.=
 I
>>was getting those with the patch-o-matic installed, but I wanted to nar=
row
>>it down. Kernel can compile easily those modules that are coming from
>>iptables 1.2.9.
>>
>>Any idea?
>>
>>Eric

