From: don-nf@isis.cs3-inc.com (Don Cohen)
Subject: module build problem - .#xxx.h.y.z files?
Date: Wed, 4 Sep 2002 08:54:32 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209041554.g84FsWj22378@isis.cs3-inc.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

This is probably not a netfilter specific problem but I send it here
cause it's a netfilter related module giving me the trouble.
In a 2.4.17 tree I do
 make modules
and get 
 ...
 make -C ipv4/netfilter modules
 make[2]: Entering directory `/home/user/linux-2.4.17/net/ipv4/netfilter'
 gcc -D__KERNEL__ -I ...
  -c ip_conntrack_standalone.c
 ip_conntrack_standalone.c:268: `NET_IPV4_NF_CONNTRACK_MAX' undeclared
  here (not in a function)
 ... lots more similar errors

The things that are not defined appear in only one file,
include/linux/.#sysctl.h.1.3

The above .c file does include sysctl.h and I see a few other such .#
files in the include/linux directory above.  I get the feeling that
there's some sneaky mechanism that's supposed to generate and include
these .# files but I don't see what it is let alone why it's not working.

Any advice?







