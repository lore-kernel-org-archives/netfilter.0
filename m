From: Dian Brits <dian.brits@epiuse.com>
Subject: Compile problems with iptables 1.2.7
Date: Tue, 1 Oct 2002 16:28:28 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <B0A500E93795D311AD4300A0C9A98F4801610ABB@lara.epiuse.co.za>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

hi there,

i'm trying to install iptables 1.2.7 on kernel 2.4.17, i've already applied
the patch-o-matic patches to my kernel but when i try to compile iptables i
get the following output:

kagisofw:/usr/local/iptables/src/iptables-1.2.7 $ make
KERNEL_DIR=/usr/local/ >
Extensions found: IPv4:helper
cc -O2 -Wall -Wunused -I/usr/local/kernel/src/linux/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.7\"  -fPIC -o extensions/libipt_conntrack_sh.o -c
extensions/libipt_conntrack.c
In file included from extensions/libipt_conntrack.c:14:
/usr/local/kernel/src/linux/include/linux/netfilter_ipv4/ipt_conntrack.h:28:
`IP_CT_DIR_MAX' undeclared here (not in a function)
/usr/local/kernel/src/linux/include/linux/netfilter_ipv4/ipt_conntrack.h:29:
`IP_CT_DIR_MAX' undeclared here (not in a function)
/usr/local/kernel/src/linux/include/linux/netfilter_ipv4/ipt_conntrack.h:29:
`IP_CT_DIR_MAX' undeclared here (not in a function)
extensions/libipt_conntrack.c: In function `parse_status':
extensions/libipt_conntrack.c:103: `IPS_EXPECTED' undeclared (first use in
this function)
extensions/libipt_conntrack.c:103: (Each undeclared identifier is reported
only once
extensions/libipt_conntrack.c:103: for each function it appears in.)
extensions/libipt_conntrack.c:105: `IPS_SEEN_REPLY' undeclared (first use in
this function)
extensions/libipt_conntrack.c:107: `IPS_ASSURED' undeclared (first use in
this function)
extensions/libipt_conntrack.c: In function `parse':
extensions/libipt_conntrack.c:202: `IP_CT_DIR_ORIGINAL' undeclared (first
use in this function)
extensions/libipt_conntrack.c:259: `IP_CT_DIR_REPLY' undeclared (first use
in this function)
extensions/libipt_conntrack.c: In function `print_status':
extensions/libipt_conntrack.c:364: `IPS_EXPECTED' undeclared (first use in
this function)
extensions/libipt_conntrack.c:368: `IPS_SEEN_REPLY' undeclared (first use in
this function)
extensions/libipt_conntrack.c:372: `IPS_ASSURED' undeclared (first use in
this function)
extensions/libipt_conntrack.c: In function `matchinfo_print':
extensions/libipt_conntrack.c:420: `IP_CT_DIR_ORIGINAL' undeclared (first
use in this function)
extensions/libipt_conntrack.c:440: `IP_CT_DIR_REPLY' undeclared (first use
in this function)
make: *** [extensions/libipt_conntrack_sh.o] Error 1

any help will be greatly appreciated.

thanks
d.



