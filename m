From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: Use case NetFilter
Date: Tue, 25 Apr 2006 11:42:21 +0200 (CEST)
Message-ID: <64777.193.173.147.3.1145958141.squirrel@webmail.sterenborg.info>
References: <64B84B6DA4DD894EB9D0ABA9F1C1F14EF7FEFF@PUEXCBJ0.nanterre.francetelecom.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <64B84B6DA4DD894EB9D0ABA9F1C1F14EF7FEFF@PUEXCBJ0.nanterre.franceteleco
	m.fr>
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

On Tue, April 25, 2006 10:45, THIEBAUD Christophe ROSI/DPS wrote:
> Hi,
>
> I have a question about NetFilter using.
>
> Here a part of my configuration :
> ...
> iptables -A INPUT -m state --state NEW -j LOG --log-prefix "NEW SSH : "

Your logging rule is wrong. This is not NEW SSH. This is NEW SSH:

$ipt -A INPUT -m state --state NEW -p tcp --dport 22 \
  -j LOG --log-prefix "NEW SSH : "

> iptables -A INPUT -m state --state ESTABLISHED -j LOG --log-prefix
> "ESTABLISHED SSH : "

This rule is not ESTABLISHED SSH. Add "-p tcp --dport 22" to the rule.

> iptables -A INPUT -d $IPADDR_ADMIN -p tcp --dport 22 -m state --state
> NEW,ESTABLISHED -j ACCEPT

What is $IPADDR_ADMIN ?

> iptables -A OUTPUT -s $IPADDR_ADMIN -p tcp --sport
> 22 -m state --state ESTABLISHED -j ACCEPT ...

What is $IPADDR_ADMIN ?

IF $IPADDR_ADMIN is the IP address of your admin workstation, you have
reversed the -d and -s parameters in both rules above.

> When I send this kind of packet (avec Ftester tools) :
>
> 1 - 10.170.225.0:1025 > 10.64.19.212:22 AP TCP 0
>
> I have this trace :
>
> Apr 25 09:46:39 unzs148 kernel: NEW SSH input : IN=3Deth0 OUT=3D
> MAC=3D00:0d:60:9a:30:9a:00:0d:60:d5:1a:f0:08:00 SRC=3D10.170.225.0
> DST=3D10.64.19.212 LEN=3D55 TOS=3D0x00 PREC=3D0x00 TTL=3D200 ID=3D1 DF =
PROTO=3DTCP SPT=3D1025
> DPT=3D22 WINDOW=3D65535 RES=3D0x00 ACK PSH URGP=3D0
>
> And the packet have passed the FW !!!
>
> The FW see the packet as a "new connection" (state NEW), and I have nev=
er
> send packek with SYN flag !!!

Your logging will give a false result because it logs MUCH more than (I t=
hink)
you want to.
And, again, if my presumption is correct, I think you have reversed -d an=
d -s
in the INPUT and OUTPUT chain. In the INPUT chain, you want to accept wit=
h
*source ip* (-s) and in the OUTPUT chain, you want to accept with *destin=
ation
ip* (-d).


Gr,
Rob



