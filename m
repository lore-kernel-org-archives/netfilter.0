From: Eric Ellis <eellis@mail.co.gilchrist.fl.us>
Subject: Can't interpret this log entry
Date: Fri, 24 Sep 2004 11:53:35 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <415442FF.1060304@mail.co.gilchrist.fl.us>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I'm slightly confused about this log entry that I'm seeing pop up in my 
syslog.

The firewall is 200.21.1.254, on a private net.

Sep 24 11:57:03 firewall kernel: IN=eth0 OUT= 
MAC=00:40:05:3d:51:e9:00:50:3e:ed:28:a0:08:00 SRC=200.175.75.101 DST=200.2
1.1.254 LEN=56 TOS=0x00 PREC=0x00 TTL=43 ID=10814 PROTO=ICMP TYPE=3 
CODE=3 [SRC=200.21.1.254 DST=200.175.75.101 LEN=48 T
OS=0x00 PREC=0x00 TTL=102 ID=2554 DF PROTO=TCP INCOMPLETE [8 bytes] ] 


it *almost* looks like my box is sending an ICMP query, and getting a 
"port closed" response.  The thing that bothers me about this is that I 
don't allow ICMP to talk on the box at all, so I shouldn't be sending 
ICMP, or if the machine tries to, I should be getting it logged, as I'm 
logging all of my drops.

Confused.
-- 
Eric Ellis
Gilchrist County Sheriff's Department
IT Coordinator
eellis@mail.co.gilchrist.fl.us
352-463-3181

