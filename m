From: t@tomdeb.org
Subject: conntrack-tools fails to compile
Date: Sat, 2 Jun 2007 10:32:48 +0100
Message-ID: <20070602103248.62320224@snoopy>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

I am trying to compile conntrack-tools on centos5. After
successfully built and installed rpms of libnfnetlink and
libnetfilter_conntrack, I get the following error when making
conntrack_tools:

In file included from /usr/include/sys/uio.h:24,
                 from /usr/include/sys/socket.h:27,
                 from /usr/include/libnfnetlink/libnfnetlink.h:19,
                 from proxy.c:19:
/usr/include/sys/types.h:62: error: conflicting types for 'dev_t'
/usr/include/linux/types.h:13: error: previous declaration of 'dev_t'
was here /usr/include/sys/types.h:67: error: conflicting types for
'gid_t' /usr/include/linux/types.h:27: error: previous declaration of
'gid_t' was here /usr/include/sys/types.h:72: error: conflicting types
for 'mode_t' /usr/include/linux/types.h:15: error: previous declaration
of 'mode_t' was here /usr/include/sys/types.h:77: error: conflicting
types for 'nlink_t' /usr/include/linux/types.h:16: error: previous
declaration of 'nlink_t' was here /usr/include/sys/types.h:82: error:
conflicting types for 'uid_t' /usr/include/linux/types.h:26: error:
previous declaration of 'uid_t' was here In file included
from /usr/include/sys/types.h:133, from /usr/include/sys/uio.h:24,
                 from /usr/include/sys/socket.h:27,
                 from /usr/include/libnfnetlink/libnfnetlink.h:19,
                 from proxy.c:19:
/usr/include/time.h:105: error: conflicting types for 'timer_t'
/usr/include/linux/types.h:22: error: previous declaration of 'timer_t'
was here In file included from /usr/include/sys/types.h:220,
                 from /usr/include/sys/uio.h:24,
                 from /usr/include/sys/socket.h:27,
                 from /usr/include/libnfnetlink/libnfnetlink.h:19,
                 from proxy.c:19:
/usr/include/sys/select.h:78: error: conflicting types for 'fd_set'
/usr/include/linux/types.h:12: error: previous declaration of 'fd_set'
was here In file included from /usr/include/sys/uio.h:24,
                 from /usr/include/sys/socket.h:27,
                 from /usr/include/libnfnetlink/libnfnetlink.h:19,
                 from proxy.c:19:
/usr/include/sys/types.h:235: error: conflicting types for 'blkcnt_t'
/usr/include/linux/types.h:114: error: previous declaration of
'blkcnt_t' was
he                                                           re
make[1]: *** [proxy.o] Error 1 make[1]: Leaving directory
`/home/t/conntrack-tools/src' make: *** [all-recursive] Error 1


I get the same results on 0.9.3 and the svn trunk 


any help would be greatly appreciated.

Tom

any 

