From: Askar <askarali@gmail.com>
Subject: Re: how to remove rules
Date: Tue, 23 Nov 2004 14:56:40 +0500
Message-ID: <a0f69e5041123015660cb3e4a@mail.gmail.com>
References: <a0f69e5041123012925d5cfaf@mail.gmail.com>
	<1101202776.3503.12.camel@hubcap.ljm.dom>
Reply-To: Askar <askarali@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1101202776.3503.12.camel@hubcap.ljm.dom>
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
To: netfilter@lists.netfilter.org

On Tue, 23 Nov 2004 04:39:36 -0500, Jason Opperisano <opie@817west.com> wrote:
> On Tue, 2004-11-23 at 04:29, Askar wrote:
> 
> 
> > hi
> > I have trying to remove the extra rules from my routing tables,
> > however with no luck
> > Also I want to know these duplicate entries have an effect on packets
> > going routed?
> > I have this overwhelming rules lists from my predessor who added the
> > "ip rule add fwmark" entries in firewall script, and on each run of
> > firewall script its creates an extra entry in routing table.
> > Now I want to get rid of  an extras "from all fwmark 0x2 lookup
> > squid.out" leaving only one that what's I needs.
> >
> >
> > here is the output of "ip rule ls"
> 
> the proper place for your question would be the lartc mailing list:
> http://lartc.org/#mailinglist
Sure, however reason behind posting in netfilter list coz may be i'm
only subscribe to this nice list :) and secondly coz it has iptables
touch.

iptables -A PREROUTING -i eth0 -t mangle -p tcp --dport 80  -j MARK --set-mark 2

regards


> -j
> 
> --
> "I'll leave the world the same way I came into it - dirty, screaming
>  and torn away from the woman I love."
>         --The Simpsons
> 
> 


-- 
(after bouncing head on desk for days trying to get mine working, I'll make
your life a little easier)

