From: Sven Burgener <sburgener@objeng.ch>
Subject: Re: iptables abilities
Date: Fri, 23 Jan 2004 11:23:38 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4010F62A.7090403@objeng.ch>
References: <400FC047.4010208@objeng.ch> <1089.12.75.166.13.1074782849.squirrel@nmibwkrf1.nexusmgmt.com> <4010E263.1080902@objeng.ch> <200401230911.08584.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200401230911.08584.Antony@Soft-Solutions.co.uk>
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
To: netfilter@lists.netfilter.org

Antony Stone wrote:
> The only reason you can't route private addresses across the Internet is that 
> all ISP routers drop packets sent to these address ranges.

Right.

> You would set up your VPN system to forward these packets, just the same as 
> you can set up your own firewalls and routers to forward them if you want to.
> 
> A VPN with two RFC1918 ranges at each end is a very common setup.

Yes, indeed.

My question, though, is how can a connection be established between two 
parties where one of them has a private address (A) and where you want 
to connect _to_ the server having the private address (A, see below).

The problem is, you can't establish a connection to the private address 
(A), so there has to be a means of 'hijacking' the established session 
(from X, see diagram below).


         (Internet)       (Internet)
     A <------------> X <------------> B

A: 192.168.X.X
B: 192.168.X.X
X: public IP address

The end result is to get from B to A, securely.

Cheers
Sven

