From: Randolph Carter <angelripper@cable.net.co>
Subject: TOS, DSCP and ECN
Date: Sun, 10 Nov 2002 15:29:28 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DCEC1A8.2060603@cable.net.co>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

When I mark with DSCP a packet, is it only for routed packets? I mean if 
a mark packet going through my machine, but locally generated (suposse a 
squid packet); if  I want to iddentify this packet before it going out 
(suposse for traffic control purposes) how would I mark the packet so I 
can handle it later with iproute2.

-- 
A child can go only so far in life without potty training.  It is not
mere coincidence that six of the last seven presidents were potty
trained, not to mention nearly half of the nation's state legislators.
		-- Dave Barry



