From: "Samuel Jean" <sj-netfilter@cookinglinux.org>
Subject: Re: packets going over wrong link: ROUTE target not doing its job 
 !!!!
Date: Thu, 26 Aug 2004 13:25:32 -0400 (EDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <61871.216.239.93.106.1093541132.squirrel@216.239.93.106>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Thu, August 26, 2004 12:11 pm, dravya said:
>
> Hi all,
>
> I patched my kernel with the ROUTE target in order to force all icmp
packets over one
> interface. The following are the rules I added:
>
> iptables -A POSTROUTING -t mangle -p icmp -j LOG --log-prefix "Mangle
POST: "
> iptables -A POSTROUTING -t mangle -p icmp -j ROUTE --oif ppp0
>
> The following is my routing table:
>
> 206.47.201.1 dev ppp0  proto kernel  scope link  src 69.158.206.247
192.168.1.0/24 dev eth0  scope link
> 169.254.0.0/16 dev eth0  scope link
> 127.0.0.0/8 dev lo  scope link
> default equalize
>       nexthop via 206.47.201.1  dev ppp0 weight 1
>       nexthop via 204.101.237.225  dev ppp1 weight 1
>                                                          |
>                                                          |
>                                                          v
> Aug 26 11:56:29 localhost kernel: Mangle POST: IN=3D OUT=3Deth0
> SRC=3D192.168.1.96
> DST=3D192.168.1.229 LEN=3D106 TOS=3D0x00 PREC=3D0xC0 TTL=3D64 ID=3D5591=
9 PROTO=3DICMP
TYPE=3D3 CODE=3D3
> [SRC=3D192.168.1.229 DST=3D192.168.1.96 LEN=3D78 TOS=3D0x00 PREC=3D0x00=
 TTL=3D64
ID=3D25106 PROTO=3DUDP
> SPT=3D64696 DPT=3D137 LEN=3D58 ]
>
> According to the rule, shouldn't this be ppp0 ??? Using ethereal, I
captured on ppp0 and
> the following is what I get:

According to the rule, this shouldn't be ppp0 because you are logging
*before* the effective rule has been hit.

>                                  |
>                                  |
>                                  v
> 2004-08-26 10:31:28.721245 192.168.1.96 -> 192.168.1.229 ICMP
Destination unreachable
> 2004-08-26 10:31:28.721245 192.168.1.96 -> 192.168.1.229 ICMP
Destination unreachable
>
> This means that from ppp0 there was a packet that had a src address of
eth0. Hence, I get
> a change of ip address and I lose that connection.
>
> NOTE: I have tried MASQUERADING and it give me the same problem of
packets going over the
> wrong link.
>

As soon as the packet hits the ROUTE target (without --continue), it is
immediately send over the link. This explains why you are not able to
MASQUERADE it.

My suggestion is to add --continue to your ROUTE rule which will let the
packet continues traversal.

Then, patch ipt_MASQUERADE.c with Patrick's one to avoid the annoying
"MASQUERADE: Route sent us somewhere else."

>
> Dravya
>

HTH,

Samuel Jean
CookingLinux.org




