From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: IPSec - IPTables issues
Date: Thu, 06 May 2004 12:31:36 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1083861096.2099.118.camel@localhost>
References: <20040502155538.GD515@schottelius.org>
	 <200405051622.26944.Antony@Soft-Solutions.co.uk>
	 <1083773336.9138.43.camel@localhost>
	 <200405051832.27700.Antony@Soft-Solutions.co.uk>  <409A60E0.3080304@pbl.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <409A60E0.3080304@pbl.ca>
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
To: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Cc: netfilter@lists.netfilter.org

On Thu, 2004-05-06 at 11:59, Aleksandar Milivojevic wrote:
> Antony Stone wrote:
> > On Wednesday 05 May 2004 5:08 pm, John A. Sullivan III wrote:
> >>Please pardon my ignorance; I haven't yet played with 2.6 and the native
> >>IPSec.  So how does one distinguish packets which have arrived from an
> >>IPSec tunnel and are now re-traversing netfilter from those which have
> >>arrived unencrypted and are traversing netfilter for the first time?
> > 
> > That is a very good question, and one to which I am not aware of a good 
> > answer.   In my (extremely limited) experience of looking at IPsec in the 2.6 
> > kernels this is a major disadvantage of the design, and means it is not 
> > possible to secure a VPN (by which I mean selecting which traffic is allowed 
> > down it and which is not, as it was possible to do with FreeS/WAN by writing 
> > netfilter rules specifying ipsecN as the output interface).
> 
> In general case, both of you are right.
> 
> However, in practice, you will always require all traffic from selected 
> IP addresses to be encrypted.  After all, the original question was how 
> to achieve that kind enforcement.  The solution is to enforce it by 
> IPSec policy, so you do not need to worry about it when writing your 
> firewall rules.  If you see unencrypted packet traversing Netfilter 
> chains, than it is traversing it for the second time.  If packet arrived 
> in clear text from the wire, it would be dropped by IPSec module (and it 
> is irrelevant if packet is first handad to Netfilter or IPSec, in either 
> case it will be dropped long before it reaches userspace or any other 
> part of kernel).

Thank you very much for your responses.  This issue will become very,
very important to us in the ISCS project (http://iscs.sourceforge.net)
as we incorporate support for the native Linux IPSec stack.

I assume you mean that this decision is made on a per connection basis
otherwise how would we use the same box to handle VPN connections from
the internal network and Internet access to a DMZ.  In other words,
(again I am completely ignorant of the syntax), we would say all traffic
coming from the 10.1.5.0/24 network must be encrypted or dropped while
traffic not from the 10.1.5.0/24 network can be unencrypted and passed
to iptables.  We would then have rules such as 
iptables -A FORWARD -s 10.1.5.0/24 -d SpecialSecureInternalServer -p tcp
--dport ftp -j ACCEPT
iptables -A FORWARD -d PublicServer -p tcp --dport http -j ACCEPT

I assume we are protected from spoofing because if a public user spoofs
10.1.5.8, it will be dropped because it is not encrypted.

Have I followed you correctly thus far?

This still presents the ISCS project with problems.  ISCS is designed to
handle very complex security.  How would this native IPSec solution be
handled in the following two problem cases.

First, both to minimize the size of the rules set and to allow RAS users
to route through the entire VPN cloud from a single VPN gateway, we both
separate the evaluation of source and destination and make all security
decisions on the gateway protecting the Accessor (our term for a user,
i.e., the source) and not the one protecting the Resource (i.e., the
destination).

In other words, we do not write monolithic rules like:
iptables -A FORWARD -s TheAccessor -d TheResource -j ToSomeAction

Instead, every gateway in the cloud knows about every resource.  When an
Accessor attempts to access a Resource, the Accessor sends the packet to
its protecting gateway where it encounters a rule which evaluates only
the source, e.g., 
iptables -A ACCESS_GROUPS -s TheAccessor -j
ToAccessorGroupMembershipChain

It jumps to the GroupChain (how we implement policies which grant access
based upon hierarchical group membership with inheritance) where it
encounters rules that jump the packet to the Resource Group chains (the
other half of how we implement policies which grant access based upon a
hierarchichal grouping of both Accessors and Resources with inheritance)
where it encounters only ACCEPT (or DROP in the case of DENY policies)
rules, e.g., 

iptables -A AccessGroupChain -j ResourceGroupChain

iptables -A ResourceGroupChain -d x.x.x.x -p y --dport z -j ACCEPT

Thus, the access control decision about what is allowed in the tunnel is
made at the ingress point.  To avoid all gateways having to make the
exact same decision again and to avoid requiring all gateways to know
about all possible Accessors including RAS connected ones, the remote
(Resource) gateway trusts the decision of the local (Accessor) gateway
by allowing all traffic coming out of the tunnel.  How would I identify
this traffic without knowing the source IP (communicating the source IP
for every RAS connection would be a nightmare)?

Second, we would eventually like to encrypt data based upon the needs of
the data rather than the network path.  In other words, there may be a
VPN connection between gatewayA and gatewayB but, the encryption
strength varies based upon the data we are passing between them.  If we
are passing very sensitive data, we might use AES, if we are passing
only moderately sensitive data, we might use DES and if we are passing
public data, we will pass it in the clear.  This not only saves CPU
cycles but provides a powerful and legal way to allow access to less
sensitive data in areas with encryption use restrictions without
compromising security for the entire site.  This again makes it
important to identify the data as emerging from the tunnel whether it is
encrypted or not.  How would we do this?

I understand this is a long e-mail so feel free to ignore it.  These are
issues I will need to resolve once we get the first release of ISCS out
the door.  Thanks - John
-- 
Open Source Development Corporation
Financially Sustainable open source development
http://www.opensourcedevelopmentcorp.com


