From: Jason Opperisano <opie@817west.com>
Subject: Re: Port forwarding
Date: Fri, 17 Sep 2004 08:55:01 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095425701.1886.30.camel@wolfpack.ljm.dom>
References: <20040917123138.EC8FE6A5@mail.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040917123138.EC8FE6A5@mail.817west.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset=; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Fri, 2004-09-17 at 08:32, KUCKAERTZ R=C3=A9gis - NVISION wrote:
> Halo,
>=20
> I've set up rules so that packets sent to $MASK_IP:$MASK_PORT are forwa=
rded
> to $REAL_IP:$REAL_PORT with the source address being replaced by $MASK_=
IP:
>=20
> # 1. Changing destination address
> $IPTABLES -t nat -A PREROUTING -p tcp --dest $MASK_IP --dport $MASK_POR=
T -j
> DNAT --to-destination $REAL_IP:$REAL_PORT
>=20
> # 2. Accepting forwarded packets
> $IPTABLES -A FORWARD -p tcp --dest $REAL_IP --dport $REAL_PORT -j ACCEP=
T

if that's your only FORWARD rule, and the POLICY of FORWARD is set to
DROP--you're not allowing reply packets back through the machine (SYN's
will get through, but SYN-ACK's will be blocked).

  iptables -I FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

would help in this situation.

> # 3. IP masquerading after filtering
> $IPTABLES -t nat -A POSTROUTING --dest $REAL_IP --dport $REAL_PORT -j S=
NAT
> --to-source $MASK_IP
>=20
>=20
> When I telnet on $MASK_IP:$MASK_PORT, it's hanging... I tried sniffing =
with
> tcpdump (although I must honestly confess that I don't know if the foll=
owing
> request is good), and here is what I got:

um--where are you telnet-ing from, and where are you tcdump-ing at?

> $TCPDUMP \(dst host $MASK_IP and dst port $MASK_PORT\) or \(src host
> $MASK_IP and src port $MASK_PORT\)

that filter is overly complicated:

  $TCPDUMP host $MASK_IP and port $MASK_PORT

is equivalent to what you're trying to capture.

> tcpdump: listening on eth0
> 14:32:28.568875 x.x.x.x.46569 > $REAL_IP.$REAL_PORT: S
> 2813621631:2813621631(0) win 5840 <mss 1460,sackOK,timestamp 46292274
> 0,nop,wscale 0> (DF) [tos 0x10]=20
> 14:32:31.568875 x.x.x.x.46569 > $REAL_IP.$REAL_PORT: S
> 2813621631:2813621631(0) win 5840 <mss 1460,sackOK,timestamp 46292574
> 0,nop,wscale 0> (DF) [tos 0x10]=20
> 14:32:37.568875 x.x.x.x.46569 > $REAL_IP.$REAL_PORT: S
> 2813621631:2813621631(0) win 5840 <mss 1460,sackOK,timestamp 46293174
> 0,nop,wscale 0> (DF) [tos 0x10]=20

if your BPF specifies $MASK_IP and $MASK_PORT why is your capture
showing $REAL_IP and $REAL_PORT?  those packets shouldn't even match the
filter...

> Nothing seems to get back... any idea?

it *never* hurts to provide us with:

  iptables -vnxL -t nat; iptables -vnxL -t mangle; iptables -vnxL

-j

--=20
Jason Opperisano <opie@817west.com>


