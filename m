From: "Lasse Pettersson" <lasse@humandata.se>
Subject: ip_conntrack on one interface only
Date: Fri, 27 Sep 2002 19:47:42 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <53787D8BD6B72E499041EA10CBD8275F04F0F0@oden.humandata.se>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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

Is it possible to use ip_conntrack for a specific interface only or is
for all if's in the box?

The reason for asking is that I have a net looking like this:

 ISP (and internet)
    |
------------
| Internet |
|  router  |
------------
    |
    |
------------
|   FW     |---- DMZ
------------
    |
    |net1
    |-----------------
    |                |
------------    ------------
| router   |    | router   |   =20
------------    ------------
    |                |
------------    ------------
| router   |    | router   |
------------    ------------
    |                |
    |net 2           |net 3


On net1 the Def. Gateway/router is the FW, the FW is configured to send
ICMP redirects so clients trafik destined for net2 and 3 is told/routed
to the right router

Everything is working OK, exceept that I get a lot of entry's (a few
thousand) in ip_conntrack table that are both established and unreplied.
I didn't think it was a possible combination

I could change the Def.gateway/router settings for computers on net1 to
one of the other routers, but I wan't to know  why I get the established
and unreplied connection in the ip_conntrack table

Could someone explain please.

/Lasse Pettersson




