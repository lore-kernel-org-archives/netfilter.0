From: David Rye of Roadtech <d.rye@roadtech.co.uk>
Subject: Tos, Mark and tunnels
Date: Mon, 04 Oct 2004 21:25:49 +0100
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <4161B1CD.EA14C2DB@roadtech.co.uk>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I was thinking on a set-up involving Filtering, Traffic Shaping and
Tunnels.

This trough up a couple of questions that I hope someone can give a 
definitive answer to.

If some or all of my traffic is tunnelled I see a potential problem
when trying to shape traffic leaving the network.
As far as I can see with ESP packets Route2 filters can only 
differentiate on the destination IP as they can not see the encrypted
traffic.

I have seen a reference to the 2.6 kernels IPsec implementation that 
implying that if you use a netfilter rule to set a mark on the incoming 
packets before they enter the tunnel, that the mark is replicated to 
the ESP Packets created.

Is this correct?

If so it would allow shaping providing the shaping is done on the same
box
as the tunnelling.

Does the TOS field also get replicated?

This would allow for TOS based traffic shaping on a downstream box.

Are the tos field or Marks replicated to the ESP packets for 
freeswan/openswan and the 2.4 Kernel.

Are the IP headers TOS value, or netfilter Marks replicated to the new
packet for the other tunnel protocols, IPIP, GRE, and so on.

while on the subject of MARKs and TOS values.

Is there any way of setting a MARK or the TOS on ftp data connections
that 
match as related using the ip_conntrack_ftp module?
Without setting the same mark on packets relating to other connections?

-- 
J. David Rye
http://www.roadrunner.uk.com
http://www.rha.org.uk
mailto://hostman@road-runner.net

