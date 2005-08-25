From: vikrant <vikrant@saysnetsoft.com>
Subject: Problem recompiling kernel with iptables v 1.3.2
Date: Thu, 25 Aug 2005 16:35:05 +0530
Message-ID: <430DA5E1.3010106@saysnetsoft.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

hi

I have mailed my problem earlier but nobody replied so i am sending it 
again hoping some response this time.

I trying to configure iptables with kernel but because of some problem i
am not able to do so.
Some information that i want to give are:-
Operating system - Cent OS4                  #My  operating system on
which i am trying to do
Current kernel version-  2.6.9-11.EL         #Result after running "uname
-r" command
Current iptables version - iptables v1.3.2   #Result after running
"iptables -V" command
-------------------------------------------------------------------
I have used the following command
--------------------------------------------------------------------
cd /usr/src/kernels
ls
2.6.9-11.EL-hugemem-i686       2.6.9-11.EL-smp-i686
2.6.9-11.EL-i686            2.6.9-5.0.3.EL-i686
cd ..
wget  http://iptables.org/downloads.html#iptables-1.3.2
bzip2 -cd iptables-1.3.2.tar.bz2 | tar xvf -
cd iptables-1.3.2/
make KERNEL_DIR=/usr/src/kernels/2.6.9-11.EL-i686/

#Problem occured after running this command

Extensions found: IPv4:recent cc -O2 -Wall -Wunused 
-I/usr/src/kernels/2.6.9-11.EL-i686//include-Iinclude/ 
-DIPTABLES_VERSION=\"1.3.2\"  -fPIC -o extensions/libipt_ah_sh.o -c 
extensions/libipt_ah.c In file included from
/usr/src/kernels/2.6.9-11.EL-i686//include/linux/netfilter_ipv4.h:8,from
/usr/src/kernels/2.6.9-11.EL-i686//include/linux/netfilter_ipv4/ip_tables.h:26,
from include/libiptc/libiptc.h:6,
from include/iptables.h:5,
from extensions/libipt_ah.c:8:
/usr/src/kernels/2.6.9-11.EL-i686//include/linux/config.h:6:2: #error
including kernel header in userspace; use the glibc headers instead!
make: *** [extensions/libipt_ah_sh.o] Error 1
-------------------------------------------------------------------------------------
  With regards
  Vikrant

