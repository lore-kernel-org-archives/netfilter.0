From: sotto@aedra.com
Subject: Iptables 1.2.11 & DSCP
Date: Tue, 14 Sep 2004 16:48:21 -0700 (PDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095205701.21445@gooba.aedra.com>
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello all,
 I am having some problems getting the DSCP options compiled into iptables 1.2.11.
 I am using:
 -Suse 9.1
 -iptables 1.2.11

 When I run the make for iptables, everything goes ok except I see this message and the DSCP options (--set-dscp/--set-dscp-class) are not in the binary that 'make install' creates. 
  I've gone thru all the options (updates/submitted/pending/base/extra) in pom-ng and there are no options for DSCP.
 I've installed the kernel source and turned on the options for DSCP I need.

 Any ideas? thanks.

cc -O2 -Wall -Wunused -I/usr/src/linux/include -Iinclude/ -DIPTABLES_VERSION=\"1.2.11\"  -fPIC -o extensions/libipt_dscp_sh.o -c extensions/libipt_dscp.c
extensions/libipt_dscp_helper.c:69: warning: `dscp_to_name' defined but not used
ld -shared  -o extensions/libipt_dscp.so extensions/libipt_dscp_sh.o
cc -O2 -Wall -Wunused -I/usr/src/linux/include -Iinclude/ -DIPTABLES_VERSION=\"1.2.11\"  -fPIC -o extensions/libipt_DSCP_sh.o -c extensions/libipt_DSCP.c
extensions/libipt_dscp_helper.c:69: warning: `dscp_to_name' defined but not used
ld -shared  -o extensions/libipt_DSCP.so extensions/libipt_DSCP_sh.o


---

