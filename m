From: "L.Kremkow" <kremkow@polytomy.org>
Subject: iptables compile trouble
Date: Wed, 5 Jun 2002 14:29:19 -0400 (EDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.43L0.0206051424070.27914-100000@singularity.polytomy.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: NF ML <netfilter@lists.samba.org>

Hi,

I'm trying to compile iptables-1.2.6a on Linux 2.4.18 and it keeps bombing
out on me with the following error messages:
Extensions found:
cc -O2 -Wall -Wunused -I/usr/src/linux/include -Iinclude/
-DNETFILTER_VERSION=\"1.2.6a\"  -DIP6T_LIB_DIR=\"/usr/local/lib/iptables\"
-c -o ip6tables.o ip6tables.c
ip6tables.c: In function `host_to_addr':
ip6tables.c:496: storage size of `hints' isn't known
ip6tables.c:502: `AI_CANONNAME' undeclared (first use in this function)
ip6tables.c:502: (Each undeclared identifier is reported only once
ip6tables.c:502: for each function it appears in.)
ip6tables.c:509: warning: implicit declaration of function `getaddrinfo'
ip6tables.c:515: dereferencing pointer to incomplete type
ip6tables.c:516: dereferencing pointer to incomplete type
ip6tables.c:526: dereferencing pointer to incomplete type
ip6tables.c:527: warning: implicit declaration of function `freeaddrinfo'
ip6tables.c:496: warning: unused variable `hints'
ip6tables.c: In function `addr_to_host':
ip6tables.c:540: `NI_MAXHOST' undeclared (first use in this function)
ip6tables.c:546: warning: implicit declaration of function `getnameinfo'
ip6tables.c:540: warning: unused variable `hostname'
make: *** [ip6tables.o] Error 1

Now, I don't understand why it would want to do anything with IPv6- I
don't use it. I recompiled the kernel a few times, and even included IPv6
netfilter stuff in the kernel, but it was still gives me the same error.

I looked at the makefile and set DO_IP6=0 regardless to get it to not do
it, but I still get this error message. I've googled to see if other
people have seen this before, but haven't found anything related.

I'm not sure to what extend bind could have interfered, but I tried
including it's libraries, which still didn't yield any results.

At this point I'm stuck. Any help would be appreciated.
Thanks,,
L.Kremkow


