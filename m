From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: why does this packet not match these rules?
Date: Mon, 30 Aug 2004 14:50:12 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC9051301@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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

> Hi,
>
> I have these rules in my iptables script (iptables -L -v -n):
>
> Chain OUTPUT (policy DROP 0 packets, 0 bytes)
>  pkts bytes target     prot opt in     out     source
> destination
>
> 16955 5070K ACCEPT     all  --  *      lo      0.0.0.0/0            =
0.0.0.0/0
>
> 35895  278M out_lan    all  --  *      eth0    0.0.0.0/0            =
0.0.0.0/0
>
>   16M 3830M out_internet  all  --  *      ppp0    x.x.x.x       =
0.0.0.0/0
>
>     0     0 ACCEPT     all  --  *      *       0.0.0.0/0           =
0.0.0.0/0
>      state RELATED
>
> 26649 1534K LOG        all  --  *      *       0.0.0.0/0            =
0.0.0.0/0
> 0 level 4 prefix `OUT-unknown:'
>
>  28209 1621K DROP       all  --  *      *       0.0.0.0/0            =
0.0.0.0/0
>
>
> (where x.x.x.x is my ip), and yet these packets are being logged:
>
> ... OUT-unknown:IN=3D OUT=3Dppp0 SRC=3Dx.x.x.x DST=3Dy.y.y.y LEN=3D60 =
TOS=3D0x00 PREC=3D0x00
> TTL=3D64 ID=3D45650 DF PROTO=3DTCP SPT=3D43257 DPT=3D4662 =
WINDOW=3D4383 RES=3D0x00 SYN
> URGP=3D0
>
> surely this should match rule 3 (src=3Dx.x.x.x, out=3Dppp0) and be =
handled by
> out_internet?

it probably does.  the question is:  does the packet actually match =
anything in "out_internet?"  if it doesn't, the packet will continue on =
down the list until it hits your log rule.

show us:  iptables -vnL out_internet

-j

