From: Reed Wiedower <rwiedower@peyser.com>
Subject: problem with FORWARD chain
Date: Fri, 10 Jan 2003 18:11:19 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <211E94403B74D211878A0008C71C74DC60DCD5@ip216-50-5-162.z5-50-216.customer.algx.net>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

I'm setting up a simple bridge firewall, and I've managed to get the
bridging working properly. However, every time I attempt to create a
firewall rule to prevent packets from traversing the FORWARD chain, I notice
that, at least according to "iptables -L -vX", no packets are going across
that particular chain. Any idea why this might be happening? I can implement
rules on both the INPUT and OUTPUT chains and they work as expected, but for
some reason nothing will display on the FORWARD chain.

The bridging folks seem to think that it's an issue with iptables, not with
the bridging code. Thanks in advance if anyone has seen this or knows how to
deal with it.


eol,

Reed


reed wiedower
reed.wiedower@peyser.com
peyser.com
202.638.3730x115


