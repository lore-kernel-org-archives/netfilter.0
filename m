From: Adam Rosi-Kessel <adam@rosi-kessel.org>
Subject: Re: Why would certain packets not reach nat PREROUTING chain?
Date: Thu, 10 Nov 2005 08:45:17 -0500
Message-ID: <20051110134516.GA2080@bostoncoop.net>
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

Sandro Dentella Wrote:

> > I'm troubeshooting an issue of accessing a VPN through NAT. Right now
> > the problem can be reduced to the following question:
> > Under what conditions would inbound packets not be routing through the
> > nat PREROUTING chain?
> That's a problem that puzzles me too. Do you have fancy routing tables?
> (several different tables setup w/ iproute2).

Nope. At least for the purposes of this experiment, this is the only
thing I'm trying to do. The entire task of iptables is SNATting outbound
packet from the LAN, and then attempting to DNAT inbound packets on udp
port 500 to a specific machine with the LAN. The outbound SNAT works
fine; but the inbound packets don't ever reach the nat PREROUTING chain.

> I also have a setup in which icmp packets will not get to PREROUTING.
> My understanding is that the kernel does not understand they are destined
> for that box: could that be your situation?

I don't think that's related, although I admit I don't have a thorough
understanding of the issue... why would icmp packets matter when the
issue is inbound UDP 500 packets that are showing up in tcpdump? Wouldn't
showing up in tcpdump indicate that the kernel understands the packet is
destined for that box?
-- 
Adam Rosi-Kessel
http://adam.rosi-kessel.org

