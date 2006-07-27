From: "Thessalia K. Corsin" <seeskokeed@hotmail.com>
Subject: nfnetlink, ip_conntrack
Date: Thu, 27 Jul 2006 19:24:35 +0000
Message-ID: <BAY119-F6CC272DAE50198D676B53C4580@phx.gbl>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello,

I've been looking at iptables, ebtables, nfnetlink, etc.
It's a daunting task unfortunately due to the nature of rapid course of 
development that's
ongoing.  And the fact that I use current kernels.  Much of the docs I find 
are outdated.

Maybe someone can point me to current docs?

Questions:

1.  Can nfnetlink be used without ip_conntrack?  Is it just a matter of 
disabling ip_conntrack
    when building the kernel?


2.  Why are there two netfilter directories within the kernel?
    net/netfilter and net/ipv4/netfilter ?


3.  Why no docs in the kernel describing nfnetlink?


4.  What's the current replacement for libipq for the kernel netlink API?


Thanks.

_________________________________________________________________
Express yourself instantly with MSN Messenger! Download today - it's FREE! 
http://messenger.msn.click-url.com/go/onm00200471ave/direct/01/


