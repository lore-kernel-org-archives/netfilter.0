From: =?iso-8859-1?Q?KUCKAERTZ_R=E9gis_-_NVISION?= <regis@nvision.lu>
Subject: RE: Port forwarding
Date: Fri, 17 Sep 2004 15:23:48 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <E1C8IiM-0007Pc-00@deer.gmane.org>
References: <1095425701.1886.30.camel@wolfpack.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1095425701.1886.30.camel@wolfpack.ljm.dom>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

> if that's your only FORWARD rule, and the POLICY of FORWARD=20
> is set to DROP--you're not allowing reply packets back=20
> through the machine (SYN's will get through, but SYN-ACK's=20
> will be blocked).
>=20
>   iptables -I FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
>=20
> would help in this situation.

Did it, but nothing changed

> um--where are you telnet-ing from, and where are you tcdump-ing at?

I'm telnet'ing on a different host (otherwise I would have set the
appropriate rule in the OUTPUT chain), but I do the dump on the =
"gateway"

>   $TCPDUMP host $MASK_IP and port $MASK_PORT
>=20
> is equivalent to what you're trying to capture.

Thanks!!

> if your BPF specifies $MASK_IP and $MASK_PORT why is your=20
> capture showing $REAL_IP and $REAL_PORT?  those packets=20
> shouldn't even match the filter...

Maybe that's because I do the dump on the same machine that does the =
DNAT?

I hope what follows will help you spot my mistake!

R=E9gis

$ iptables -vnxL -t nat; iptables -vnxL -t mangle; iptables -vnxL

# nat table
Chain PREROUTING (policy ACCEPT 2439 packets, 148991 bytes)
    pkts      bytes target     prot opt in     out     source
destination        =20
      17       1020 DNAT       tcp  --  *      *       0.0.0.0/0
$MASK_IP         tcp dpt:$MASK_PORT to:$REAL_IP:$REAL_PORT=20

Chain POSTROUTING (policy ACCEPT 741 packets, 45651 bytes)
    pkts      bytes target     prot opt in     out     source
destination        =20
       0          0 SNAT       tcp  --  *      *       0.0.0.0/0
$REAL_IP         tcp dpt:$REAL_PORT to:$MASK_IP=20

Chain OUTPUT (policy ACCEPT 741 packets, 45651 bytes)
    pkts      bytes target     prot opt in     out     source
destination        =20

# mangle table
Chain PREROUTING (policy ACCEPT 1567265 packets, 1105330580 bytes)
    pkts      bytes target     prot opt in     out     source
destination        =20

Chain OUTPUT (policy ACCEPT 1181535 packets, 615648770 bytes)
    pkts      bytes target     prot opt in     out     source
destination        =20

# filter table
Chain INPUT (policy ACCEPT 44233 packets, 9251612 bytes)
    pkts      bytes target     prot opt in     out     source
destination        =20

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
    pkts      bytes target     prot opt in     out     source
destination        =20
       0          0 ACCEPT     all  --  *      *       0.0.0.0/0
0.0.0.0/0          state RELATED,ESTABLISHED=20
       0          0 ACCEPT     tcp  --  *      *       0.0.0.0/0
$REAL_IP           tcp dpt:$REAL_PORT

Chain OUTPUT (policy ACCEPT 41927 packets, 30331854 bytes)
    pkts      bytes target     prot opt in     out     source
destination  =20


