From: Joe Judge <joe_judge@guardium.com>
Subject: Re: to patch, or not to patch? --- 1.2.7a mucked up?
Date: 27 Mar 2003 17:02:34 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1048802554.1342.17.camel@midgard.guardium.com>
References: <1048778825.17439.7.camel@midgard.guardium.com>
	 <001301c2f481$67a1a300$0e0aa8c0@Nussele>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001301c2f481$67a1a300$0e0aa8c0@Nussele>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: netfilter@lists.netfilter.org


Summary -- 
	Why does the recent patch-o-matic version have 
	extra/ROUTE code that uses "ifname" and "ipto" in
	a structure ... when ... iptables 1.2.7a tries to 
	compile ROUTE support which uses "if_name" and
	"if_index" ??

What version of iptables code goes with what version of
patch-o-matic ?




---- details -----------
problem: need linux box connected to switch mirror/span port on 
	eth0 to take packets TO hostA and burp them out eth1 and
	also take packets FROM hostA and burp them our eth2

I appreciate Cedric's posting. This widens the range of choices
available to me.

They are:
1	- install BSD or drag my sparc20/solaris box here
	and configure IPFilter to 
	take all packets from x.x.x.x and burp them out interface-1
	take all packets to x.x.x.x and burp them out of interface-2
	(known solution, I've done it before)

2	- try Cedric's LARC solution

or
3	- Continue banging my head against POM + iptables



So, of course I'm continuing down the #3 path :-)
(no pain, no gain)

Pulled down redhat8.0 kernel source ... did a "make mrproper"
because they bundled it in a dorky state. 


I pulled down iptables 1.2.6a and 1.2.7a and patch-o-matic20030107.
	cd p-o-m
	KERNEL_DIR=/usr/src/linux-2.4 ./runme extra/ROUTE.patch
	cd ../iptables1.2.7a
	make KERNEL_DIR=/usr/src/linux-2.4

---------got this --------------------------------

Extensions found: IPv4:ROUTE
cc -O2 -Wall -Wunused -I/usr/src/linux-2.4/include -Iinclude/ -DIPTABLES_VERSION=\"1.2.7a\"  -fPIC -o extensions/libipt_ROUTE_sh.o -c extensions/libipt_ROUTE.c
extensions/libipt_ROUTE.c: In function `parse':
extensions/libipt_ROUTE.c:61: structure has no member named `if_name'
extensions/libipt_ROUTE.c:64: structure has no member named `if_name'
extensions/libipt_ROUTE.c:66: structure has no member named `if_name'
extensions/libipt_ROUTE.c:67: structure has no member named `if_index'
extensions/libipt_ROUTE.c:80: structure has no member named `if_name'
extensions/libipt_ROUTE.c:81: structure has no member named `if_index'
extensions/libipt_ROUTE.c:86: structure has no member named `if_index'
extensions/libipt_ROUTE.c: In function `print':
extensions/libipt_ROUTE.c:119: structure has no member named `if_name'
extensions/libipt_ROUTE.c:120: structure has no member named `if_name'
extensions/libipt_ROUTE.c:122: structure has no member named `if_index'
make: *** [extensions/libipt_ROUTE_sh.o] Error 1






It looks like the include is:
/usr/src/linux-2.4.18-27.8.0/include/linux/netfilter_ipv4/ipt_ROUTE.h

which only has:

struct ipt_route_target_info {
        char ifname[IPT_ROUTE_IFNAMSIZ];
        unsigned int ipto;
};




