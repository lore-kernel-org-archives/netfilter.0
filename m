From: Krishna Prasanth P <krishnap@teneoris.com>
Subject: compilation problem with cuseeme patch.
Date: 12 Feb 2004 17:36:50 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1076587638.1004.49.camel@krishnap>
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
To: netfilter@lists.netfilter.org

Hi!!
 I'm trying to use cuseeme patch with netfilter and downloaded the patch
from the cvs repository.
While building the kernel with the new patch, i'm not able to do
linking. The reason is the cuseeme(ip_nat_cuseeme.c) is using function
ip_nat_mangle_udp_packet() function which is not defined.

Please let me know, if i'm missing some other things while adding the
patch.

Thanks in advance.


regards
-prasanth

Error dump while building the kernel:

net/network.o: In function `cuseeme_mangle_outgoing':
net/network.o(.text+0x4c498): undefined reference
to`ip_nat_mangle_udp_packet'
net/network.o(.text+0x4c498): relocation truncated to fit: R_ARM_PC24
ip_nat_mangle_udp_packet
net/network.o: In function `cuseeme_mangle_incoming':
net/network.o(.text+0x4c514): undefined reference to
`ip_nat_mangle_udp_packet'
net/network.o(.text+0x4c514): relocation truncated to fit: R_ARM_PC24
ip_nat_mangle_udp_packet
net/network.o(.text+0x4c56c): undefined reference to
`ip_nat_mangle_udp_packet'
net/network.o(.text+0x4c56c): relocation truncated to fit: R_ARM_PC24
ip_nat_mangle_udp_packet
net/network.o(.text+0x4c5f4): undefined reference to
`ip_nat_mangle_udp_packet'
net/network.o(.text+0x4c5f4): relocation truncated to fit: R_ARM_PC24
ip_nat_mangle_udp_packet
make[2]: *** [vmlinux] Error 1
make[2]: Leaving directory
`/home/krishnap/work/lsi/homebase/linux/linux-2.4.10'
make[1]: *** [obelix] Error 2
make[1]: Leaving directory `/home/krishnap/work/lsi/homebase/linux'





