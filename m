From: "web master" <webmasta0@hotmail.com>
Subject: Iptables install error ?
Date: Sat, 05 Oct 2002 16:47:33 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F171MqA4dxfE9oh46Yi00011ee5@hotmail.com>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

uname -a

Linux localhost.localdomain 2.4.5 #3 Sun Sep 22 09:50:19 EEST 2002
i686 unknown
Redhat 7.2 but with dowgraded kernel so i can run my winmodem :(
so any help


[root@localhost iptables-1.2.7a]# make KERNEL_DIR=/usr/src/linux/
Extensions found:
cc -O2 -Wall -Wunused -I/usr/src/linux//include -Iinclude/
-DIPTABLES_VERSION=\"1.2.7a\" -fPIC -o
extensions/libipt_conntrack_sh.o -c extensions/libipt_conntrack.c
In file included from extensions/libipt_conntrack.c:14:
include/linux/netfilter_ipv4/ipt_conntrack.h:28: `IP_CT_DIR_MAX'
undeclared here (not in a function)
include/linux/netfilter_ipv4/ipt_conntrack.h:29: `IP_CT_DIR_MAX'
undeclared here (not in a function)
include/linux/netfilter_ipv4/ipt_conntrack.h:29: `IP_CT_DIR_MAX'
undeclared here (not in a function)
extensions/libipt_conntrack.c: In function `parse_status':
extensions/libipt_conntrack.c:103: `IPS_EXPECTED' undeclared (first
use in this
function)
extensions/libipt_conntrack.c:103: (Each undeclared identifier is
reported only
once
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
extensions/libipt_conntrack.c:364: `IPS_EXPECTED' undeclared (first
use in this
function)
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




_________________________________________________________________
Chat with friends online, try MSN Messenger: http://messenger.msn.com


