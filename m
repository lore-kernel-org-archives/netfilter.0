From: Jeronimo de A Barros <jero@i2.com.br>
Subject: Slackware 10RC1 + Kernel 2.6.7 + iptables 1.2.10
Date: Wed, 16 Jun 2004 18:01:53 -0300 (BRT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0406161739360.8826-100000@lima.i2.com.br>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi all,

	While compiling iptables 1.2.10 (GCC 3.3.4):

Making dependencies: please wait...
Extensions found: IPv4:recent IPv6:ah IPv6:esp IPv6:frag IPv6:ipv6header IPv6:hbh IPv6:dst IPv6:rt
cc -O2 -Wall -Wunused -I/usr/src/linux/include -Iinclude/ -DIPTABLES_VERSION=\"1.2.10\"  -fPIC -o extensions/libipt_ah_sh.o -c extensions/libipt_ah.c
In file included from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:255: warning: no semicolon at end of struct or union
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:255: error: parse error before '*' token
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:259: error: parse error before '}' token
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:339: warning: type defaults to `int' in declaration of `DECLARE_MUTEX'
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:339: warning: parameter names (without types) in function declaration
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:339: warning: `DECLARE_MUTEX' declared `static' but never defined
make: *** [extensions/libipt_ah_sh.o] Error 1

	IPv6 is not checked.

	Any hint ? Any help ?

	Thanks in advance.

[]s, Jero



