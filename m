From: Simon Lodal <simonl@parknet.dk>
Subject: DNAT hiding routers behind it
Date: Fri, 06 Aug 2004 19:25:13 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4113BEF9.5090706@parknet.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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


I am traceroute'ing a DNAT'ed host. Surprisingly, all routers between 
the DNAT'ing firewall and the host appear as the IP address I am 
traceroute'ing. Is this intended? Can it be controlled in some way? (it 
is not necessarily bad)

Example:
traceroute to 217.116.235.62 (217.116.235.62), 30 hops max, 38 byte packets
  1  192.168.0.2 (192.168.0.2)  4.152 ms  0.875 ms  0.865 ms
  2  217.116.235.62 (217.116.235.62)  1.928 ms  1.272 ms  1.430 ms
  3  217.116.235.62 (217.116.235.62)  2.013 ms  2.338 ms  2.330 ms

Line 1: DNAT'ing firewall.
Line 2: A router.
Line 3: DNAT'ed host.

I would the expect the router to show up with it's own IP address, not 
the original target address.


Simon

