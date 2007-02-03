From: Mike Boyer <boyer@administrative.com>
Subject: static build of iptables 1.3.7 modules question
Date: Fri, 2 Feb 2007 20:07:52 -0600 (CST)
Message-ID: <200702030207.l1327qV05575@triclops.administrative.com>
Reply-To: Mike Boyer <boyer@administrative.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-MD5: YfbQyl5Db1ikyJQGiHIZ0g==
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
Content-Type: TEXT/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I've build a new kernel 2.4.34 with all the netfilter options selected and most of the networking options turned on.  I've built 
iptables 1.3.7 using the following command line:

make KERNEL_DIR=/export/build/linux-2.4.34 DO_IPV6=0 NO_SHARED_LIBS=1 
BINDIR=/usr/local/iptables/bin LIBDIR=/usr/local/iptables/lib 
MANDIR=/usr/local/iptables/man

make DO_IPV6=0 NO_SHARED_LIBS=1 BINDIR=/usr/local/iptables/bin 
LIBDIR=/usr/local/iptables/lib MANDIR=/usr/local/iptables/man install

this produces a static executable as I would expect with no shared libraries 
however when I try to use any of the extensions, for example

iptables  -A INPUT -p tcp --syn --dport 23 -m connlimit --connlimit-above 2 -j 
REJECT

I get:

modprobe: Can't locate module ip_tables
iptables: No chain/target/match by that name

everything netfilter extensions related is built into the new kernel and
the reciprocal objects are in the iptables static executable.  I'm not
sure why its asking for an external module (I'm missing something).

Up to this point my work with iptables has been pretty basic but I wanted to
start using some more advanced matches.  Any help or suggestions would be
greatly appreciated.

--Mike Boyer


