From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: Netfilter and Squid
Date: Tue, 27 Jan 2004 12:54:50 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1075226090.1898.78.camel@jasiiitosh.nexusmgmt.com>
References: <5.2.1.1.0.20040127093418.029803f0@mail.cybercorpinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <5.2.1.1.0.20040127093418.029803f0@mail.cybercorpinc.com>
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
To: Glen Spidal <glens@cybercorpinc.com>
Cc: netfilter@lists.netfilter.org

On Tue, 2004-01-27 at 12:41, Glen Spidal wrote:
> Hello all,
> 
> I have the following setup:
> 
> Internet->PublicIP_Router->Cross-over-cable->Squid_Server->LAN
> 
> Squid works fine as does Dans' Guardian web filter.  MY question is what do 
> I need to do to route web traffic through squid and allow email traffic to 
> flow around Squid?  Currently, client-based email (Outlook and Entourage) 
> does not work because there is no route.  I must make sure that all LAN 
> clients go through squid since it is a school.
> 
> I've looked through the how-to's but have not found specific examples and 
> syntax.
<snip>
I usually set Squid up as a transparent proxy, i.e., I use the REDIRECT
iptables target to redirect any Internet bound traffic on port 80 to
port 3128 on the same server (and thus to Squid) whereas all other
traffic just obeys the normal iptables rules - John 
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


