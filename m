From: Birn.Robert@t-online.de
Subject: Problems compiling iptables with kernel 2.4.16
Date: Mon, 12 Jan 2004 18:56:29 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1073929796.4002de44426fd@webmail.t-online.de>
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

Hello,

I'm trying to setup a linux box as a NAT router, but when I try to
compile iptables, I get the following message:

Extensions found:
cc -O2 -Wall -Wunused -I/usr/src/linux/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.7a\"  -fPIC -o
extensions/libipt_conntrack_sh.o -c extensions/libipt_conntrack.c
In file included from extensions/libipt_conntrack.c:14:
include/linux/netfilter_ipv4/ipt_conntrack.h:28: `IP_CT_DIR_MAX'
undeclared here (not in a function)
include/linux/netfilter_ipv4/ipt_conntrack.h:29: `IP_CT_DIR_MAX'
undeclared here (not in a function)
include/linux/netfilter_ipv4/ipt_conntrack.h:29: `IP_CT_DIR_MAX'
undeclared here (not in a function)
extensions/libipt_conntrack.c: In function `parse_status':
extensions/libipt_conntrack.c:103: `IPS_EXPECTED' undeclared (first use
in this function)
extensions/libipt_conntrack.c:103: (Each undeclared identifier is
reported only once
extensions/libipt_conntrack.c:103: for each function it appears in.)
extensions/libipt_conntrack.c:105: `IPS_SEEN_REPLY' undeclared (first
use in this function)
extensions/libipt_conntrack.c:107: `IPS_ASSURED' undeclared (first use
in this function)
extensions/libipt_conntrack.c: In function `parse':
extensions/libipt_conntrack.c:202: `IP_CT_DIR_ORIGINAL' undeclared
(first use in this function)
extensions/libipt_conntrack.c:259: `IP_CT_DIR_REPLY' undeclared (first
use in this function)
extensions/libipt_conntrack.c: In function `print_status':
extensions/libipt_conntrack.c:364: `IPS_EXPECTED' undeclared (first use
in this function)
extensions/libipt_conntrack.c:368: `IPS_SEEN_REPLY' undeclared (first
use in this function)
extensions/libipt_conntrack.c:372: `IPS_ASSURED' undeclared (first use
in this function)
extensions/libipt_conntrack.c: In function `matchinfo_print':
extensions/libipt_conntrack.c:420: `IP_CT_DIR_ORIGINAL' undeclared
(first use in this function)
extensions/libipt_conntrack.c:440: `IP_CT_DIR_REPLY' undeclared (first
use in this function)
make: *** [extensions/libipt_conntrack_sh.o] Error 1

I'm using the kernel 2.4.16 and iptables 1.2.8 (but I also tried 1.2.7a
and 1.2.9).

Where is my fault? Can anyone help me?

Thanks

Robert

