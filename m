From: Les Mikesell <les@futuresource.com>
Subject: Re: GRE over IPSec?
Date: Thu, 06 Jan 2005 11:59:42 -0600
Message-ID: <1105034382.14796.26.camel@moola.futuresource.com>
References: <1105030318.14796.9.camel@moola.futuresource.com>
	<41DD7B1C.404@hdr-roma.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41DD7B1C.404@hdr-roma.it>
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
To: "primero@hdr-roma.it" <primero@fastwebnet.it>
Cc: netfilter@lists.netfilter.org

On Thu, 2005-01-06 at 11:53, primero@hdr-roma.it wrote:

> >This may be off-topic for this list but perhaps someone could at least
> >point me to a better source...  When doing IPSec tunnels between Cisco
> >routers it works nicely to first make a GRE tunnel which gives you
> >a fairly normal interface that can run routing protocols, etc., then
> >use 'crypto map' to push the GRE packets through IPSec encryption.
> >
> >Are there any examples available that would match this setup with
> >Linux on one end, Cisco on the other?  A Linux<->Cisco GRE is easy
> >enough and zebra/quagga should run rip or ospf over that, but then
> >I'd like to pass the GRE packets though IPSec before sending.
> >
> >  
> >
> would not be better to have a GRE Tunnel Secured with ipsec?
> i mean creating the normale tunnel
> 
> interface tunnel 1
> etc ....
> 
> then apply the crypto map to make a transport ipsec point 2 point 
> connecttion beetween the REAL interface ip address of both end of the 
> tunnel matching GRE packets.
> 
> This way you'll have a logical interface Tunnel on both routers with an 
> IPSEC encryption for all GRE packets beetween this 2 interfaces.

I thought that was what I said... Regardless, what I want is the
Linux-side setup to match.  On the Ciscos, the GRE is configured
to work without IPSec, then the IPSec tunnel is established and
an access list blocks unencrypted GRE packets. 

-- 
  Les Mikesell
    les@futuresource.com



