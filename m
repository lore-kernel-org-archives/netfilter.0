From: Vineet Kumar <vikumar@cs.ucsd.edu>
Subject: hook in kernel module question
Date: Tue, 10 Feb 2004 11:11:09 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.GSO.4.58.0402101109580.11016@gradlab.ucsd.edu>
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


I have a kernel module which has an inbound netfilter hook, inhook().
I have it set to PRE_ROUTING. From my hook, I want to be able to pass each
received packet to function foo(),
which is then to pass it on to IP/TCP after a variable delay. my hook,
inhook() then returns NF_STOLEN.


Is there an easy way to do this?
Returning an NF_ACCEPT is not good enough because foo() queues packets and
decides when to send them on to IP/TCP.
I cannot call ip_rcv_finish() from foo() because its not exported.


Thanks,
V


