From: "Tim Evans" <tkevans@tkevans.com>
Subject: Re: Resend: MASQUERADE: Route sent us somewhere else.
Date: Tue, 5 Apr 2005 13:24:23 -0400
Message-ID: <20050405172423.M73236@tkevans.com>
References: <200504051035.j35AZn2H025714@osprey.tkevans.com>
	<20050405145028.GA2620@bender.817west.com>
	<20050405161238.M71851@tkevans.com>
	<20050405170349.GA3033@bender.817west.com>
Reply-To: tkevans@tkevans.com
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050405170349.GA3033@bender.817west.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org

On Tue, 5 Apr 2005 13:03:49 -0400, Jason Opperisano wrote

> you have two default routes, one pointing out the external interface 
> and one pointing out the internal interface:
> 
>   default via 69.251.48.1 dev eth1 
>   default via 192.168.252.254 dev eth0

Dang, there it is, right there in /etc/sysconfig/network-scripts/ifcfg-eth0. 
Obviously, my mistake, in not blanking out the pre-filled gateway box at
install time.

Thanks, once more.

--
Tim Evans, TKEvans.com, Inc.    |    5 Chestnut Court
tkevans@tkevans.com             |    Owings Mills, MD 21117
http://www.tkevans.com/         |    443-394-3864
http://www.come-here.com/News/  |    


