From: Lindsay Snider <lindsay@pa.net>
Subject: Resource temporarily unavailable
Date: Tue, 16 Nov 2004 16:29:00 -0500
Message-ID: <200411161629.00497.lindsay@pa.net>
Reply-To: lindsay@pa.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

When quickly adding/removing rules to iptables, I randomly get the 'Resource 
temporarily unavailable' and 'Invalid argument' message.  In the past, I put 
a random .3 - 1 sec sleep in between iptables calls to get the rules in. 
Recently we've updated two boxes to the 2.6 kernel and things have gotten 
worse.  We normally float around 10K rules but when the 2.6 kernel boxes get 
into the 7K number of rules range, the add/removal time is to slow for the 
boxes to keep up with the changes.  On the 2.6 kernel boxes, the system time 
maxes out one processor at 100% system cpu.  The 2.4 kernel boxes are keeping 
up, running for mail load and the system cpu is averaging 41%.

A quick note on the boxes.  There are 9 dell 1550's (dual PIII, 1G ram).  7 
boxes are running 2.4.22-1.2199.nptlsmp (fedora rpm), 1 running 
2.6.9-1.667smp (fc3 rpm), and 1 running 2.6.9 (stock kernel.org).  The 
hardware w/i the boxes are the same.

Does anyone have a suggestion on what this might be?

Addition info:
iptables add/remove rate is averaging 64.5 / minute


Lindsay

