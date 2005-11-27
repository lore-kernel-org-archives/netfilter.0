From: "Michael D. Berger" <m.d.berger@ieee.org>
Subject: BAN an IP list FAST
Date: Sun, 27 Nov 2005 13:37:01 -0500
Message-ID: <000001c5f381$96b37040$2801a8c0@MBRC40>
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
To: netfilter <netfilter@lists.netfilter.org>

Say I have a list of 1000 ip addresses for which I
want to -j DROP all packets.  I could:

a. Do an iptables -A for each ip address;

b. use -j QUEUE and look up the ip address with a
   binary search in a sorted array.

I note:

1. The ip addresses are scattered, and not amenable 
   concise representations using ranges or masks.

2. Binary search of a sorted array is a very efficient
   method for finding arbitrary members of a list.

How should I proceed?
Thanks in advance for your advice.
Mike.
--
Michael D. Berger
m.d.berger@ieee.org



