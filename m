From: Jason Opperisano <opie@817west.com>
Subject: Re: NATTING for a whole network.
Date: Fri, 10 Dec 2004 13:59:55 -0500
Message-ID: <1102705194.3135.40.camel@hubcap.ljm.dom>
References: <4D7EBAB4CCB6DB4AB7EE598E9ED186950474D69B@asusfl45cex08.us-fl.cards.citicorp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4D7EBAB4CCB6DB4AB7EE598E9ED186950474D69B@asusfl45cex08.us-fl.cards.citicorp.com>
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

On Thu, 2004-12-09 at 12:22, Irvin, Michael Thad wrote:
> I'm kinda new at this iptables thing.  I've been running into a problem with
> trying to NAT for a class C subnetted class A network...i.e. 10.168.1.0/24.
> The syntax I've been using is as follows -- $ipt -t nat -A POSTROUTING -o
> $outside -j SNAT -to-source $lan, with the variable $lan = "10.168.1.0/24".

are you really trying to source-nat all traffic exiting your outside
interface to 10.168.1.x?  you say you're trying to NAT *for* a class C
subnet--while your rule is NATing *to* a class C subnet.

> Everytime I've ran the script I get the following error <iptables v.x.x.x
> Bad IP Address.  Can anyone please help me with the proper syntax to make
> this work?  I've tried various options such the one above, also including
> the whole subnetmask  and playing around with different delimitation
> options, nothing seems to work.

"-j SNAT" does not accept CIDR notation--to get the same effect, you
would need to use a range specified as:

  iptables -t nat -A POSTROUTING -o $OUTSIDE \
    -j SNAT --to-source 10.168.1.1-10.168.1.254

if your intent is actually to source-nat hosts on the inside that are in
the 10.168.1.0/24 network--your rule would be:

  iptables -t nat -A POSTROUTING -o $OUTSIDE -s $LAN \
    -j SNAT --to-source $OUTSIDE_IP

  where LAN="10.168.1.0/24"

this is also covered clearly in 'man iptables.'

-j

--
"Beer. Now there's a temporary solution."
	--The Simpsons


