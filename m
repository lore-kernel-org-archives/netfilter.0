From: Rowan Reid <rreid@studio3arc.com>
Subject: Net modules fail on compile with 2.5.52 and up kernel
Date: Wed, 08 Jan 2003 13:46:05 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001f01c2b75f$58e453d0$6601a8c0@s3ac>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
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
To: netfilter@lists.netfilter.org



Anyone who has been keeping up with my post probale is aware of my
plight trying to set up a VPN. Initially I had an IPTables firewall and
tried to allow PPTP traffic through with unsatisfying results. Then I
scrapt the idea to use IPSec I passed over freeswan and tried to use the
2.5.50 Kernel level IPSEC implimentation. My problem is the 2.5.50
version has problems booting to a resierfs using initrd so I decided to
use 2.5.52, then 2.5.54 both of which crap out while compiling the net
modules. Eg below


I keep getting errors  simular to that listed below when I run make
modules_install. This happens for 2.5.52, and 2.5.54. 

depmod: *** Unresolved symbols in
/lib/modules/2.5.54/kernel/net/netlink/netlink_dev.ko
 
Rowan Reid
Job Captain, 
Systems Administrator
STUDIO 3 ARCHITECTS
909  982  1717


