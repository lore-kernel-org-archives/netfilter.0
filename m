From: Alexandre Carlos de Oliveira <alexandre@redes.unb.br>
Subject: iptable error
Date: Sun, 20 Jul 2003 13:03:18 -0300 (BRT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <65003.200.163.24.60.1058716998.squirrel@webserver.redes.unb.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi, all

I was compiling iptables-1.2.4-0.2 and i expirienced the following error.
I'm using redhat 7.3, can someone help me? I downloaded the most version
of autoconf, and the error continues, and i've looked for an updated rpm
file for the kernel-headers, but i didn't find anyone.

[root@AlexLap iptables]# make
In file included from /usr/src/linux-2.4.19/include/linux/config.h:4,
                 from /usr/src/linux-2.4.19/include/linux/netfilter_ipv4.h:8,
                 from
/usr/src/linux-2.4.19/include/linux/netfilter_ipv4/ip_tabl
es.h:25,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_dscp.c:16:
/usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included
in user
space
Extensions found: IPv4:dscp IPv4:length IPv6:LOG IPv6:owner IPv6:limit
IPv6:mac
IPv6:multiport
cc -O2 -DNDEBUG -Wall -Wunused -I/usr/src/linux-2.4.19/include -Iinclude/
-DNETF
ILTER_VERSION=\"1.2.4\"  -fPIC -o extensions/libipt_tcp_sh.o -c
extensions/libip
t_tcp.c
In file included from /usr/src/linux-2.4.19/include/linux/config.h:4,
                 from /usr/src/linux-2.4.19/include/linux/netfilter_ipv4.h:8,
                 from
/usr/src/linux-2.4.19/include/linux/netfilter_ipv4/ip_tabl
es.h:25,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_tcp.c:7:
/usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included
in user
space
make: *** [extensions/libipt_tcp_sh.o] Error 1

Regards

Alex




