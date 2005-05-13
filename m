From: Jason Opperisano <opie@817west.com>
Subject: Re: okay, I admit confusion here;
Date: Fri, 13 May 2005 17:55:40 -0400
Message-ID: <20050513215540.GA22122@bender.817west.com>
References: <427B93EE.3030905@eccotours.dyndns.org>
	<427C4EA3.5090501@riverviewtech.net>
	<4281FC1A.8090000@eccotours.dyndns.org>
	<42824D1E.7040508@riverviewtech.net>
	<42825732.8010206@verisignlabs.com>
	<428259CE.3080708@riverviewtech.net>
	<42825D48.2060003@verisignlabs.com>
	<20050511203452.GA13902@bender.817west.com>
	<Pine.LNX.4.60.0505131725190.2601@darkstar.sysinfo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.60.0505131725190.2601@darkstar.sysinfo.com>
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
To: netfilter@lists.netfilter.org

On Fri, May 13, 2005 at 05:31:06PM -0400, R. DuFresne wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> I have moved from a p-p-p dialup serivce to a rr business class service 
> <and learned to hate verizion>.  Anyways, rr brings in a router, and 
> gives me the /28 block <router takes an address>.  how do I setup  eht0 
> and eth1 to share the same block?  Is this a case for interface bridging 
> and ip2route?
> 
> router  <->   eth1 <external>   <->   eth0 <internal, connects to the home
> 
> router = xxx.xxx.xxx.17
> 
> eth1 = xxx.xxx.xxx.18
> 
> eth0 = xxx.xxx.xxx.19
> 
> Rest of the home net gets IP's 20-30

sounds like a job for bridging.  how's about:

router	= .17

br0	= .18

where br0 is a bridge device containing member ports eth0 and eth1.

rest of the home net can use .19 - .30 and use .17 as their default
gateway.  the only reason the bridging linux firewall needs an IP at all
would be for SSH mgmt.

-j

--
"Pearl Burton: What is this, spit soup?
 Brian: It's tomato bisque.
 Pearl Burton: What is this, snot soup?
 Brian: It's tomato bisque!
 Pearl Burton: What is this, diarrhea soup?"
        --Family Guy

