From: Sebastian =?ISO-8859-1?Q?Cla=DFen?= <netfilter@basti79.de>
Subject: owner-Match in 2.6.20-rc5
Date: Thu, 25 Jan 2007 10:23:21 +0100
Message-ID: <1169717001.9575.7.camel@basti79.freenet-ag.de>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi...

Kernel:   2.6.20-rc5
Iptables: v1.3.7-20070118

The owner-Match seems not to match TCP-Packets any more. Can be tested
by inserting the rule:
iptables -I OUTPUT -m owner --uid-owner test-user -j LOG

Simply su to the specified user and using netcat (nc) to send UDP and
TCP packets shows only log entried with PROTO=UDP but none with TCP.

Anyone can reproduce this and pearhaps got a solution??

Greets
  Sebastian.


