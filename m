From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: RE: NAT issues on a VPN tunnel
Date: Wed, 03 Nov 2004 05:48:07 -0500
Message-ID: <1099478887.2042.8.camel@localhost>
References: <9AD7A9B0E0BFCF42A76E29CF9F5B4087B46615@carbon.netsvcs.com>
	<1099449815.3181.3.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1099449815.3181.3.camel@hubcap.ljm.dom>
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
To: Jason Opperisano <opie@817west.com>
Cc: Netfilter users list <netfilter@lists.netfilter.org>

On Tue, 2004-11-02 at 21:43, Jason Opperisano wrote:
> On Tue, 2004-11-02 at 19:35, Christopher Lyon wrote:
> > I believe that would cause a problem on the VPN tunnel as the endpoints
> > won't match. This would need to be done on the far end (site b). 
> 
> believe what you want--it works for me.
<snip>
It can be made to work from either side.  Isn't the tunnel end point the
public address of the gateway? Unless you mean that the internal 
network addresses of the IPSec Security Policies would not match.  I
would think that is true but I have never tried it; it sounds like Jason
has.  Jason, has your solution worked with IPSec?

I have generally found it easier to NAT at the side where the conflict
is being resolved especially if the conflicting network needs
connectivity to several gateways.  Moreover, it presents no SP
problems.  I have designed set ups where the NAT is done on the other
side as Jason suggests and with IPSec in the case where the admin did
not have control over the remote side but it is a little more
complicated - John
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


