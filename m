From: Glen Miner <shaggie76@hotmail.com>
Subject: RE: Stateless NAT with iptables
Date: Mon, 12 Jan 2015 13:49:38 -0500
Message-ID: <SNT152-W95408B1CE91E099E55A7ADB8430@phx.gbl>
References: <alpine.LSU.2.11.1501100027160.13352@nerf60.vanv.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.11.1501100027160.13352@nerf60.vanv.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

> Rules are rather static, but your described scenario requires
> rather dynamic changes. There is a much more targeted solution:
>
> Once your application decides it is time to switch, it needs to
> change the conntrack entry for the UDP session. conntrack(8)
> can be used, and there is also a C interface with
> libnetfilter_conntrack.
>
> (With the conntrack command line utility, updating certain parameters=
 is
> not possible because of the program's way of option parsing. This
> limitation may be gone in the C interface. With the command-line
> utility, one could however recreate the entry, if the lack of atomici=
ty
> between the operations is bearable.)
>
> conntrack -D -p udp \
> --src client_addr --dst stun_addr \
> --sport client_port --dport stun_port
> conntrack -I -p udp \
> --src client_addr --dst stun_addr \
> --sport client_port --dport stun_port \
> --reply-src real_server_addr --reply-dst client_addr \
> --reply-src-port real_server_port \
> --reply-dst-port client_port
>
> At least, that is the general idea.. whether it works, or if it needs
> additional commands, I have not tried.

This is indeed an exciting alternative! It might make it possible to av=
oid connection tracking for all other regular traffic through this box =
too so I am quite excited!

However, I've tried to get it to work and must be missing something sub=
tle.

In my test I'm hosting my clients on=A0

10.0.1.7:5000 (Alice)
->
10.0.1.8 (Relay Server) port 5001 relayed to Bob via 5002
->
10.0.1.7:5003 (Bob)

Using iptables (the old method) I create the NAT rules like this

aAddr=3D10.0.1.7
aPort=3D5000
bAddr=3D10.0.1.7
bPort=3D5003
nAddr=3D10.0.1.8
anPort=3D5002
bnPort=3D5001

iptables -t nat -I PREROUTING -p udp -s $aAddr --sport $aPort -d $nAddr=
 --dport $bnPort -j DNAT --to $bAddr:$bPort
iptables -t nat -A POSTROUTING -p udp -d $bAddr --dport $bPort -j SNAT =
--to $nAddr:$anPort
iptables -t nat -I OUTPUT -p udp -s $aAddr --sport $aPort -d $nAddr --d=
port $bnPort -j DNAT --to $bAddr:$bPort

I can see the connection with=A0conntrack -L -p udp=A0

udp =A0 =A0 =A017 24 =A0src=3D10.0.1.7 dst=3D10.0.1.8 sport=3D5000 dpor=
t=3D5001 [UNREPLIED] src=3D10.0.1.7 dst=3D10.0.1.8 sport=3D5003 dport=3D=
5002 =A0 =A0 =A0 =A0 =A0 mark=3D0 use=3D1

And Bob gets the packets and everything works.

I tried repeating this experiment (without the complexity of the interm=
ediate handshake, just by creating the connection manually:

I cleared the nat rules from previous test with:

iptables -t nat -F

I flushed all udp tracked connections:

conntrack -D -p udp

Then I created the relay connection:

conntrack -I -p udp \
--src $aAddr --sport $aPort \
--dst $nAddr --dport $bnPort \
--reply-src $bAddr --reply-port-src $bPort \
--reply-dst $nAddr --reply-port-dst $anPort \
--timeout 600

But my packets all bounce with ICMP=A0Port Unreachable.=A0

I compared the conntrack -L -p udp output and it looked essentially the=
 same.

I also read the man page which suggested using this instead of --src/--=
dest

--orig-src $aAddr --orig-port-src $aPort \
--orig-dst $nAddr --orig-port-dst $bnPort \

But the conntrack entry looks the same.

It feels like some aspect of the firewall is not being informed of this=
 state.=A0

I checked iptables -L, iptables -L -t nat, and -t raw and everything is=
 empty.=A0

Can you think of something I've missed?

-g

 		 	   		  