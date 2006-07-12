From: gary douglas <GM-Douglas@wiu.edu>
Subject: (no subject)
Date: Wed, 12 Jul 2006 11:07:36 -0500
Message-ID: <0E6ED28F-854E-43D2-BD60-D551639A7680@wiu.edu>
Mime-Version: 1.0 (Apple Message framework v752.2)
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
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: netfilter@lists.netfilter.org

Try to build a clean box with Fedora Core 4 and IPTables with  
connlimits. I keep running into errors.

I clean install Fedora Core 4. Download iptables 1.3.5, patch-o-matic  
20060710, and linux kernel 2.6.17.3. Create a link from /usr/src/ 
linux to the linux kernel directory.

cd into patch o matic and enter the following:
export KERNEL_DIR=/usr/src/linux

export IPTABLES_DIR=~/iptables-1.3.5

./runme connlimit


I have to force this as connlimit, if I do a y I get the following  
error:

unable to find ladd slot in src /tmp/pom-29493/net/ipv4/netfilter/ 
Makefile (./patchlets/connlimit/linux-2.6.11/./net/ipv4/netfilter/ 
Makefile.ladd)

than I cd over to iptables folder and run the make command. I get the  
following error at this time:

cc -O2 -Wall -Wunused -I/usr/src/linux/include -Iinclude/ - 
DIPTABLES_VERSION=\"1.3.5\"  -D_UNKNOWN_KERNEL_POINTER_SIZE -fPIC -o  
extensions/libipt_CLUSTERIP_sh.o -c extensions/libipt_CLUSTERIP.c
In file included from /usr/src/linux/include/linux/config.h:6,
                  from /usr/src/linux/include/linux/netfilter_ipv4.h:8,
                  from /usr/src/linux/include/linux/netfilter_ipv4/ 
ip_tables.h:26,
                  from include/libiptc/libiptc.h:6,
                  from include/iptables.h:5,
                  from extensions/libipt_CLUSTERIP.c:18:
/usr/include/linux/autoconf.h:1:2: error: #error Invalid kernel  
header included in userspace
make: *** [extensions/libipt_CLUSTERIP_sh.o] Error 1


Any suggestion on correcting this problem are welcome.

Thank you
Gary Douglas


