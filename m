From: MOUDARIR Mohamed <moudarir@Richbond.ma>
Subject: H323 module installing and copiling prob
Date: Wed, 19 Mar 2003 11:58:46 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <14C5057BC852D611BAC400E0299AA10F127444@MAILSERV>
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
To: netfilter@lists.netfilter.org

Hi all,
I want to use netmeeting over an iptables firewal version 1.2.3 ( redhat
7.2, kernel 2.4 )
I use this command to update iptables :
	# cvs -d :pserver:cvs@pserver.netfilter.org:/cvspublic login 
	# cvs -d :pserver:cvs@pserver.netfilter.org:/cvspublic co
netfilter/userspace netfilter/patch-o-matic 
And to make dependecies :
	# cd /usr/src/linux/ 
	# make dep 
And cd ton ~/netfilter/patch-o-matic/ :
	./runme extra
and  # ./runme --batch extra/h323-conntrack-nat.patch
After that, i add H323 module to kernel :#  make menuconfig
And compile iptables :
	# cd ~/netfilter/userspace/
	# make all install
So i obtain this message :
Making dependencies: please wait...
cc -O2 -Wall -Wunused -I/usr/src/linux-2.4.7-10/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.7a\"  -fPIC -o extensions/libipt_ah_sh.o -c
extensions/libipt_ah.c
ld -shared -o extensions/libipt_ah.so extensions/libipt_ah_sh.o
cc -O2 -Wall -Wunused -I/usr/src/linux-2.4.7-10/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.7a\"  -fPIC -o extensions/libipt_conntrack_sh.o -c
extensions/libipt_conntrack.c
In file included from extensions/libipt_conntrack.c:14:
include/linux/netfilter_ipv4/ipt_conntrack.h:28: `IP_CT_DIR_MAX' undeclared
here (not in a function)
include/linux/netfilter_ipv4/ipt_conntrack.h:29: `IP_CT_DIR_MAX' undeclared
here (not in a function)
include/linux/netfilter_ipv4/ipt_conntrack.h:29: `IP_CT_DIR_MAX' undeclared
here (not in a function)
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

Is there any probleme, and how can i delete the old version of iptables.
Thanks.

