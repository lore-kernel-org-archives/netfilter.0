From: Jeroen Vriesman <j.vriesman@prompt.nl>
Subject: Re: transparent proxy
Date: Fri, 27 Feb 2004 10:18:29 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040227101829.544cceae.j.vriesman@prompt.nl>
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
To: netfilter@lists.netfilter.org

Hi,

you cannot send http traffic directly to a proxy port, these are two different protocols (you also configure your client to use proxy or direct connection).

So, you either configure a proxy, use nat for traffic to port 80 (without using the proxy), or configure squid to listen to another port in "http accelerator mode", the last option is what you seem to want.

Good luck,
Jeroen.



On Fri, 27 Feb 2004 09:48:39 +0100
"Tomasz Macioszek" <tomekm@cea.pl> wrote:

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
> 
> 

