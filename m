From: "B. van Ouwerkerk" <bvo@atz.nl>
Subject: make KERNEL_DIR gives errors kernel 2.6.7
Date: Fri, 18 Jun 2004 20:53:57 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <6.0.0.22.0.20040617224644.04f9a640@pop.atz-hosting.nl>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

Just installed a brand new Slackware 9.1 and thought it would be nice to 
run the latest of everything.

I ran:
make KERNEL_DIR=/usr/src/linux
Making dependencies: please wait...
Extensions found: IPv4:recent IPv6:ah IPv6:esp IPv6:frag IPv6:ipv6header 
IPv6:hbh IPv6:dst IPv6:rt
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.7/include -Iinclude/ 
-DIPTABLES_VERSION=\"1.2.10\"  -fPIC -o extensions/libipt_ah_sh.o -c 
extensions/libipt_ah.c
In file included from include/libiptc/libiptc.h:6,
                  from include/iptables.h:5,
                  from extensions/libipt_ah.c:8:
/usr/src/linux-2.6.7/include/linux/netfilter_ipv4/ip_tables.h:255: warning: 
no semicolon at end of struct or union
/usr/src/linux-2.6.7/include/linux/netfilter_ipv4/ip_tables.h:255: syntax 
error before '*' token
/usr/src/linux-2.6.7/include/linux/netfilter_ipv4/ip_tables.h:259: syntax 
error before '}' token
/usr/src/linux-2.6.7/include/linux/netfilter_ipv4/ip_tables.h:339: warning: 
type defaults to `int' in declaration of `DECLARE_MUTEX'
/usr/src/linux-2.6.7/include/linux/netfilter_ipv4/ip_tables.h:339: warning: 
parameter names (without types) in function declaration
/usr/src/linux-2.6.7/include/linux/netfilter_ipv4/ip_tables.h:339: warning: 
`DECLARE_MUTEX' declared `static' but never defined
make: *** [extensions/libipt_ah_sh.o] Error 1

gcc version 3.2.3
GNU Make 3.80

I have replaced both the ipv4/iptables.h and the ipv6/iptables.h files with 
those from the kernel 2.4.22 and then all went fine. IMHO this shouldn't 
happen.

I got the kernel 2.6.7 from kernel.org and not from slackware..

Should I file a bug report for this or is it just a stupid user (or 
compiler) error..


B.


