From: "Sussman, Scott" <ssussman@starentnetworks.com>
Subject: compile-time errors
Date: Fri, 17 Aug 2007 15:39:39 -0400
Message-ID: <7CCD07160348804497EF29E9EA5560D7037798FD@exchtewks2.starentnetworks.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Class: urn:content-classes:message
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
=20
I am trying to compile libnetfilters_queue.0.0.15 with
libnfnetlink-0.0.16 and am getting the following compile time errors,
any help would be appreciated:
=20
 gcc -DPACKAGE_NAME=3D\"\" -DPACKAGE_TARNAME=3D\"\" =
-DPACKAGE_VERSION=3D\"\"
-DPACKAGE_STRING=3D\"\" -DPACKAGE_BUGREPORT=3D\"\"
-DPACKAGE=3D\"libnetfilter_queue\" -DVERSION=3D\"0.0.15\" =
-DSTDC_HEADERS=3D1
-DHAVE_SYS_TYPES_H=3D1 -DHAVE_SYS_STAT_H=3D1 -DHAVE_STDLIB_H=3D1
-DHAVE_STRING_H=3D1 -DHAVE_MEMORY_H=3D1 -DHAVE_STRINGS_H=3D1
-DHAVE_INTTYPES_H=3D1 -DHAVE_STDINT_H=3D1 -DHAVE_UNISTD_H=3D1 =
-DHAVE_DLFCN_H=3D1
-I. -I. -I../include -I
-I/localdisk/netfilters/libnfnetlink-0.0.30/include/ -fPIC -Wall -g -O2
-I/home/ssussman/lib/include -MT libnetfilter_queue.lo -MD -MP -MF
.deps/libnetfilter_queue.Tpo -c libnetfilter_queue.c  -fPIC -DPIC -o
.libs/libnetfilter_queue.o
In file included from libnetfilter_queue.c:33:
../include/libnetfilter_queue/libnetfilter_queue.h:84: warning: `struct
nlif_handle' declared inside parameter list
../include/libnetfilter_queue/libnetfilter_queue.h:84: warning: its
scope is only this definition or declaration, which is probably not what
you want
../include/libnetfilter_queue/libnetfilter_queue.h:86: warning: `struct
nlif_handle' declared inside parameter list
../include/libnetfilter_queue/libnetfilter_queue.h:88: warning: `struct
nlif_handle' declared inside parameter list
../include/libnetfilter_queue/libnetfilter_queue.h:90: warning: `struct
nlif_handle' declared inside parameter list
libnetfilter_queue.c:423: warning: `struct nlif_handle' declared inside
parameter list
libnetfilter_queue.c:424: error: conflicting types for
`nfq_get_indev_name'
../include/libnetfilter_queue/libnetfilter_queue.h:84: error: previous
declaration of `nfq_get_indev_name'
libnetfilter_queue.c: In function `nfq_get_indev_name':
libnetfilter_queue.c:426: warning: implicit declaration of function
`nlif_index2name'
libnetfilter_queue.c: At top level:
libnetfilter_queue.c:430: warning: `struct nlif_handle' declared inside
parameter list
libnetfilter_queue.c:431: error: conflicting types for
`nfq_get_physindev_name'
../include/libnetfilter_queue/libnetfilter_queue.h:86: error: previous
declaration of `nfq_get_physindev_name'
libnetfilter_queue.c:437: warning: `struct nlif_handle' declared inside
parameter list
libnetfilter_queue.c:438: error: conflicting types for
`nfq_get_outdev_name'
../include/libnetfilter_queue/libnetfilter_queue.h:88: error: previous
declaration of `nfq_get_outdev_name'
libnetfilter_queue.c:444: warning: `struct nlif_handle' declared inside
parameter list
libnetfilter_queue.c:445: error: conflicting types for
`nfq_get_physoutdev_name'
../include/libnetfilter_queue/libnetfilter_queue.h:90: error: previous
declaration of `nfq_get_physoutdev_name'
make[1]: *** [libnetfilter_queue.lo] Error 1
make[1]: Leaving directory
`/localdisk/netfilters/libnetfilter_queue-0.0.15/src'
make: *** [all-recursive] Error 1


Thanks,

Scott


"This email message and any attachments are confidential information of =
Starent Networks, Corp. The information transmitted may not be used to =
create or change any contractual obligations of Starent Networks, Corp.  =
Any review, retransmission, dissemination or other use of, or taking of =
any action in reliance upon this e-mail and its attachments by persons =
or entities other than the intended recipient is prohibited. If you are =
not the intended recipient, please notify the sender immediately -- by =
replying to this message or by sending an email to =
postmaster@starentnetworks.com -- and destroy all copies of this message =
and any attachments without reading or disclosing their contents. Thank =
you."

