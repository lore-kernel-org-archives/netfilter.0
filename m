From: Michael <mutk@iprimus.com.au>
Subject: Re: Fw: How to remove Established Connection
Date: Fri, 11 Oct 2002 19:15:47 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DA696C3.5000508@iprimus.com.au>
References: <00e301c270e7$09c5a7e0$7cfcc5cb@humanpc> <20021011074918.SGVP459.mta02-svc.ntlworld.com@there> <002d01c270fe$86ca3c80$7cfcc5cb@humanpc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.samba.org

HareRam wrote:

>then ? how do i remove my establish client, when we do some accounting
>when he logged out, he should not get any browsing, as well as he should be
>removed from internet
>how can i achieve
>
>please guide me alternative method to achieve this
>

You remove the rule that accepts the established connection.

I have a specific rule for each host that is forwarded through firewall. 
If I want to allow the host, I add the rule in FORWARD chain:

ACCEPT     all  --  *      eth0    <ip_of_host>        
0.0.0.0/0          state RELATED,ESTABLISHED

When I want to stop them I just remove the rule. Even if the established 
entry appears and lingers in /proc/net/ip_conntrack, it can't go anywhere.
At least that's how it seems to work for me... Am I wrong??

Cheers,
Michael


