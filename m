From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: GUI!
Date: 29 Apr 2003 17:19:30 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1051651170.2805.90.camel@jasiiitosh.nexusmgmt.com>
References: <20030429200519.12139.55056.Mailman@kashyyyk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030429200519.12139.55056.Mailman@kashyyyk>
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

	Yes!!! I am completely immersed in developing one as I write.  It goes
far beyond just a drag and drop rule configurator and element manager. 
We split up the rule processing into separate processing for source,
destination and access type.  We arrange the sources into a hierarchical
structure with inheritance and do the same for the destinations.  The
result is that we can make highly abstracted policy statements such as
"Sales has access to Sales data" or "Developers from companies A, B and
C have access to Joint Development Project data".  We then compile those
policies into iptables rules and distribute them to the enforcement
devices either in-band or out-of-band.
	We also dynamically create iptables rules when a VPN user connects and
base the custom rules on the fields of their X.509 certs (more
accurately the DER_ASN.1_FQDN ID fields).
	We dynamically create and distribute all FreeS/WAN connection
definitions when gateways are brought on line.  We dynamically propagate
any new connections and any changes to routing topologies.  One never
has to manually define an SA again!
	This is just the start.  The project is still very young but it is
based upon four years experience of using a similar proprietary system. 
There is little on the web site (http://iscs.sourceforge.net) but there
is a pile of information in the cvs under devel-docs (see
http://www.sourceforge.net/projects/iscs).
	We could really use some help on this project as we is really me and
I'm only funded for two days.  The rest is coming out of my own pocket. 
However, I feel it is worth it.  We experienced a 90% reduction in the
time it took to manage our security policies over using the typical
CheckPoint, NetScreen, Nortel or Cisco type tools.  If anyone would like
to help or see the proprietary system in action, please drop me an
e-mail - contact details in the signature - John Sullivan

On Tue, 2003-04-29 at 16:05, netfilter-request@lists.netfilter.org
wrote:
> --__--__--
> 
> Message: 8
> From: "Vojin Urosevic" <vojin@urosevic.com>
> To: <netfilter@lists.netfilter.org>
> Subject: GUI!
> Date: Sat, 26 Apr 2003 20:24:23 +0300
> 
> Hi there,
> 
> Is anybody out there working on a GUI management tool for netfilter?
> Something like what the Watchguard folks have developed for their range
> of Firewalls. 
> 
> Features like drag and drop rules for VPN and a GUI real time connection
> monitoring from external to internal interface and vice versa.
> 
> Regards,
> 
> vu
> 
> 
> 
> 
> --__--__--
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


