From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: Protecting against DoS
Date: Tue, 09 Dec 2003 13:41:53 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1070995313.1869.28.camel@jasiiitosh.nexusmgmt.com>
References: <9659.200.48.142.50.1070997074.squirrel@www.netfids.com>
	 <1070992891.1867.19.camel@jasiiitosh.nexusmgmt.com>
	 <1070993798.18225.96.camel@kermit>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1070993798.18225.96.camel@kermit>
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
To: Ralf Spenneberg <lists@spenneberg.org>
Cc: Geffrey =?ISO-8859-1?Q?Vel=E1squez?= <g_netfilter@netfids.com>, Netfilter <netfilter@lists.netfilter.org>

On Tue, 2003-12-09 at 13:16, Ralf Spenneberg wrote:
> Hi,
> 
> Am Die, 2003-12-09 um 19.01 schrieb John A. Sullivan III:
> > > > echo 1 > /proc/sys/net/ipv4/tcp_syncookies -- if you have not compiled
> > > 
> > > 
> > > Is that valid for forwarded packets? or only destinated to the firewall?
> This is valid only for local packets.
> 
> > We have avoided using these /proc settings for just that concern - that
> > they are mostly for the gateway itself and not for the devices being
> > protected by it whether it is anti-spoofing with rp_filter or protecting
> > against syn_floods.  Is this assumption of ours true? Thanks, all - John
> Actually it depends. Most just concern local packets, but
> rp_filter and accept_source_route for example tests for all packets.
> 
> 
> Cheers,
> 
> Ralf
Ah, very interesting.  Yes, we do disable source route and we disable
redirects through /proc on our gateways but I thought (in my ignorance)
that rp_filter only affected traffic to the gateway.  So you are saying
that if rp_filter=1 and a packet comes into the gateway on eth0 bound
for an address on the other side of eth1 but not the address bound to
eth1 and has a source address of some device on eth0, that rp_filter
will drop the packet before it ever gets to netfilter?
To take it a step further, if rp_filter=2 and a packet come into the
gateway on eth0 bound for an address on the other side of eth1 but not
on a network directly connected to eth1 and has a source address that is
from a network that is either directly or indirectly connected to eth1,
rp_filter will drop the packet before it gets to netfilter? This
actually seems a bit strange since the network on the other side of eth0
is indirectly connected to eth1 but I'm not quite sure what rp_filter=2
means.
Thanks - John
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net 


