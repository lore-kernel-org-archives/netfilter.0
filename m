From: Alex Tang <altitude@funkware.com>
Subject: ip_conntrack table full after upgrade from RHEL3 (2.4/1.2.8) to
 RHEL4U4 (2.6.9/1.2.11)
Date: Mon, 21 May 2007 17:30:34 -0700
Message-ID: <465239AA.9020007@funkware.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi folks.

I've been having a problem on a machine that does a high volume of 
sendmail traffic.  The machine gets approx 50,000 connections per hour 
to port 25. 

The machine was upgraded from a RHEL3 based system (kernel rpm 
2.4.21-47.EL and iptables rpm 1.2.8-12.3) to a RHEL4 based system 
(kernel rpm 2.6.9-55.EL and iptables rpm 1.2.11-3.1.RHEL4).

Since the upgrade has occurred, the conntrack table fills up relatively 
fast (within one day).  The max size is 65536 (as per 
/proc/sys/net/ipv4/netfilter/ip_conntrack_max).

I've been searching through the archives, faq, etc and have found the 
usual standard answer is to increase the ip_conntrack_max.  However, I'm 
concerned for a couple of reasons that this may not be the proper answer.

In particular, i have another machine which is still running the RHEL3 
(kernel 2.4.21-47.EL/iptables 1.2.8-12.3), that gets more connections 
per hour (80,000 vs. 50,000), and there are only about 9000 entries in 
the ip_conntrack table on that machine.

The problem with the conntrack table filling up fast started as soon as 
we did the upgrade.

Also, on the machine that is currently experiencing problems, most (98%) 
of the connections are in the ESTABLISHED state, however the majority of 
these connections are not seen when doing a "netstat".

I admit that I do not fully understand the details of the iptables 
implementation, but it seems that the connection close is not being 
"seen" by the conntrack code and connections that have already gone away 
are still in the ip_conntrack table, and we have to wait for these 
connections to "timeout" before they are expired from the conntrack table.

I could of course, increase the max size of the table, or decrease the 
/proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_established, but 
it seems that would only mask the problem, not actually fix it.

Is this a known issue in iptables? Or am I going down the wrong path?

Thanks for your help.

...alex...


