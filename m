From: Rickard Eriksson <riceri@home.se>
Subject: Can't install iptables 1.2.7a
Date: Thu, 10 Oct 2002 21:28:45 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DA5D4ED.9020208@home.se>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I can't install iptables 1.2.7a

When i try to install i get this:

# make KERNEL_DIR=/usr/src/linux-2.4.19
Extensions found:
cc -O2 -Wall -Wunused -I/usr/src/linux-2.4.19/include -Iinclude/ 
-DIPTABLES_VERSION=\"1.2.7a\"  -fPIC -o extensions/libipt_conntrack_sh.o 
-c extensions/libipt_conntrack.c
In file included from 
/usr/src/linux-2.4.19/include/linux/netfilter_ipv4/ip_conntrack.h:65,
                 from extensions/libipt_conntrack.c:12:
/usr/src/linux-2.4.19/include/linux/netfilter_ipv4/ip_conntrack_mms.h:6:2: 
#error Only in kernel.
make: *** [extensions/libipt_conntrack_sh.o] Error 1


anyone that can help me?



