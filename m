From: Jason Liao <maillist@Gallantry.com>
Subject: Re: How to change a packet's arriving interface? -j ROUTE?
Date: Mon, 09 Dec 2002 17:32:21 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DF54425.6CDB2FF4@Gallantry.com>
References: <3DF0D338.C2F4E50@Gallantry.com> <1039411928.1714.3.camel@rayw.knowledgefactory.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: raymondl@knowledgefactory.co.za
Cc: netfilter@lists.netfilter.org

Hi Ray,

Thank you for your reply, but maybe I was not clear in the original
post:  The destination of the incoming traffic is the firewall machine
itself, just the destination IP address is of the DMZ interface.  For
this reason, the FORWARD rule won't be checked because it is basically
INPUT traffic.  Another issue is that the traffic is IPSec so that any
change to the source address (SNAT) will break the IPSec authentication.

Thanks again for your suggestions.

Best regards,

Jason Liao

Raymond Leach wrote:
> 
> Hi
> 
> Use SNAT on the POSTROUTING chain in the NAT table.
> 
> iptables -t nat -A POSTROUTING -d $NET_DMZ -j SNAT --to-source
> $IP_DMZ_IFACE
> 
> also you would need a FORWARD rule to route the initial traffic:
> iptables -A FORWARD -d $NET_DMZ -j ACCEPT
> 
> These are the least restrictive examples of possible rules. The above
> assumes you have public ips in your DMZ.
> 
> Ray
> 
> On Fri, 2002-12-06 at 18:41, Jason Liao wrote:
> > Hi,
> >
> > I have a firewall running iptables with 3 interfaces: LAN, WAN and DMZ.
> > The LAN IP address is 10.0.0.1/24, WAN 66.134.34.157/28, and DMZ
> > 66.134.34.249/28.  The WAN interface connects to the Internet and the
> > DMZ interface connects to a stub network.
> >
> > When someone sends a packet to the IP address of the DMZ interface from
> > the Internet, the packet x.x.x.x->66.134.34.249 arrives at the WAN
> > interface.  I want to know if there is a way using iptables (maybe with
> > other tools such as iproute2) to make this packet to appear as if it
> > arrives at the DMZ interface.  The packet itself should not be
> > modified.  I need this to work because I am running an IPSec VPN with
> > FreeS/WAN on the DMZ interface.  When the ESP packets arrives on the WAN
> > interface, they cannot be properly processed by IPSec because the ipsec0
> > interface is tied to the DMZ interface directly.
> >
> > I looked at the mangle table but could not figure out if it is the right
> > direction.  I read about the ROUTE target but do not know if this target
> > is for diverting packets to be sent OUT on another interface, or can it
> > be used to change a packet's arriving interface.
> >
> > Thanks in advance.
> >
> > Jason Liao
> --

