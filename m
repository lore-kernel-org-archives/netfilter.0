From: Jason Opperisano <opie@817west.com>
Subject: Re: Tos, Mark and tunnels
Date: Tue, 05 Oct 2004 08:26:13 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096979173.1787.31.camel@wolfpack.ljm.dom>
References: <4161B1CD.EA14C2DB@roadtech.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4161B1CD.EA14C2DB@roadtech.co.uk>
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

On Mon, 2004-10-04 at 16:25, David Rye of Roadtech wrote:
> I was thinking on a set-up involving Filtering, Traffic Shaping and
> Tunnels.
> 
> This trough up a couple of questions that I hope someone can give a 
> definitive answer to.
> 
> If some or all of my traffic is tunnelled I see a potential problem
> when trying to shape traffic leaving the network.
> As far as I can see with ESP packets Route2 filters can only 
> differentiate on the destination IP as they can not see the encrypted
> traffic.
> 
> I have seen a reference to the 2.6 kernels IPsec implementation that 
> implying that if you use a netfilter rule to set a mark on the incoming 
> packets before they enter the tunnel, that the mark is replicated to 
> the ESP Packets created.
> 
> Is this correct?

yes.  marks follow packets through the stack regardless what other
processing takes place on the packet.  a packet MARK-ed in PREROUTING
will still have that mark in place in POSTROUTING and every point
between.

> If so it would allow shaping providing the shaping is done on the same
> box
> as the tunnelling.
> 
> Does the TOS field also get replicated?

i do not believe so.  however, you can use a combination of MARK-ing and
matching on "-m tos --tos X" and the resetting the TOS on the
encrypted/decrypted packet based on the mark with "-j TOS --set-tos"

> This would allow for TOS based traffic shaping on a downstream box.
> 
> Are the tos field or Marks replicated to the ESP packets for 
> freeswan/openswan and the 2.4 Kernel.
> 
> Are the IP headers TOS value, or netfilter Marks replicated to the new
> packet for the other tunnel protocols, IPIP, GRE, and so on.
> 
> while on the subject of MARKs and TOS values.
> 
> Is there any way of setting a MARK or the TOS on ftp data connections
> that 
> match as related using the ip_conntrack_ftp module?
> Without setting the same mark on packets relating to other connections?

  iptables [...] -m helper --helper ftp [...]

-j

-- 
Jason Opperisano <opie@817west.com>


