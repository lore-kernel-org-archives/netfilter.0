From: "Chris Lyon" <cslyon@netsvcs.com>
Subject: RE: NAT issues on a VPN tunnel
Date: Thu, 4 Nov 2004 22:42:52 -0800
Message-ID: <CARBONpIGRFh6qb9426000029c5@carbon.netsvcs.com>
References: <20041103154924.GA26510@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041103154924.GA26510@bender.817west.com>
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
To: 'Jason Opperisano' <opie@817west.com>, netfilter@lists.netfilter.org

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> bounces@lists.netfilter.org] On Behalf Of Jason Opperisano
> Sent: Wednesday, November 03, 2004 7:49 AM
> To: netfilter@lists.netfilter.org
> Subject: Re: NAT issues on a VPN tunnel
> 
> On Tue, Nov 02, 2004 at 11:03:53PM -0800, Chris Lyon wrote:
> > > On Tue, 2004-11-02 at 19:35, Christopher Lyon wrote:
> > > > I believe that would cause a problem on the VPN tunnel as the
> endpoints
> > > > won't match. This would need to be done on the far end (site b).
> > >
> > > believe what you want--it works for me.
> >
> > So how do you build the tunnel?
> 
> the tunnel is built between the public external IP's of the two
> gateways.
> 
> in a scenario where site A and site B both use 10.0.0.0/24 as their
> internal network, and we need to build a VPN between them:


But that is not my case. I have three sites with the two remote sites being
in conflict. 

Site A 192.168.254.0/24
Site B 10.10.0.0/16
Site C 10.10.0.0/16

So, I would need to do the translation on the remote side, site B and site
C.

Correct? I can't see doing this at the head end.

> 
> -------
> Site A
> -------
> ipsec.conf:
>   leftsubnet=172.31.1.0/24
>   rightsubnet=172.31.2.0/24
> 
> # map our 10.0.0.0/24 to 172.31.1.0/24 when going over the VPN
> iptables -t nat -A POSTROUTING -o ipsec0 \
>   -s 10.0.0.0/24 -j NETMAP --to 172.31.1.0/24
> 
> # unmap packets from the other side to 172.31.1.0/24 to our 10.0.0.0/24
> iptables -t nat -A PREROUTING -i ipsec0 \
>   -d 172.31.1.0/24 -j NETMAP --to 10.0.0.0/24
> 
> -------
> Site B
> -------
> ipsec.conf:
>   leftsubnet=172.31.2.0/24
>   rightsubnet=172.31.1.0/24
> 
> # map our 10.0.0.0/24 to 172.31.2.0/24 when going over the VPN
> iptables -t nat -A POSTROUTING -o ipsec0 \
>   -s 10.0.0.0/24 -j NETMAP --to 172.31.2.0/24
> 
> # unmap packets from the other side to 172.31.2.0/24 to our 10.0.0.0/24
> iptables -t nat -A PREROUTING -i ipsec0 \
>   -d 172.31.2.0/24 -j NETMAP --to 10.0.0.0/24
> 
> when someone in site A needs to connect to 10.0.0.100 in site B, they
> connect to 172.31.2.100.
> 
> when someone in site B needs to connect to 10.0.0.100 in site A, they
> connect to 172.31.1.100.
> 
> keep in mind that that packets are sent over the tunnel based on their
> destination address, not their source address.  also keep in mind that
> the packets are still in the clear on ipsec* interfaces and encrypted on
> the physical interfaces.
> 
> dunno if this helps any, but it works for me.  this is how it makes
> sense to me in my head--that each side should perform it's own
> chicanery.  i'm not saying it can't be made to work some other way.
> 
> -j
> 
> --
> "'Nuke the whales?' You don't really believe that, do you?
>  I dunno. Gotta nuke something."
>         --The Simpsons
> 



