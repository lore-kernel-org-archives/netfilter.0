From: Ching Tai <j1133s@yahoo.com>
Subject: Is there a filter for Ethernet packets ?
Date: Wed, 4 Aug 2004 11:57:09 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040804185709.55744.qmail@web10708.mail.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Dear Netfilter users,

From looking through the code (mainly just grepping
for "NF_HOOK" in the kernel's net subdirectory), I
find that there seems to be hooks for ipv4, ipv6,
decnet, and bridge.

I'd like to write a filter for all the Ethernet
frames recevied on an Ethernet interface.  I'm
wondering if there is something in Netfilter for
me to use.

I think I can do that with the bridging Netfilter
(where I'd create a fake interface and bridge 
traffic to it, perform filtering on the bridge input,
make the fake interface's transmit function send that
data back into whichever real interface it should go),
but that seems like an overly complicated way to do
a simple filtering.  Also, it opens my code up to
changes in kernel's network device interfacing, etc.

I'd really appreciate it if somebody could help me
with:

1. If Netfilter can filter Ethernet frames, please
let me know which NF_... to use.

2. If Netfilter cannot do it, is there another way
to do what I need.  (Basically, I'd like to examine
each Ethernet frame and decide pass/drop on each one.)

Thank you!
Ching



		
__________________________________
Do you Yahoo!?
Yahoo! Mail - 50x more storage than other providers!
http://promotions.yahoo.com/new_mail

