From: "hare ram" <hareram@sol.net.in>
Subject: Re: [SPAM-RATING-1] Re: equalize traffic when link is down
Date: Sat, 8 Mar 2003 16:46:41 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <04e401c2e564$3328d700$13fcc5cb@Housecall>
References: <1047107185.2050.62.camel@runabout.noc.starken.com> <045101c2e547$c8e84860$13fcc5cb@Housecall> <1047109241.1990.85.camel@runabout.noc.starken.com>
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

Yes

you can make some cron job for the testing the both links active or not

if one of the things down, you can clear the route cache

but who ever have been in the cached will be lost

hare
----- Original Message -----
From: "Daniel Wittenberg" <daniel-wittenberg@starken.com>
To: "Netfilter" <netfilter@lists.netfilter.org>
Sent: Saturday, March 08, 2003 1:10 PM
Subject: Re: [SPAM-RATING-1] Re: equalize traffic when link is down


> Ok, makes sense, so if we just drop the cache timeout (don't remember if
> you can configure that or not) then we can adjust the "switch-over" time
> in case the default is too high.
>
> Great, thanks!
> Dan
>
> On Sat, 2003-03-08 at 01:53, hare ram wrote:
> > Hi
> >
> > AFAIK,
> >
> > If the First Link down, the total traffic will move to Other Second
Link,
> > if you are configure and load balancing the Link
> >
> > If you make the static routes , them the traffic will be dead
> >
> > If you made the Loadbalance the both the  links,
> >  then it  will take some time to clear the routecache, once fresh route
> > cache build you will have the fresh routes,
> > so all the traffic will move towards active link.
> >
> >
> > hare
>
>
>
>


