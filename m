From: Denis Kaganovich <mahatma@bspu.unibel.by>
Subject: Netfilter shaper?
Date: Tue, 30 Aug 2005 14:44:07 -0200
Message-ID: <43148CD7.1070903@bspu.unibel.by>
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

While I trying to tune my channel, I frustrate by "conntrackked shaper". 
All known to me qdiscs are not understand separate tcp links, but 
teoretically, all tcp traffic may be planned in case in/out channel 
rate(s) (my channel have separate bandwith - physical/VDSL (and to 
peered providers) and "internet" (payed channel, bounded by provider's 
cbq)).

Every ACK planned to receive average packet, every outbound tcp averaged 
to get next ACK, CONNRATE (if patch applied) - known, other (UDP/etc) - 
averaged "tail". And so bandwith may be be-directionally shaped on linux 
router by regualting packet delay in queue.

More easy task: qdisc/queue, sorted by CONNRATE (in or out) values (slow 
- first, fast may be dropped).

-- 
WBR,
Denis Kaganovich,  mahatma@eu.by  http://mahatma.bspu.unibel.by

