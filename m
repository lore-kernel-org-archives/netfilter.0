From: Per Jessen <per@computer.org>
Subject: simple load-distribution setup - but weird behaviour
Date: Fri, 12 Mar 2004 11:49:35 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <c2s4k0$35s$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
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
To: netfilter@lists.netfilter.org

Hi,

we're using iptables in a fairly primitive load-distribution setup - 

iptables -t nat -A OUTPUT -d 192.168.3.200 -j DNAT --to
192.168.3.101-192.168.3.108

All traffic originates on the local machine. It's been working fine for
quite a while, but today I noticed that only 7 of the 8 machines in the
cluster are being distributed to - 101,102,104,105,106,107,108 but not 103. 

There isn't an awful lot of traffic, perhaps 2-3 msgs/min. Kernel is 2.4.24. 
I tried telnet'ing to 103 (port 10025) which worked fine - and following
that 103 was suddenly also being distributed to automagically.

Is there a way of determining why 103 was not being distributed to? Or when
if this happens again, what can/should I look at? 


cheers
/Per Jessen, Zurich


