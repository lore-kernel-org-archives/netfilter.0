From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: server in DMZ
Date: Thu, 02 Sep 2004 00:21:33 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094098893.2102.165.camel@localhost>
References: <20040902025038.GA10835@tranquility.scriptkitchen.com>
	<1094094296.1824.96.camel@wolfpack.ljm.dom>
	<20040902031755.GA11485@tranquility.scriptkitchen.com>
	<1094095481.1824.102.camel@wolfpack.ljm.dom>
	<20040902035116.GA12345@tranquility.scriptkitchen.com>
	<1094097295.2037.161.camel@localhost>
	<20040902040821.GA12641@tranquility.scriptkitchen.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040902040821.GA12641@tranquility.scriptkitchen.com>
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

On Thu, 2004-09-02 at 00:08, Payal Rathod wrote:
> On Wed, Sep 01, 2004 at 11:54:55PM -0400, John A. Sullivan III wrote:
> 
> > I think you have confused the issues.  Do not put the source match in
> > the PREROUTING rule (thus your squid access from the local LAN will not
> > break).  Do put the source match in the FORWARD rule.  That will
> > restrict outside access to only 1.2.3.4.  I assume there is already a
> > FORWARD rule that allows access from the LAN.  Hope this helps - John
> 
> So, you mean I keep the PREROUTING rule as before and make
> -A FORWARD -d 10.10.10.3 -p tcp -m tcp --dport 80 -j ACCEPT
> to
> -A FORWARD -s 5.6.7.8 -d 10.10.10.3 -p tcp -m tcp --dport 80 -j ACCEPT
> 
> But will this not forward requests from my squid proxy server too?
> 
> -Payal
That's right - I keep forgetting that you are using Squid.  As I
mentioned, I'm a little rusty on Squid configuration.  How is the
traffic getting to Squid.  If I recall correctly, I usually do it with a
REDIRECT.  That means there needs to be a rule to allow the traffic to
Squid (it sounds like there already is one because access is working). 
However, at that point, doesn't the Squid ACL list take over? If I
recall, there is a section in the Squid configuration file where one
specifies which addresses are allowed what access - John
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


