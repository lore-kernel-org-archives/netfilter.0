From: "Daniel F. Chief Security Engineer -" <danielf@supportteam.net>
Subject: Re: transparent proxy
Date: Fri, 27 Feb 2004 11:00:56 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402271100.56511.danielf@supportteam.net>
References: <003901c3fd0e$88a3c6f0$2a245cc2@cea05>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <003901c3fd0e$88a3c6f0$2a245cc2@cea05>
Content-Disposition: inline
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
To: Tomasz Macioszek <tomekm@cea.pl>, Netfilter <netfilter@lists.netfilter.org>

That rule should work fine, make sure you compiled squid with:

./configure --enable-linux-netfilter 

But for more usefull info :)
Here is a nice HOW-TO
http://en.tldp.org/HOWTO/TransparentProxy.html


On Friday 27 February 2004 02:48, Tomasz Macioszek wrote:
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
> I set tcpdump to listen on 3128 port and when client tried to connect to
> web server on port 3128 showed only first IP  package of this connection
> and connections failed.
> Could you send me a solution for this problem?
> Best regards
> Tomek

-- 
_,.-:*"``'*:-.,_,.-:*"``'*:-.,_,.-:*"``'*:-.,_,.-:*"``'*:-.,_,.-:*"``'*:-.,_
Daniel Fairchild - Chief Security Officer | danielf@supportteam.net
The distance between nothing and infinity is always the same no matter how 
close you get to nothing.


