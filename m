From: Sven-Haegar Koch <haegar@sdinet.de>
Subject: Re: Firewalling non-IPsec connections
Date: Tue, 16 Dec 2003 00:55:41 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.58.0312160052020.1635@mercury.sdinet.de>
References: <000c01c3c291$e4e0f3a0$fc00000a@vmwarew2k>
 <200312152044.46584.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200312152044.46584.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.netfilter.org

On Mon, 15 Dec 2003, Antony Stone wrote:

> On Sunday 14 December 2003 10:30 pm, Peter Hoeg wrote:
>
> > The REAL problem is since I need to allow connections from the wireless LAN
> > segment to go onto the internet and it seems like the connections only hit
> > the FORWARD chain AFTER the kernel has done all its magic with unpacking
> > the encrypted packages. What I would like to do is something like:

> I have used IPtables + FreeS/WAN a fair amount, and I created a diagram some
> time ago which showed the (surprisingly complex) route packets take through
> the system when you have such a combination.

FreeS/WAN is different than the in-kernel IPsec of 2.6

> 2. The packet gets processed by the Klips kernel-level IPsec module, gets
> decrypted, and appears on the ipsec0 virtual interface.

The in-kernel ipsec does not have an ipsec0 virtual interface, that is
where the problem come from - I don't see a way yet to destinguish
decapsulated ipsec traffic from eth0 to eth1 from raw traffic between the
two interfaces.

c'ya
sven

-- 

The Internet treats censorship as a routing problem, and routes around it.
(John Gilmore on http://www.cygnus.com/~gnu/)

