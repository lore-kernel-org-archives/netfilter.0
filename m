From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: server in DMZ
Date: Wed, 01 Sep 2004 23:54:55 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094097295.2037.161.camel@localhost>
References: <20040902025038.GA10835@tranquility.scriptkitchen.com>
	<1094094296.1824.96.camel@wolfpack.ljm.dom>
	<20040902031755.GA11485@tranquility.scriptkitchen.com>
	<1094095481.1824.102.camel@wolfpack.ljm.dom>
	<20040902035116.GA12345@tranquility.scriptkitchen.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040902035116.GA12345@tranquility.scriptkitchen.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Payal Rathod <payal-netfilter@scriptkitchen.com>
Cc: Netfilter ML <netfilter@lists.netfilter.org>

On Wed, 2004-09-01 at 23:51, Payal Rathod wrote:
> On Wed, Sep 01, 2004 at 11:24:41PM -0400, Jason Opperisano wrote:
> > i can simplify it to:
> > 
> >   -A FORWARD -p tcp -s 1.2.3.4 -d 10.10.10.3 --dport 80 -j ACCEPT
> 
> Ok easy enough I guess :)
> 
> > > it will block access from my local LAN also via. the squid proxy and yes 
> > > the gateway (squid proxy) machine does have 3 cards.
> > 
> > yes--you're probably right that it would break access from the local LAN
> > in your current configuration
> 
> So, what do I do for such a case?
> 
> -Payal
I think you have confused the issues.  Do not put the source match in
the PREROUTING rule (thus your squid access from the local LAN will not
break).  Do put the source match in the FORWARD rule.  That will
restrict outside access to only 1.2.3.4.  I assume there is already a
FORWARD rule that allows access from the LAN.  Hope this helps - John
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


