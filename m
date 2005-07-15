From: Trevor Cordes <netfilter@tecnopolis.ca>
Subject: Re: SegFault on flush + IPSec and Nat on 2.6.10 fails
Date: Fri, 15 Jul 2005 13:36:11 -0500
Message-ID: <20050715183611.GB22834@pog.tecnopolis.ca>
References: <DB15CAD558452949A35006D66C5C5A99010F7C@nav-post.navcorp.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <DB15CAD558452949A35006D66C5C5A99010F7C@nav-post.navcorp.com>
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
To: Robert Borger <bborger@navcorp.com>, netfilter@lists.netfilter.org

On Wed, Mar 02, 2005 at 05:21:16PM -0600, Robert Borger wrote:
> 
> 2) I have two IPSec gateways with private subnets behind them.
> Both the local gateway and the subnet behind it need secure
> access to the subnet behind the remote gateway.  I have
> verified that the masquerading is working correctly without IPSec.
> 
> The IPSec configuration creates a tunnel between the local
> gateway and the subnet behind the remote gateway.
> With IPSec active, packets from the local subnet to the remote subnet
> are nated, encrypted, and sent out the tunnel.  The return ping
> packet comes back through the tunnel and is decrypted but doesn't
> appear to be de-nated and routed on to the local subnet.  It appears
> to be destine for the address of the tunnel at the local gateway.
> The gateway itself communicates with the remote subnet as intended.

This is a known bug.  NAT with native linux 2.6 IPSEC is 
broken/non-existent.  There is a patch for 2.6.10, and maybe 2.6.11, that 
allows NAT to work with native IPSEC.  I am using this patch successfully 
with 2.6.10 on many machines.  However, I'm getting clobbered by another 
bug, probably the conntrack limit bug in 2.6.10.  I have not yet gotten a 
working 2.6.11 NAT/IPSEC patch yet.

I am unsure of the status of this situation and its resolution.  I have 
put some good RH bugzilla bugs up for this stuff and anyone interested 
should CC to it and make some noise.  The comments made there are also 
very interesting as to why the patches aren't in the mainstream kernel 
yet.

ipsec/nat bug:
https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=143374

possible conntrack bug:
https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=159181

