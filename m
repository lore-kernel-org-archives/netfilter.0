From: Mark Moseley <moseleymark@gmail.com>
Subject: ipset issue
Date: Mon, 6 Dec 2004 13:27:34 -0800
Message-ID: <294d5daa0412061327651c1648@mail.gmail.com>
Reply-To: Mark Moseley <moseleymark@gmail.com>
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

I decided to play with ipset (2.0), but I seem to be running into an
issue with creating rules. I wonder if I'm missing something silly or
not.

When I issue the command:

ipset -N foo iphash --resize 0   (straight from the Tips page)

I get the error:

ipset v2.0: Error from kernel: Protocol not available

I get this on a box running a 2.6.10-rc3 kernel and the kernel has
most definitely been patched with the POM with the set stuff in it, as
well as the iptables 1.3.0 (POM and iptables source were downloaded
from the ipset page,
http://people.netfilter.org/kadlec/ipset/install.html). The kernel was
compiled with gcc 3.2.2 (RH9 rpm).

Here's a snippet from the end of strace. Let me know if more
strace'ing would be helpful. This is the last chunk, running strace
with -f and -s:

socket(PF_INET, SOCK_RAW, IPPROTO_RAW)  = 3
setsockopt(3, SOL_IP, 0x53 /* IP_??? */,
"\1\0\0\0\2\0\0\0foo\0T\277\4@Xn\4@8\344\3@\350u\1@\4\0\0\0\264x\1@\224\207\4\10iphash\0\10\270i\1@\264m\1@\0\0\0\0\200\364\377\277\\~\0@<\364\377\277\0\4\0\0\10\0\0\0\377\377\377\377",
84) = -1 ENOPROTOOPT (Protocol not available)
write(2, "ipset v2.0: ", 12ipset v2.0: )            = 12
write(2, "Error from kernel: Protocol not available", 41Error from
kernel: Protocol not available) = 41
write(2, "\n", 1)                       = 1
exit_group(1)   


I imagine I'm missing something when I configure the kernel but I'm
not sure what. Anybody know what botched? Thanks!

