From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: Newbie - problem with PREROUTING on nat - I'm missing
	something obvious?
Date: Tue, 16 Mar 2004 22:13:50 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1079493229.2026.14.camel@localhost>
References: <1079484547.5206.18.camel@bluespi.orb.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1079484547.5206.18.camel@bluespi.orb.co.nz>
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
To: al clethero <aclethero@ihug.co.nz>
Cc: netfilter@lists.netfilter.org

On Wed, 2004-03-17 at 08:49, al clethero wrote:
> Folks
> 
> I'm having some issues with the nat table and redirection. I'm trying to
> redirect traffic destined for port 80 to port
> 8080, so that there is no need to specify a proxy server in the browser
> settings. I'm fairly new to netfilter, so it may be I'm missing
> something obvious. If so, I apologise beforehand!
> 
> I set up a contrived scenario on my isolated test system as follows (so
> the browser, squid etc are all running on the same box):
> 
> 1/ I have nothing listening on port 80
> 2/ Squid is running, listening on port 8080
> 3/ Proxy options are turned off in the browser
> 4/ iptables has the following statement in the nat table (and this is
> the only statement in my iptables while I test this out):
> 
>    iptables -t nat -A PREROUTING  -p tcp --dport 80 -j REDIRECT
> --to-ports 8080
> 
> My understanding of this rule is that any tcp packets destined for port
> 80 on any interface will be redirected to port 8080.
> 
> 5/ I try to connect to www.google.com from the browser and the following
> should happen:
> 
> the request goes out to port 80
> the rule in the nat table picks up the packet and forwards it to port
> 8080, where squid connects to google, retrieves the page and supplies it
> to the browser.
> 
> However, this doesn't seem to happen, connections go straight through to
> google from port 80 without being redirected. I have tested this by
> shutting down squid and having no proxy servers configured in the
> browser, yet I can still connect, whereas I would expect an error.
> 
> If I check the iptables status before and after doing this I get
> 
> Before
> 
> iptables -t nat -v -L
> Chain PREROUTING (policy ACCEPT 0 packets, 0 bytes)
>  pkts bytes target     prot opt in     out     source              
> destination
>          
>     0     0 REDIRECT   tcp  --  any    any     anywhere            
> anywhere
>        tcp dpt:http redir ports 8080
>  
> Chain POSTROUTING (policy ACCEPT 10 packets, 600 bytes)
>  pkts bytes target     prot opt in     out     source              
> destination
>          
>  
> Chain OUTPUT (policy ACCEPT 10 packets, 600 bytes)
>  pkts bytes target     prot opt in     out     source              
> destination
>          
> After
> 
> Chain PREROUTING (policy ACCEPT 43 packets, 3496 bytes)
>  pkts bytes target     prot opt in     out     source              
> destination
>          
>     0     0 REDIRECT   tcp  --  any    any     anywhere            
> anywhere
>        tcp dpt:http redir ports 8080
>  
> Chain POSTROUTING (policy ACCEPT 209 packets, 13148 bytes)
>  pkts bytes target     prot opt in     out     source              
> destination
>          
>  
> Chain OUTPUT (policy ACCEPT 209 packets, 13148 bytes)
>  pkts bytes target     prot opt in     out     source              
> destination
>          
> 
> Since the above seems to indicate packets going through the nat
> prerouting chain but not being acted upon I suspect I am missing
> something fairly obvious!
<snip>
I must confess to not fully digesting your message as I am up against a
deadline.  However, three things come to mind.

1) are you really sure that Squid has stopped? It frequently runs from a
daemon which continually restarts it even after doing a squid -k
shutdown

2) do you really want to redirect all traffic destined for port 80 or
just the traffic coming from the Internal network?

3) I believe you must ensure that traffic can flow to interface lo on
the INPUT chain as well as doing the redirect . . . but it has been a
long time since I configured Squid so I may be wrong
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


