From: "hare ram" <hareram@sol.net.in>
Subject: Re: equalize traffic when link is down
Date: Sat, 8 Mar 2003 13:23:19 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <045101c2e547$c8e84860$13fcc5cb@Housecall>
References: <1047107185.2050.62.camel@runabout.noc.starken.com>
Reply-To: "hare ram" <hareram@sol.net.in>
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
Content-Type: text/plain; charset="us-ascii"
To: Daniel Wittenberg <daniel-wittenberg@starken.com>, Netfilter <netfilter@lists.netfilter.org>

Hi

AFAIK,

If the First Link down, the total traffic will move to Other Second  Link,
if you are configure and load balancing the Link

If you make the static routes , them the traffic will be dead

If you made the Loadbalance the both the  links,
 then it  will take some time to clear the routecache, once fresh route
cache build you will have the fresh routes,
so all the traffic will move towards active link.


hare

-----
----- Original Message -----
From: "Daniel Wittenberg" <daniel-wittenberg@starken.com>
To: "Netfilter" <netfilter@lists.netfilter.org>
Sent: Saturday, March 08, 2003 12:36 PM
Subject: equalize traffic when link is down


> If you use equalize with 2 default gateways (like 2 ISP's), and one of
> them goes down, what happens to the traffic?  Will it automatically go
> out the one up link, or will some traffic fail to go out?
>
> Dan
>
>
>


