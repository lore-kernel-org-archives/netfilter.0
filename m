From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: drop at FWD chain, why ?
Date: Wed, 4 Dec 2002 11:46:24 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212041146.24723.netfilter@newkirk.us>
References: <20021204093413.98006.qmail@web14506.mail.yahoo.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021204093413.98006.qmail@web14506.mail.yahoo.com>
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
To: "james.Q.L" <shijialeeee@yahoo.ca>, netfilter@lists.netfilter.org

On Wednesday 04 December 2002 04:34 am, james.Q.L wrote:
> i can't figure out why the following rules make the reply traffic drop.=
 can
> anyone help?
>
> it's internal server on 192.168.0.3:80 being forwarded from my external=
 ip
> at port 8888.

Both IP's are 192.168.x.x.  IN=3DOUT=3Deth0.  You NAT if _addressed_ to e=
xternal=20
IP, but if it is coming from the LAN then it is IN interface INTIF.  Your=
=20
FORWARD rules don't address this.

> FWD dropIN=3Deth0 OUT=3Deth0 SRC=3D192.168.0.3 DST=3D192.168.0.12 LEN=3D=
64 TOS=3D0x00
> PREC=3D0x00 TTL=3D127 ID=3D22473 DF PROTO=3DTCP SPT=3D80 DPT=3D1026 WIN=
DOW=3D17520
> RES=3D0x00 ACK SYN URGP=3D0
>
> #grep 192.168.0.12 /proc/net/ip_conntrack # this ip is the internal mac=
hine
> make the request. tcp      6 59 SYN_RECV src=3D192.168.0.12 dst=3DmyExt=
ernIP
> sport=3D1109 dport=3D8888 src=3D192.168.0.3 dst=3D192.168.0.1 sport=3D8=
0 dport=3D1109
> use=3D1
>
> $IPTABLES -A FORWARD -i $EXTIF -o $INTIF -m state --state
> ESTABLISHED,RELATED \ -j ACCEPT
> $IPTABLES -A FORWARD -d 192.168.0.3 --dport 80 -j ACCEPT
> $IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT
> $IPTABLES -A FORWARD -j LOG --log-prefix "FWD drop"

I see a forward rule to allow destination 192.168.0.3 port 80, allow in i=
ntif=20
out extif, and allow EST/REL in extif out intif.  The Dropped packet abov=
e,=20
however, was in intif out intif, which is NOT covered by a forward rule. =
 You=20
need either a rule for in INTIF out INTIF, or a rule that ignores -o,=20
(actually just remove the -o $ETXIF from the third rule above) or allows=20
-s192.168.0.3 dport 80. =20

> iptables -t nat -A PREROUTING -p tcp  -d externalIP --dport 8888 \
> =09-j DNAT --to-destination 192.168.0.3:80
> $IPTABLES -t nat -A POSTROUTING -p tcp -s 192.168.0.0/24 -d 192.168.0.3
> --dport 80 -j SNAT --to-source 192.168.0.1

j


