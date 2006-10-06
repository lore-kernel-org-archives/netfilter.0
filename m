From: "Jorge Bastos" <mysql.jorge@decimal.pt>
Subject: Compiling 1.3.6
Date: Fri, 6 Oct 2006 19:41:58 +0100
Message-ID: <00be01c6e977$1ba6bcd0$0101a8c0@pcjorge>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

I was compiling the 1.3.6 version of iptables, agains my 2.6.19-rc1 kernel 
version and i get this (it also happens with the final 2.6.18).
Is there some livrary that needs an upgrade or am i missing something?
I already tryed the svn last version and the same happens.

Thanks,
Jorge


Extensions found: IPv4:CLUSTERIP IPv4:connbytes IPv4:dccp IPv4:quota 
IPv4:recent IPv4:statistic IPv4:string IPv6:REJECT IPv6:ah IPv6:esp 
IPv6:frag IPv6:ipv6header IPv6:rt
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.18/include -Iinclude/ -DIPTABLES_VERSION=\"1.3.6\" 
  -fPIC -o extensions/libipt_iprange_sh.o -c extensions/libipt_iprange.c
In file included from extensions/libipt_iprange.c:9:
/usr/src/linux-2.6.18/include/linux/netfilter_ipv4/ipt_iprange.h:11: error: 
expected specifier-qualifier-list before '__be32'
extensions/libipt_iprange.c: In function 'parse_iprange':
extensions/libipt_iprange.c:43: error: 'struct ipt_iprange' has no member 
named 'min_ip'
extensions/libipt_iprange.c:50: error: 'struct ipt_iprange' has no member 
named 'max_ip'
extensions/libipt_iprange.c:52: error: 'struct ipt_iprange' has no member 
named 'max_ip'
extensions/libipt_iprange.c:52: error: 'struct ipt_iprange' has no member 
named 'min_ip'
extensions/libipt_iprange.c: In function 'print_iprange':
extensions/libipt_iprange.c:116: error: 'const struct ipt_iprange' has no 
member named 'min_ip'
extensions/libipt_iprange.c:117: error: 'const struct ipt_iprange' has no 
member named 'max_ip'
make: *** [extensions/libipt_iprange_sh.o] Error 1 


