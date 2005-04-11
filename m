From: root@epsilon.rdc.pl (root)
Subject: Re: vpn problem
Date: Mon, 11 Apr 2005 12:47:01 +0200
Message-ID: <20050411104701.GA10095@epsilon.rdc.pl>
References: <42580075.7050007@elte.hu>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <42580075.7050007@elte.hu>
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
To: netfilter@lists.netfilter.org

On Sat, Apr 09, 2005 at 06:18:39PM +0159, Nagy Zoltan wrote:
> i'm think about how can i set up a vpn on our lan,
> and make possible that not all systems are reachable by the connected vpn 
> users
> something like that user A have access to our data servers only, but user B 
> can access the database,firewall servers
> i'm thinking about that if the clients can login to the vpn gw server i 
> could use gid match to put the clients ip in a recent list,
> and i can use the recent lists to mark the packets and filter by that ;)
> i'm thinking about that i've missed something...and there is a simpler 
> solution ;)

Depends on the vpn technique.
I would just use different openvpn connections with different keys, so
the users cannot use "not their" conections. Then you can easily add
filter rules in the openvpn up-script.

