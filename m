From: ro0ot <ro0ot@phreaker.net>
Subject: lots of tcp port 445 traffic
Date: Tue, 07 Dec 2004 00:54:08 +0800
Message-ID: <41B48EB0.3030307@phreaker.net>
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

Hi,

I get lots of tcp port 445 traffic when I do a tcpdump -n port 445, 
could it be an attack?

I check on the syslog files at /var/log/syslog, it shows this as below: -

Dec  7 00:36:40 fw01 kernel: Neighbour table overflow.
Dec  7 00:36:46 fw01 kernel: NET: 32 messages suppressed.
Dec  7 00:36:46 fw01 kernel: Neighbour table overflow.
Dec  7 00:36:51 fw01 kernel: NET: 27 messages suppressed.
Dec  7 00:36:51 fw01 kernel: Neighbour table overflow.
Dec  7 00:38:14 fw01 kernel: NET: 6 messages suppressed.
Dec  7 00:38:14 fw01 kernel: Neighbour table overflow.

When I try to ping my router IP address, I get this message below: -

connect: No buffer space available

I did tried running the below command and it seems not helping much: -

iptables -I cus2jarwan -p tcp --dport 445 -j REJECT --reject-with tcp-reset

or

iptables -I cus2jarwan -p tcp --dport 445 -j DROP

How can I stop this tcp port 445 traffic?  Or how can I prevent it?

Regards,
ro0ot




