From: Scott MacKay <scottmackay@yahoo.com>
Subject: Re: Fedora kernel + conntrack + QUEUE mangle good?
Date: Thu, 24 Jun 2004 06:46:04 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040624134605.47446.qmail@web13908.mail.yahoo.com>
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
To: netfilter <netfilter@lists.netfilter.org>

OK, more details:

Existing system communicates between 2  2.4.x systems.
 2 userspace QUEUE targets intercept data in the
mangle table with conntrack loaded for defragmenting.
The userspace does some packet mangling, mainly data
contents.
With the 2.4.x machines, works fine.  

I loaded a machine with Fedora RC2 (2.6.5-1.358).  Put
the userspace on without any issues.  When just
examining the packets, passes thru fine.  The issue
seems to be when I get a packet of around 2360 bytes. 
Right around that size the tail end of the packet
seems to be garbage (I hexdump the last 32 bytes of
the packet on sender and receiver).  With 2.6.5, are
there any known issues with conntrack and large packet
mangling?







		
__________________________________
Do you Yahoo!?
Yahoo! Mail - 50x more storage than other providers!
http://promotions.yahoo.com/new_mail

