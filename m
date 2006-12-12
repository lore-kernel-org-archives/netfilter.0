From: "ArcosCom Linux User" <linux@arcoscom.com>
Subject: Re: Routing & NAT Problem take #2
Date: Tue, 12 Dec 2006 12:44:21 +0100 (CET)
Message-ID: <46154.195.55.244.106.1165923861.squirrel@www.arcoscom.com>
References: <117F5E7DA31C17478948DC39E01B948B400F58@frost.PlumSoftwareLtd.local>
Reply-To: linux@arcoscom.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <lartc-bounces@mailman.ds9a.nl>
In-Reply-To: <117F5E7DA31C17478948DC39E01B948B400F58@frost.PlumSoftwareLtd.local>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://mailman.ds9a.nl/cgi-bin/mailman/listinfo/lartc>,
	<mailto:lartc-request@mailman.ds9a.nl?subject=unsubscribe>
List-Archive: <http://mailman.ds9a.nl/pipermail/lartc>
List-Post: <mailto:lartc@mailman.ds9a.nl>
List-Help: <mailto:lartc-request@mailman.ds9a.nl?subject=help>
List-Subscribe: <http://mailman.ds9a.nl/cgi-bin/mailman/listinfo/lartc>,
	<mailto:lartc-request@mailman.ds9a.nl?subject=subscribe>
Sender: lartc-bounces@mailman.ds9a.nl
Errors-To: lartc-bounces@mailman.ds9a.nl
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org, LARTC@mailman.ds9a.nl

Try to SNAT the incoming conection too, then your server see only the
200.x.x.x IP for the incoming calls.

You have DNAT for redirections, add a postrouting SNAT. I supose that you
are DNATing in PREROUTING and you will add a rule (only for example) for
SNAT the incoming calls from 200.x.x.x router:

iptables -t nat -A POSTROUTING -d <internal server ip> -j MASQUERADE

Perhaps you'll need to put before that rule some rules to allow internal
traffic to that server without SNAT.

Other solution is to configure the routing fules/tables/filters in your
routers to more specific fules/filters.

Perhaps LARTC is better list than this to allow you to find a good answer
about your routing problem.

Regards

P.D.: My english isn't perfect, sorry.

El Mar, 12 de Diciembre de 2006, 11:29, Matt escribi=F3:
>
>
> Related problem to the earlier one, I'm afraid. Current network layout:
>
>
>                 Internet
>                    |
>          ----100.100.251.217----
>         /      (router)        \                  Internet
>        |                        |                     |
>  100.100.251.220           100.100.251.218        200.200.64.139
>        |                        |                     |
>  192.168.100.x                   \                   /
> (Office Network)                  \                 /
> 				         Linux Multihomed Router
>                                        192.168.0.254
>                                              |
>                                              |
>                                         192.168.0.6
>                                       Internal Server
>
>
> I got the above working on our test bed, where users can get to the
> internal server 192.168.0.6 via either Internet connection. The problem=
 is
> getting from our Office Network to 200.200.64.139:56100
>
> What appears to be happening is this:
>
> 1. Packet is sent from internal router, arrives at 100.100.251.220, is
> routed through 100.100.251.217 to the Internet.
> 2. Packet arrives at 200.200.64.139, DNAT'd to 192.168.0.6.
> 3. Internal Server replies, sends it to it's default gateway
> (192.168.0.254)
> 4. Linux server sees 100.100.251.220 as destination, sends to
> 100.100.251.218 instead of back out of 200.200.64.139. (This is not
> expected as I'm marking incoming connections at the linux router using
> CONNMARK/MARK, and connections go in and out of the correct interface w=
hen
> the destination is outside the 100.100.251.216/29 network)
>
> (Note: I don't know if the returning connections are SNAT'd back to
> 200.200.64.139)
>
> So...
>
> Is there a way around this? i.e. so that the multihoming still works?
>
> It seems that normal routing to the 100.100.251.216/29 network takes
> precedence over my connection marked rule, that would instruct the pack=
et
> to be sent out over the correct interface (and maybe therefore SNAT'd
> correctly too).
>
> Not sure what's going on. Can anyone point me in the correct direction?
>
> Thanks,
>
> Matt
>
>
