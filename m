From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: DNAT based on domain name instead of IP address
Date: Wed, 28 Jan 2004 18:45:47 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1075333547.1902.34.camel@jasiiitosh.nexusmgmt.com>
References: <1075332153.25415.98.camel@child-of-god.holiness.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1075332153.25415.98.camel@child-of-god.holiness.ch>
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
To: Glen Lee Edwards <glen@holiness.ch>
Cc: netfilter@lists.netfilter.org

On Wed, 2004-01-28 at 18:22, Glen Lee Edwards wrote:
> I have several domains that use the same IP address.  Can I DNAT them to
> different servers based on domain name instead of IP address using
> iptables?  I've tried the following, but it isn't working:
> 
> iptables -t nat -A PREROUTING -p tcp -d 1st.domain.com --dport 80 -j
> DNAT --to-destination 192.168.1.12:80
> 
> iptables -t nat -A PREROUTING -p tcp -d 2nd.domain.com --dport 80 -j
> DNAT --to-destination 192.168.1.13:80
> 
> Everything is being forwarded to 192.168.1.12 no matter which domain is
> used.  It appears that the domains are first being translated into the
> IP address, which is used instead.
> 
> Glen

I'm going to go way out on a limb here and speculate so if someone who
has actually looked at the code tells you otherwise, please listen to
them and not me!

I would assume that netfilter is only operating at layer 3.  I believe
from an earlier enlightening post from Anthony Stone(?) that all domain
names are resolved to IP addresses when the rule is loaded and the rule
uses the layer three information, i.e., the IP address, to evaluate the
rule.

It sounds like you need something that will operate on the layer 7 data
since that's where the url/uri information is going to be.  Perhaps a
proxy like squid has the ability to redirect traffic based upon layer 7
information.

I'm quite curious to see how you ultimately resolve this.  Good luck -
John
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


