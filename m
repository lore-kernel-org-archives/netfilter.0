From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Filter in POSTROUTING
Date: Thu, 11 Sep 2003 14:40:51 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122E2E@alderaan.smgtec.com>
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
To: Claus Regelmann <claus.regelmann@inka.de>, netfilter@lists.netfilter.org, blueflux@koffein.net

It is against style to do anything like that in the NAT table. It is
preferable to do it in the filter table, but if you must be lazy about
it all, please use the mangle table instead, which does have a valid
reason to filter certain traffic at times.

The -I is to make sure no matching rules get called before we check that
we want these packets at all. If you do the ordering yourself, then just
make sure they are all ordered properly.

iptables -t mangle -I POSTROUTING -o ppp0 -p tcp --dport 137:139 -j DROP
iptables -t mangle -I POSTROUTING -o ppp0 -p udp --dport 137:139 -j DROP
iptables -t mangle -I PREROUTING -i ppp0 -p tcp --dport 137:139 -j DROP
iptables -t mangle -I PREROUTING -i ppp0 -p udp --dport 137:139 -j DROP

-----Original Message-----
From: Claus Regelmann [mailto:claus.regelmann@inka.de]=20
Sent: Thursday, September 11, 2003 2:03 PM
To: netfilter@lists.netfilter.org; blueflux@koffein.net
Subject: Filter in POSTROUTING

Hello,

There is a figure Oskar Andreassoons IPTABLES TUTORIAL (V1.1.19, chap.
3.1, pg.19)
where both, the forwarded and the local output, join the postrouting
chain.

Why shoudnt it be possible to filter all outgoing e.g. smb traffic from
a local
network at that place with a command like
>iptables -t nat -A POSTROUTING -o ppp0 -p tcp --dport 137:139 -j DROP
>iptables -t nat -A POSTROUTING -o ppp0 -p udp --dport 137:139 -j DROP
=1A
The same question applies to the PREROUTING chain for input
>iptables -t nat -A PREROUTING -i ppp0 -p tcp --dport 137:139 -j DROP
>iptables -t nat -A PREROUTING -i ppp0 -p udp --dport 137:139 -j DROP

Thanks
Claus


