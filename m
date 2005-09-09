From: Denis Kaganovich <mahatma@bspu.unibel.by>
Subject: Retransmitted TCP packets
Date: Fri, 09 Sep 2005 16:27:17 -0200
Message-ID: <4321D405.6070204@bspu.unibel.by>
Reply-To: mahatma@eu.by
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

More correct form of question:
How to detect retransmitted TCP packets (&ACK &no, if different)?
Interesting for iptables rule for it.

It may be nice for input traffic smoothing. Now I use sch_psp 
(http://www.gridmpi.org/pspacer-1.0/index.en.jsp - version 1.0.2 have 
bugs and hung on some actions with tc on my systems - RH & Gentoo with 
own  overoptimized kernels, but main goal - scheduling - work fine). Now 
I use next scheme (pure 4example):

tc qdisc add dev eth0 root handle 1: psp default 2 rate 100Mbit
tc class add dev eth0 parent 1: classid 1:1 psp rate 10Mbit mode 1
  tc class add dev eth0 parent 1:1 classid 1:10 psp mode 0
  tc class add dev eth0 parent 1:1 classid 1:20 psp mode 0
tc class add dev eth0 parent 1: classid 1:2 psp mode 0

Into class 1:10 I move ACK packets of shaped part of traffic (now - 
experemental - "-m state --state new" also - looks fine), into class 
1:20 - other shaped traffic. Now I want to exclude from 1:10 
retransmitted ACKs and get only effective ACK traffic rate estimation.

All this actions have sense of smoothing/shaping of input TCP traffic 
without direct rate estimation.

-- 
WBR,
Denis Kaganovich,  mahatma@eu.by  http://mahatma.bspu.unibel.by


