From: "Peter Marshall" <peter.marshall@caris.com>
Subject: Re: traceroute
Date: Wed, 30 Jun 2004 11:50:26 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <12c901c45eb1$946a8e10$49caa8c0@caris.priv>
References: <2E314DE03538984BA5634F12115B3A4E62E806@email1.mitretek.org>
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
To: "Piszcz, Justin Michael" <justin.piszcz@mitretek.org>, netfilter <netfilter@lists.netfilter.org>

Why would I use the INPUT chain .. I am doing a trace route from an internal
box to an internet box ... on the other side of my firewall ... I am pretty
sure that is a forwared rule ... is it not ?

Peter

----- Original Message ----- 
From: "Piszcz, Justin Michael" <justin.piszcz@mitretek.org>
To: "Peter Marshall" <peter.marshall@caris.com>; "netfilter"
<netfilter@lists.netfilter.org>
Sent: Wednesday, June 30, 2004 11:34 AM
Subject: RE: traceroute


Is there a reason why you are doing stuff with the FORWARD chain?
Have you tried enabling ACCEPT for the FORWARD chain and seeing if it
works?

Generally, with the FORWARD chain, over all other chains you need to be
careful on how you use it. If used improperly, you could screw a lot of
things up on the network.

I would recommend trying it without any forward options.
Ie: iptables -P FORWARD ACCEPT

You need the ESTABLISHED,RELATED option for the INPUT chain.

# STEP 9 - ALLOW IN WHAT WE SEND OUT
####################################### $IPTABLES -A INPUT -m state
--state ESTABLISHED,RELATED -j ACCEPT

-----Original Message-----
From: Peter Marshall [mailto:peter.marshall@caris.com]
Sent: Wednesday, June 30, 2004 10:25 AM
To: Piszcz, Justin Michael; netfilter
Subject: Re: traceroute

I don't get anything (except the name lookup) from traceroute.

When I run a packet sniffer, I see the following (when doing a
traceroute on
www.google.com)

source     destination                 Proto
me           216.239.41.99          UDP            sourceport 1059
destination port 33435
3com       3com                         ARP            who has
<gatewayip>
tell <my ip>
3com        3com                        ARP            <gateway ip> is
at
<mac address>
me           216.239.41.99           UDP          soutceport: 1059
Destination port 33437
......

traceroute to www.google.akadns.net (216.239.39.147), 30 hops max, 38
byte
packets
 1  * * *
 2  * * *

Below are the relavant rules .... tracert is the ip of the box I am
trying
to traceroute form.
The Ip of that box is an internet routable ip addess.

$IPT -A FORWARD -p TCP -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPT -A FORWARD -p UDP -m state --state ESTABLISHED,RELATED -j ACCEPT

$IPT -A FORWARD -s <tracert box> -o eth1 -j rh-net
$IPT -A FORWARD -d <tracert box -i eth1 -j net-rh

$IPT -A rh-net -s <tracert box> -j ACCEPT
$IPT -A net-rh -p UDP -m state --state ESTABLISHED,RELATED -j ACCEPT


Thank you again,
Peter.

----- Original Message ----- 
From: "Piszcz, Justin Michael" <justin.piszcz@mitretek.org>
To: "netfilter" <netfilter@lists.netfilter.org>
Sent: Wednesday, June 30, 2004 10:47 AM
Subject: RE: traceroute


Can you show me your firewall?
Can you paste the blocks you are seeing?
It does not get past the 1st hop, or?
Post an example traceroute?


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Antony Stone
Sent: Wednesday, June 30, 2004 9:29 AM
To: netfilter
Subject: Re: traceroute

On Wednesday 30 June 2004 2:05 pm, Peter Marshall wrote:

> Hi.  I was wondering what I would need for rules to have traceroute
work
> through my firewall.  (I have a box behind the firewall trying to get
out
> using traceroute).
>
> I have an allow established connections on my forwared chain, and I am
> allowing anything from the source IP of the box in question to leave
... It
> appears that the problem is on the packets comming back in .. but I am
not
> sure what I have to do to fix it ....

Allow RELATED packets as well as ESTABLISHED.

Regards,

Antony.

-- 
"It is easy to be blinded to the essential uselessness of them by the
sense of
achievement you get from getting them to work at all. In other words -
and
this is the rock solid principle on which the whole of the Corporation's

Galaxy-wide success is founded - their fundamental design flaws are
completely hidden by their superficial design flaws."

 - Douglas Noel Adams

                                                     Please reply to the
list;
                                                           please don't
CC me.






