From: "Filka Michal" <Michal.Filka@sitronicsts.com>
Subject: conntrack-tools 0.0.95 compilation problem
Date: Fri, 17 Aug 2007 10:57:49 +0200
Message-ID: <56FFE36FCA3A3842AE12EE8B3A32229D14714B@exbbc.stromtelecom.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

I've following problem when compiling conntrack-tools v0.0.95.

gcc -g -O2 -o conntrack conntrack.o
../extensions/.libs/libct_proto_tcp.a
../extensions/.libs/libct_proto_udp.a
../extensions/.libs/libct_proto_icmp.a -lpthread -lnetfilter_conntrack
-lnfnetlink
/usr/lib/libc_nonshared.a(elf-init.oS)(.text.__i686.get_pc_thunk.bx+0x0)
: In function `__i686.get_pc_thunk.bx':
: multiple definition of `__i686.get_pc_thunk.bx'
../extensions/.libs/libct_proto_tcp.a(libct_proto_tcp.o)(.gnu.linkonce.t
.__i686.get_pc_thunk.bx+0x0):/root/conntrack-tools-0.9.5/extensions/libc
t_proto_tcp.c:77: first defined here
collect2: ld returned 1 exit status
make[1]: *** [conntrack] Error 1
make[1]: Leaving directory `/root/conntrack-tools-0.9.5/src'
make: *** [all-recursive] Error 1

so should I exclude libc* from linking or anything else is wrong?

Thanks,

Michal Filka

