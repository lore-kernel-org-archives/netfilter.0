From: kamal.garg@mobileinternet.co.in
Subject: getting kernel compilation error after applying patches using p-o-m
Date: Mon, 24 Nov 2008 21:13:43 -0500 (EST)
Message-ID: <1120.121.246.53.238.1227579223.squirrel@mobileinternet.co.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,
I am trying to build IPTable-1.4.2 with Red Hat Linux v4 U3 -
kernel-2.6.9-34.EL. I have taken the following steps-

I downloaded source code of iptables-1.4.2. I compiled and installed the
IPTables-1.4.2 using the following command.

# make
# make install
# and then I rebooted linux

Then, I used the patch-o-matic to apply the set of patches( I
downloaded the patch-o-match-ng using git clone,
git://git.netfilter.org/patch-o-matic-ng)

I am having kernel-2.6.9.34EL source code at
/usr/src/kernel-2.6.9/linux-2.6.9 and IPTable-1.4.2 source code at
/usr/src/iptables-1.4.2

I used the following steps to apply the patches-

[root@RHEL4U3 patch-o-matic-ng]# export
KERNEL_DIR=/usr/src/kernel-2.6.9/linux-2.6.9/

[root@RHEL4U3 patch-o-matic-ng]# export
IPTABLES_DIR=/usr/src/iptables-1.4.2/

[root@RHEL4U3 patch-o-matic-ng]# ./runme base

I applied all patches (which applies cleanly) and then used the following
steps to build the kernel-

[root@RHEL4U3]# make oldconfig
[root@RHEL4U3]# make menuconfig
[root@RHEL4U3]# make

While making the Kernel, I encountered the following compilation errors-

"net/ipv4/netfilter/ipt_ipv4options.c:160: error: unknown field `matchsize'
specified in initializer
net/ipv4/netfilter/ipt_ipv4options.c:160: warning: initialization makes
pointer from integer without a cast
net/ipv4/netfilter/ipt_ipv4options.c:161: warning: initialization from
incompatible pointer type
make[3]: *** [net/ipv4/netfilter/ipt_ipv4options.o] Error 1
make[2]: *** [net/ipv4/netfilter] Error 2
make[1]: *** [net/ipv4] Error 2
make: *** [net] Error 2"

Can this error occur because of compatibility issue between
Kernel-2.6.9.34EL and IPTable-1.4.2? If yes then which is the best
compatible version of IPTable for Kernel-2.6.9.34EL?

If there is no compatibility issue, can you please suggest me how to solve
the above error?

Thanks,
Kamal









