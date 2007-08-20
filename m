From: Bertram Scharpf <lists@bertram-scharpf.de>
Subject: REJECT target not as policy
Date: Mon, 20 Aug 2007 15:52:06 +0200
Message-ID: <20070820135206.GA18644@bart.bertram-scharpf.homelinux.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,


on one of my machines the REJECT target doesn't behave as I
expect. It is inserted into a chain but it is not accepted
as a policy.

myhost ~ # iptables -L
Chain INPUT (policy DROP 2 packets, 116 bytes)
 pkts bytes target     prot opt in     out     source               destination 
...
    0     0 REJECT     tcp  --  any    any     anywhere             anywhere    ...
...

But:

myhost ~ # iptables -v -t filter -P INPUT REJECT
iptables: Bad policy name


How comes this? I guess it is a kernel option I have to
change. But which?

Thanks in advance,

Bertram


-- 
Bertram Scharpf
Stuttgart, Deutschland/Germany
http://www.bertram-scharpf.de

