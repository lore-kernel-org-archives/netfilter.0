From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: transparent proxy
Date: Fri, 27 Feb 2004 06:50:30 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1077882630.2140.59.camel@localhost>
References: <003901c3fd0e$88a3c6f0$2a245cc2@cea05>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <003901c3fd0e$88a3c6f0$2a245cc2@cea05>
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
To: Tomasz Macioszek <tomekm@cea.pl>
Cc: Netfilter <netfilter@lists.netfilter.org>

On Fri, 2004-02-27 at 03:48, Tomasz Macioszek wrote:
> Hello!
> I have a Linux server acting as a gateway between internal network and
> internet. The iptables rule set have been working  good for long time.
> I have configured squid on this server. When I have set internal network
> client to use directly proxy server it has worked properly. But when I have
> set iptable to redirect all http traffic to squid  port (3128) it didn't
> work (transparent proxy).
> This is my iptable rule:
> iptables -t nat -A PREROUTING -p TCP --dport 80 -j REDIRECT --to-port 3128
> I think that all options in my kernel are set properly.
> I don't know why it doesn't work
> I set tcpdump to listen on 3128 port and when client tried to connect to web
> server on port 3128 showed only first IP  package of this connection and
> connections failed.
> Could you send me a solution for this problem?
> Best regards
> Tomek
It has been a while since I set up Squid but I would suggest looking in
a few areas.

Do you really want to redirect all traffic on port 80 or just the
traffic coming in from the internal interface?

Have you allowed traffic to pass on the loopback interface?

I do not recall if one needs to allow traffic to port 3128 on the INPUT
chain.
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


