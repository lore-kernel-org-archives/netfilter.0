From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Firewalling non-IPsec connections
Date: Tue, 16 Dec 2003 08:53:01 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312160853.01932.Antony@Soft-Solutions.co.uk>
References: <000c01c3c291$e4e0f3a0$fc00000a@vmwarew2k> <200312152044.46584.Antony@Soft-Solutions.co.uk> <Pine.LNX.4.58.0312160052020.1635@mercury.sdinet.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Monday 15 December 2003 11:55 pm, Sven-Haegar Koch wrote:

> On Mon, 15 Dec 2003, Antony Stone wrote:
> >
> > I have used IPtables + FreeS/WAN a fair amount, and I created a diagram
> > some time ago which showed the (surprisingly complex) route packets take
> > through the system when you have such a combination.
>
> FreeS/WAN is different than the in-kernel IPsec of 2.6
>
> The in-kernel ipsec does not have an ipsec0 virtual interface, that is
> where the problem come from - I don't see a way yet to destinguish
> decapsulated ipsec traffic from eth0 to eth1 from raw traffic between the
> two interfaces.

Ah.   I have yet to play with the features of 2.6 kernels, therefore I didn't 
realise that this version of IPsec has such a drawback compared to FreeS/WAN.

It may be that the higher efficiency of the in-kernel version means there is 
less userspace information available about where packets came from or are 
going to...

Please let us know if you find a solution to this - I'm sure many of us will 
encounter this sort of thing in the future once 2.6 becomes standard.

Antony.

-- 
Success is a lousy teacher.  It seduces smart people into thinking they can't 
lose.

 - William H Gates III

                                                     Please reply to the list;
                                                           please don't CC me.


