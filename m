From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptables abilities
Date: Fri, 23 Jan 2004 10:38:13 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401231038.13824.Antony@Soft-Solutions.co.uk>
References: <400FC047.4010208@objeng.ch> <200401230911.08584.Antony@Soft-Solutions.co.uk> <4010F62A.7090403@objeng.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4010F62A.7090403@objeng.ch>
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

On Friday 23 January 2004 10:23 am, Sven Burgener wrote:

> My question, though, is how can a connection be established between two
> parties where one of them has a private address (A) and where you want
> to connect _to_ the server having the private address (A, see below).
>
> The problem is, you can't establish a connection to the private address
> (A), so there has to be a means of 'hijacking' the established session
> (from X, see diagram below).
>
>          (Internet)       (Internet)
>      A <------------> X <------------> B
>
> A: 192.168.X.X
> B: 192.168.X.X
> X: public IP address
>
> The end result is to get from B to A, securely.

X cannot connect to either of the private addresses A or B, because you show 
both these routes as going across the Internet, and as you correctly say 
yourself, you cannot connect to a private address across the Internet.

In order to connect from A to B across the Internet (let's ignore X for now, I 
think it serves no useful purpose), both A and B must be given public 
(routable) addresses, even if these are provided by some sort of NAT going on 
at the point where A's network and B's network each plug in to the Internet.

In order to connect from A to B securely, you need a secure protocol (HTTPS or 
SSH would be good examples) or a VPN if you want to connect insecure 
protocols (such as HTTP, FTP, POP3, SMTP etc).   Setting up a VPN between A 
and B requires two machines, each with a public address, one at A's point of 
connection to the Internet, and one at B's point of connection - these two 
machines set up a secure tunnel between them (eg using IPsec) and then they 
route packets from A to B (using the 'real' private addresses of A and B) 
through this tunnel.

I think the basic point which has to be made regarding your question is that 
in order to connect between two machines across the Internet, they *both* 
need to have public routable addresses (either directly, or via NAT), 
otherwise your packets will get discarded before they reach their 
destination.

Regards,

Antony.

-- 
This is not a rehearsal.
This is Real Life.

                                                     Please reply to the list;
                                                           please don't CC me.


