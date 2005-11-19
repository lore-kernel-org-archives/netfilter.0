From: Rolf Offermanns <rolf.offermanns@gmx.net>
Subject: Re: NAT with latest netfilter ipsec patches
Date: Sat, 19 Nov 2005 11:13:03 +0100
Message-ID: <200511191113.03495.rolf.offermanns@gmx.net>
References: <200511190158.18926.rolf.offermanns@gmx.net>
	<437ED3C5.2040604@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <437ED3C5.2040604@gmail.com>
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
To: netfilter@lists.netfilter.org

On Saturday 19 November 2005 08:27, Sorin Panca wrote:
> Rolf Offermanns wrote:
> > Hi All!
>
> HI!
>
> > Host B has the following routing table entry:
> > route add -net 172.20.0.0 netmask 255.252.0.0 gw 192.168.0.1
>
> the gateway must me on the same phisical network as the host: 172.24.0.17

This is not the problem. The network between Host B and the gw is 
192.168.0.0/24. I want the gw to SNAT all packets to 172.20.0.0/14 to source 
ip 172.24.0.17 and this is the virtual IP address (strongswan feature 
leftsourceip) used in the tunnel.

The routing *is* working, my ping packets from Host B to a host in the remote 
network *do* reach the destination and the echo reply gets back to the gw, 
but it does not leave the gw, so without knowing the internals, I would say 
the "de-nating" fails.

-Rolf

