From: cs02m004 <bharath@peacock.iitm.ernet.in>
Subject: [SUSPECTED SPAM] ipq_read error: Received message truncated
Date: Tue, 16 Mar 2004 22:46:23 +0530 (IST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.10.10403162234530.8634-100000@peacock.iitm.ernet.in>
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

Hi all,
I am trying to read packets using ipq_read after trapping them.
ipq_read() is returning -1. 
errno == EINTR
ipq_errstr() says Received message truncated.

I tried reexecuting the call to ipq_read (to restart the system call which
failed). I also tried increasing the size argument to ipq_read() i.e.
bigger buffer. Both methods failed.

What is the reason. Any workarounds ?

Thanks in advance
Bharath


