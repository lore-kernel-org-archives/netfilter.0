From: "Tosho Yankov" <T.Yankov@snt.bg>
Subject: patch-o-matic problem
Date: Fri, 19 May 2006 10:21:05 +0300
Message-ID: <707F3F9D99DFB049A25A6C880E5CADF901F5F9A7@tangra.snt.bg>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----_=_NextPart_001_01C67B14.D4E73F48"
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
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C67B14.D4E73F48
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

uname  -a
Linux gate 2.6.15 #1 SMP PREEMPT Mon Jan 9 13:13:52 EET 2006 i686
unknown unknown GNU/Linux

I try to use patch-o-matic but I have this error
root@gate:/usr/src/linux# make modules
  CHK     include/linux/version.h
scripts/Makefile.build:51: kbuild: net/ipv4/netfilter/Makefile - Usage
of export-objs is obsolete in 2.6. Please fix!
  CC [M]  net/ipv4/netfilter/ip_conntrack_ftp.o
In file included from include/linux/netfilter_ipv4/ip_conntrack.h:32,
                 from
include/linux/netfilter_ipv4/ip_conntrack_helper.h:4,
                 from net/ipv4/netfilter/ip_conntrack_ftp.c:19:
include/linux/netfilter_ipv4/ip_conntrack_talk.h:7:43:
linux/netfilter_ipv4/lockhelp.h: No such file or directory
In file included from include/linux/netfilter_ipv4/ip_conntrack.h:32,
                 from
include/linux/netfilter_ipv4/ip_conntrack_helper.h:4,
                 from net/ipv4/netfilter/ip_conntrack_ftp.c:19:
include/linux/netfilter_ipv4/ip_conntrack_talk.h:10: warning: type
defaults to `int' in declaration of `DECLARE_LOCK_EXTERN'
include/linux/netfilter_ipv4/ip_conntrack_talk.h:10: warning: parameter
names (without types) in function declaration
include/linux/netfilter_ipv4/ip_conntrack_talk.h:10: warning: data
definition has no type or storage class
make[3]: *** [net/ipv4/netfilter/ip_conntrack_ftp.o] Error 1
make[2]: *** [net/ipv4/netfilter] Error 2
make[1]: *** [net/ipv4] Error 2
make: *** [net] Error 2

Can anybody help me pleas?
What is the problem?

Tosho Yankov
Support Engineer
S&T Bulgaria
phone: +359 2 965 17 87
fax: +359 2 975 16 00
e-mail: t.yankov@snt.bg
www.snt.bg

------_=_NextPart_001_01C67B14.D4E73F48--

