From: "hare ram" <hareram@sol.net.in>
Subject: Problem with Redhad 8.0 with netfilter
Date: Fri, 8 Nov 2002 12:59:10 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002701c286f8$88c7c4c0$43723fca@nextto>
References: <NGBBJADKFGCJJDIPAKKGCEBKOKAA.mike2@myhome.net> <3DCA99E9.3B1F1F94@poeweb.com> <20021107164954.A31991@hamal.ipal.net>
Reply-To: "hare ram" <hareram@sol.net.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: isp-linux@isp-linux.com, netfilter@lists.samba.org

Hi all

i have patched the netfilter patches with time, iplimit, quota pached
its patched great
when iam compiling  kernal iam getting the following error.

iam using redhat 8.0 with 1.2.6a  iptables

any help will be appriciate.

hare

-------

/usr/src/linux-2.4.18-14/include/net/neighbour.h: In function
`neigh_confirm':
/usr/src/linux-2.4.18-14/include/net/neighbour.h:233:
`jiffies_Rsmp_0da02d67' undeclared (first use in this function)
/usr/src/linux-2.4.18-14/include/net/neighbour.h: In function
`neigh_event_send':
/usr/src/linux-2.4.18-14/include/net/neighbour.h:248:
`jiffies_Rsmp_0da02d67' undeclared (first use in this function)
In file included from /usr/src/linux-2.4.18-14/include/net/sock.h:107,
                 from cipe.h:69,
                 from module.c:15:
/usr/src/linux-2.4.18-14/include/net/dst.h: In function `dst_set_expires':
/usr/src/linux-2.4.18-14/include/net/dst.h:149: `jiffies_Rsmp_0da02d67'
undeclared (first use in this function)
In file included from cipe.h:69,
                 from module.c:15:
/usr/src/linux-2.4.18-14/include/net/sock.h: In function
`sk_filter_release':
/usr/src/linux-2.4.18-14/include/net/sock.h:934: warning: implicit
declaration of function `kfree_Rsmp_037a0cba'
/usr/src/linux-2.4.18-14/include/net/sock.h: In function `sock_orphan':
/usr/src/linux-2.4.18-14/include/net/sock.h:1009: `do_softirq_Rsmp_f0a529b7'
undeclared (first use in this function)
/usr/src/linux-2.4.18-14/include/net/sock.h: In function `sock_graft':
/usr/src/linux-2.4.18-14/include/net/sock.h:1018: `do_softirq_Rsmp_f0a529b7'
undeclared (first use in this function)
/usr/src/linux-2.4.18-14/include/net/sock.h: In function
`sock_recv_timestamp':
/usr/src/linux-2.4.18-14/include/net/sock.h:1266: warning: implicit
declaration of function `put_cmsg_Rsmp_f39bf4d9'
module.c: In function `cipe_check_kernel':
module.c:73: warning: implicit declaration of function
`printk_Rsmp_1b7d4074'
/usr/src/linux-2.4.18-14/include/linux/skbuff.h: In function
`kunmap_skb_frag':
/usr/src/linux-2.4.18-14/include/linux/skbuff.h:1108: warning: asm operand 1
probably doesn't match constraints
make[3]: *** [module.o] Error 1
make[3]: Leaving directory `/usr/src/linux-2.4.18-14/drivers/addon/cipe'
make[2]: *** [_modsubdir_cipe] Error 2
make[2]: Leaving directory `/usr/src/linux-2.4.18-14/drivers/addon'
make[1]: *** [_modsubdir_addon] Error 2
make[1]: Leaving directory `/usr/src/linux-2.4.18-14/drivers'
make: *** [_mod_drivers] Error 2



