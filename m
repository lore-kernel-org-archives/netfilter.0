From: Michael Gale <michael@bluesuperman.com>
Subject: Re: Firewalling non-IPsec connections
Date: Mon, 15 Dec 2003 17:09:55 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031215170955.0353720a.michael@bluesuperman.com>
References: <000c01c3c291$e4e0f3a0$fc00000a@vmwarew2k>
	<200312152044.46584.Antony@Soft-Solutions.co.uk>
	<Pine.LNX.4.58.0312160052020.1635@mercury.sdinet.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0312160052020.1635@mercury.sdinet.de>
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
To: netfilter@lists.netfilter.org

Hello,

	Can you not check the protocol of a forward packet and if encrypted
send to a use chain:

iptables -N EXTnoipsec
iptables -N EXTyesipsec

iptables -A INPUT -i ext -p 50 -j EXTyesipsec
iptables -A INPUT -i ext ! -p 50 -j EXTnoipsec

Michael



On Tue, 16 Dec 2003 00:55:41 +0100 (CET)
Sven-Haegar Koch <haegar@sdinet.de> wrote:

> On Mon, 15 Dec 2003, Antony Stone wrote:
> 
> > On Sunday 14 December 2003 10:30 pm, Peter Hoeg wrote:
> >
> > > The REAL problem is since I need to allow connections from the
> > > wireless LAN segment to go onto the internet and it seems like the
> > > connections only hit the FORWARD chain AFTER the kernel has done
> > > all its magic with unpacking the encrypted packages. What I would
> > > like to do is something like:
> 
> > I have used IPtables + FreeS/WAN a fair amount, and I created a
> > diagram some time ago which showed the (surprisingly complex) route
> > packets take through the system when you have such a combination.
> 
> FreeS/WAN is different than the in-kernel IPsec of 2.6
> 
> > 2. The packet gets processed by the Klips kernel-level IPsec module,
> > gets decrypted, and appears on the ipsec0 virtual interface.
> 
> The in-kernel ipsec does not have an ipsec0 virtual interface, that is
> where the problem come from - I don't see a way yet to destinguish
> decapsulated ipsec traffic from eth0 to eth1 from raw traffic between
> the two interfaces.
> 
> c'ya
> sven
> 
> -- 
> 
> The Internet treats censorship as a routing problem, and routes around
> it.(John Gilmore on http://www.cygnus.com/~gnu/)
> 



