From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: Help with iptables
Date: Wed, 10 Dec 2003 19:31:13 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1071102673.1876.42.camel@jasiiitosh.nexusmgmt.com>
References: <FB11F223A1DE69499D299308731DD413014A2A@mail.SBPC>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FB11F223A1DE69499D299308731DD413014A2A@mail.SBPC>
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
To: Bryan Dyson <lan_administrator@solanapres.org>
Cc: netfilter@lists.netfilter.org

On Wed, 2003-12-10 at 18:45, Bryan Dyson wrote:
> Hi folks,
> 
> I've got my iptables setup and working with one small glitch. My ISP
> says I'm an open proxy.
> What I'm trying to do is set a rule in iptables that will drop port
> 3128 requests coming from the outside but still allow my internal
> network to use the proxy on this port.
> 
> I've tried the following, but they seem to shut down routing of e-mail
> from the internal mail server:
> 
> -A PREROUTING -I eth1 -p tcp -m tcp --dport 3128 -j DROP
> And
> -A PREROUTING -I x.x.x.x (public IP) -p tcp -m -tcp --dport 3128 -j
> DROP
<snip>

If it helps, here are some excerpts from a file I pass to
iptables-restore -n (minus the comments) to activate my proxy:

*filter
-A INPUT -i eth0 -p tcp -m tcp --dport 3128 -j ACCEPT
	#allow the proxy to receive traffic from the internal devices (eth0 is
the private interface in my set up)
-A OUTPUT -o eth0 -p tcp -m tcp --sport 3128 -j ACCEPT
	#allow the proxy to respond to the internal clients
-A OUTPUT -p 6 -m tcp --dport 80 -m state --state NEW -j ACCEPT
	#allow the proxy to talk to the web servers of the world! Of course,
there is a corresponding --state RELATED, ESTABLISHED -j ACCEPT
somewhere else in the configuration
COMMIT
*nat
-A PREROUTING -i eth0 -p tcp -m tcp --dport 80 -j REDIRECT --to-ports
3128
	#Cause the redirection from the internal interface (eth0 in my case)
COMMIT

All filter table policies are DROP so if I do not explicitly allow it,
it is denied.
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


