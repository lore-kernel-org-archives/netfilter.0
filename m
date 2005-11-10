From: Adam Rosi-Kessel <adam@rosi-kessel.org>
Subject: Re: Why would certain packets not reach nat PREROUTING chain?
Date: Wed, 9 Nov 2005 22:27:33 -0500
Message-ID: <20051110032733.GA19073@bostoncoop.net>
References: <4372A919.8020100@rosi-kessel.org>
	<4372A989.5090606@rosi-kessel.org>
	<20051110031834.GB9770@samad.com.au>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20051110031834.GB9770@samad.com.au>
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

On Thu, Nov 10, 2005 at 02:18:34PM +1100, Alexander Samad wrote:
> On Wed, Nov 09, 2005 at 08:59:37PM -0500, Adam Rosi-Kessel wrote:
> > Adam Rosi-Kessel wrote:
> > > I'm troubleshooting an issue of accessing a VPN through NAT. Right now the
> > > problem can be reduced to the following question:
> > > Under what conditions would inbound packets not be routing through the nat
> > > PREROUTING chain?
> > I should add that, just for debugging purposes, the default policy for all
> > chains is set to ACCEPT. There are also no DROP rules anywhere in any table
> > (again, just for debugging).
> my understanding is that the NAT table only sees the initial packets of
> a connection

Is that the only situation in which an inbound packet that shows up in
tcpdump would not show up in an itables nat PREROUTING log?

I also tried adding a raw table entry to prevent connection tracking, as
follows:

iptables -t raw -A PREROUTING -p udp --dport 500 -j NOTRACK

But the iptables nat PREROUTING log still did not show any of the inbound
packets.

> if this is ipsec it could be a ipsec problem ?

Well, the NAT box is not running IPSec. I'm trying to diagnose an IPSec
problem involving the client and the server, but for various reasons I
can't make the NAT box the IPSec endpoint. It shouldn't be that difficult
because I only have one box inside the LAN with a fixed NAT IP address
that needs to connect to the VPN server, and so I'm trying to direct udp
500 right to that client, but the problem seems to be the inbound packets
are not even entering the PREROUTING chain.
-- 
Adam Rosi-Kessel
http://adam.rosi-kessel.org

