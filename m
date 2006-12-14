From: Ken Arany <it@fletcheracademy.com>
Subject: Install questions
Date: Thu, 14 Dec 2006 11:39:21 -0500
Message-ID: <45817E39.9000905@fletcheracademy.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------010903070102050703010908"
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
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.
--------------010903070102050703010908
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I'm new to this list so bear with me if I'm asking a question that has 
been answered many times before.

I have a RHEL AS 4 server AMD_64 bit version running kernel 2.6.9-42. I 
have tried to install the libnfnetlink from source and it gives me a lot 
of errors. Is this because I'm running an older version of the kernel? 
If so, then I'm not really interested in upgrading my kernel and may 
have to find another solution.

Basically here is what I get when I run the make command  (after 
./configure).
> In file included from libnfnetlink.c:40:
> /usr/include/linux/netlink.h:22: error: syntax error before "__u32"
> /usr/include/linux/netlink.h:28: error: syntax error before "__u32"
> /usr/include/linux/netlink.h:30: error: syntax error before "nlmsg_flags"
> /usr/include/linux/netlink.h:31: error: syntax error before "nlmsg_seq"
> /usr/include/linux/netlink.h:32: error: syntax error before "nlmsg_pid"
> /usr/include/linux/netlink.h:82: error: field `msg' has incomplete type
> In file included from libnfnetlink.c:42:
> ../include/libnfnetlink/libnfnetlink.h:36: error: field `nlh' has 
> incomplete type
> libnfnetlink.c:73: error: field `local' has incomplete type
> libnfnetlink.c:74: error: field `peer' has incomplete type
> libnfnetlink.c: In function `nfnl_dump_packet':
> libnfnetlink.c:84: error: invalid application of `sizeof' to 
> incomplete type `nlmsghdr'
> libnfnetlink.c:85: error: invalid application of `sizeof' to 
> incomplete type `nlmsghdr'
> libnfnetlink.c:86: error: dereferencing pointer to incomplete type
> libnfnetlink.c:86: error: invalid application of `sizeof' to 
> incomplete type `nlmsghdr'
> libnfnetlink.c:96: error: dereferencing pointer to incomplete type
> libnfnetlink.c:96: error: dereferencing pointer to incomplete type
> libnfnetlink.c:97: error: dereferencing pointer to incomplete type
> libnfnetlink.c:97: error: dereferencing pointer to incomplete type
> libnfnetlink.c: In function `nfnl_send':
> libnfnetlink.c:288: error: dereferencing pointer to incomplete type
> libnfnetlink.c: In function `nfnl_fill_hdr':
> libnfnetlink.c:337: error: dereferencing pointer to incomplete type
> libnfnetlink.c:339: error: dereferencing pointer to incomplete type
> libnfnetlink.c:339: error: invalid application of `sizeof' to 
> incomplete type `nlmsghdr'
> libnfnetlink.c:340: error: dereferencing pointer to incomplete type
> libnfnetlink.c:341: error: dereferencing pointer to incomplete type
> libnfnetlink.c:342: error: dereferencing pointer to incomplete type
> libnfnetlink.c:343: error: dereferencing pointer to incomplete type
> libnfnetlink.c: In function `nfnl_parse_hdr':
> libnfnetlink.c:355: error: dereferencing pointer to incomplete type
> libnfnetlink.c:355: error: invalid application of `sizeof' to 
> incomplete type `nlmsghdr'
> libnfnetlink.c:358: error: dereferencing pointer to incomplete type
> libnfnetlink.c:358: error: invalid application of `sizeof' to 
> incomplete type `nlmsghdr'
> libnfnetlink.c:367: error: invalid application of `sizeof' to 
> incomplete type `nlmsghdr'
> libnfnetlink.c: In function `nfnl_recv':
> libnfnetlink.c:376: error: storage size of 'peer' isn't known
> libnfnetlink.c:379: error: invalid application of `sizeof' to 
> incomplete type `nlmsghdr'
> libnfnetlink.c:395: error: dereferencing pointer to incomplete type
> libnfnetlink.c:376: warning: unused variable `peer'
> libnfnetlink.c: In function `nfnl_listen':
> libnfnetlink.c:422: error: storage size of 'nladdr' isn't known
> libnfnetlink.c:465: error: dereferencing pointer to incomplete type
> libnfnetlink.c:467: error: dereferencing pointer to incomplete type
> libnfnetlink.c:468: error: dereferencing pointer to incomplete type
> libnfnetlink.c:480: error: dereferencing pointer to incomplete type
> libnfnetlink.c:485: error: dereferencing pointer to incomplete type
> libnfnetlink.c:486: error: invalid application of `sizeof' to 
> incomplete type `nlmsghdr'
> libnfnetlink.c:422: warning: unused variable `nladdr'
> libnfnetlink.c: In function `nfnl_talk':
> libnfnetlink.c:519: error: storage size of 'nladdr' isn't known
> libnfnetlink.c:524: error: dereferencing pointer to incomplete type
> libnfnetlink.c:538: error: dereferencing pointer to incomplete type
> libnfnetlink.c:541: error: dereferencing pointer to incomplete type
> libnfnetlink.c:569: error: dereferencing pointer to incomplete type
> libnfnetlink.c:570: error: dereferencing pointer to incomplete type
> libnfnetlink.c:571: error: dereferencing pointer to incomplete type
> libnfnetlink.c:583: error: dereferencing pointer to incomplete type
> libnfnetlink.c:584: error: dereferencing pointer to incomplete type
> libnfnetlink.c:593: error: dereferencing pointer to incomplete type
> libnfnetlink.c:594: error: invalid application of `sizeof' to 
> incomplete type `nlmsghdr'
> libnfnetlink.c:601: error: dereferencing pointer to incomplete type
> libnfnetlink.c:609: error: dereferencing pointer to incomplete type
> libnfnetlink.c:519: warning: unused variable `nladdr'
> libnfnetlink.c: In function `nfnl_addattr_l':
> libnfnetlink.c:645: error: dereferencing pointer to incomplete type
> libnfnetlink.c:646: error: dereferencing pointer to incomplete type
> libnfnetlink.c:651: error: dereferencing pointer to incomplete type
> libnfnetlink.c:655: error: dereferencing pointer to incomplete type
> libnfnetlink.c:655: error: dereferencing pointer to incomplete type
> libnfnetlink.c: In function `nfnl_get_msg_first':
> libnfnetlink.c:829: error: dereferencing pointer to incomplete type
> libnfnetlink.c:829: error: invalid application of `sizeof' to 
> incomplete type `nlmsghdr'
> libnfnetlink.c:829: error: dereferencing pointer to incomplete type
> libnfnetlink.c: In function `nfnl_get_msg_next':
> libnfnetlink.c:853: error: dereferencing pointer to incomplete type
> libnfnetlink.c:854: error: dereferencing pointer to incomplete type
> libnfnetlink.c:862: error: dereferencing pointer to incomplete type
> libnfnetlink.c:862: error: dereferencing pointer to incomplete type
> libnfnetlink.c:862: warning: left-hand operand of comma expression has 
> no effect
> libnfnetlink.c:864: error: dereferencing pointer to incomplete type
> libnfnetlink.c:864: error: invalid application of `sizeof' to 
> incomplete type `nlmsghdr'
> libnfnetlink.c:864: error: dereferencing pointer to incomplete type
> libnfnetlink.c: In function `nfnl_check_attributes':
> libnfnetlink.c:900: error: dereferencing pointer to incomplete type
> libnfnetlink.c:901: error: dereferencing pointer to incomplete type
> libnfnetlink.c:917: error: invalid application of `sizeof' to 
> incomplete type `nlmsghdr'
> libnfnetlink.c:918: error: dereferencing pointer to incomplete type
> libnfnetlink.c:923: error: dereferencing pointer to incomplete type
> libnfnetlink.c:924: error: invalid application of `sizeof' to 
> incomplete type `nlmsghdr'
> libnfnetlink.c:925: error: dereferencing pointer to incomplete type
> libnfnetlink.c: In function `__nfnl_handle_msg':
> libnfnetlink.c:950: error: dereferencing pointer to incomplete type
> libnfnetlink.c:951: error: dereferencing pointer to incomplete type
> libnfnetlink.c:959: error: dereferencing pointer to incomplete type
> libnfnetlink.c:959: error: invalid application of `sizeof' to 
> incomplete type `nlmsghdr'
> libnfnetlink.c: In function `nfnl_handle_packet':
> libnfnetlink.c:980: error: invalid application of `sizeof' to 
> incomplete type `nlmsghdr'
> libnfnetlink.c:984: error: dereferencing pointer to incomplete type
> libnfnetlink.c:985: error: invalid application of `sizeof' to 
> incomplete type `nlmsghdr'
> libnfnetlink.c:985: error: dereferencing pointer to incomplete type
> libnfnetlink.c:988: error: dereferencing pointer to incomplete type
> make[1]: *** [libnfnetlink.lo] Error 1
> make[1]: Leaving directory `/root/Desktop/libnfnetlink-0.0.16/src'
> make: *** [all-recursive] Error 1

This is a fresh install of the server that it will eventually go on, so 
I don't believe I have any other apps conflicting.

Any Help would be very appreciated.

Thanks in advance

Ken Arany
Fletcher Academy





--------------010903070102050703010908--

