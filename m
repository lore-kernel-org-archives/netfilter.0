From: "k bah" <kbah@linuxmail.org>
Subject: [solved?] Re: UDP packets are not being forwarded to pc on the local
 net.
Date: Fri, 18 May 2007 04:29:23 +0800
Message-ID: <20070517202923.397C32477C@ws5-3.us4.outblaze.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

> ----- Original Message -----
> From: jwlargent <jwlargent@vlsmaps.com>
> To: "k bah" <kbah@linuxmail.org>
> Subject: Re: UDP packets are not being forwarded to pc on the local net.
> Date: Thu, 17 May 2007 09:48:11 -0500
>
> I would suggest you start with just a basic NAT setup and then once
> that is working add the additional rules you need.
>=20
> Minimal NAT setup
> iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE


 The initial setup was like this.
 Everything was allowed, since it didn't work I started to explicitly allow=
 some traffic.=20


>=20
> iptables -A INPUT -i eth0 -m state --state NEW,INVALID -j DROP
> iptables -A FORWARD -i eth0 -m state --state NEW,INVALID -j DROP
>=20
> and don't forget to turn on forwarding in the kernel
> echo 1 > /proc/sys/net/ipv4/ip_forward

=20
 Ok, I read some more and this is my setup a little more clear:

(eth0 - router netcard to internet; eth1 router netcard to internal net)
----------
*raw
:PREROUTING ACCEPT
:OUTPUT ACCEPT
*mangle
:PREROUTING ACCEPT
:INPUT ACCEPT
:FORWARD ACCEPT
:OUTPUT ACCEPT
:POSTROUTING ACCEPT
*filter
:INPUT ACCEPT
:FORWARD ACCEPT
:OUTPUT ACCEPT
-A INPUT -i eth1 -p udp -m udp -j ACCEPT  # *so the p2p client can send udp=
 out? *
-A INPUT -i eth0 -p icmp -j ACCEPT
-A INPUT -p tcp -m state --state RELATED -j ACCEPT
-A INPUT -p udp -j ACCEPT
-A INPUT -i eth0 -p tcp -m tcp --dport 41001 -m state --state NEW,RELATED,E=
STABLISHED -j ACCEPT
-A INPUT -i eth0 -p udp -m udp --dport 41002 -m state --state NEW,RELATED,E=
STABLISHED -j ACCEPT
-A INPUT -i eth0 -p udp -m udp --dport 41002 -j ACCEPT
-A INPUT -i eth0 -p udp -m udp --dport 41004 -j ACCEPT
-A FORWARD -p udp -m udp --sport 41002 -j LOG --log-prefix "H015 -t fwd udp=
41002 sport"
-A FORWARD -p udp -m udp --dport 41002 -j LOG --log-prefix "H015 -t fwd udp=
41002 dport"
-A FORWARD -p udp -m udp --sport 41004 -j LOG --log-prefix "H015 -t fwd udp=
41004 sport"
-A FORWARD -p udp -m udp --dport 41004 -j LOG --log-prefix "H015 -t fwd udp=
41004 dport"
-A FORWARD -p tcp -m tcp --dport 41001 -j LOG --log-prefix "H015 -t fwd tcp=
41001 dport"
-A FORWARD -p tcp -m tcp --sport 41001 -j LOG --log-prefix "H015 -t fwd tcp=
41001 sport"
-A OUTPUT -p udp -m udp --sport 41002 -j LOG --log-prefix " H015 -t out udp=
41002 sport"
-A OUTPUT -p udp -m udp --dport 41002 -j LOG --log-prefix " H015 -t out udp=
41002 dport"
-A OUTPUT -p udp -m udp --sport 41004 -j LOG --log-prefix " H015 -t out udp=
41004 sport"
-A OUTPUT -p udp -m udp --dport 41004 -j LOG --log-prefix " H015 -t out udp=
41004 dport"
-A OUTPUT -o eth0 -p udp -m udp -j ACCEPT
-A OUTPUT -o eth1 -p udp -m udp -j ACCEPT
*nat
:PREROUTING ACCEPT
:POSTROUTING ACCEPT
:OUTPUT ACCEPT
-A PREROUTING -i eth0 -p tcp -m tcp --dport 41001 -j LOG --log-prefix "H015=
 -t:nat:prerouting 01dpt"
-A PREROUTING -i eth0 -p udp -m udp --dport 41002 -j LOG --log-prefix "H015=
 -t:nat:prerouting 02dpt"
-A PREROUTING -i eth0 -p udp -m udp --dport 41004 -j LOG --log-prefix "H015=
 -t:nat:prerouting 04dpt"
-A PREROUTING -i eth0 -p tcp -m tcp --dport 41001 -j DNAT --to-destination =
10.1.1.15:41001
-A PREROUTING -i eth0 -p udp -m udp --dport 41002 -j DNAT --to-destination =
10.1.1.15:41002
-A PREROUTING -i eth0 -p udp -m udp --dport 41004 -j DNAT --to-destination =
10.1.1.15:41004
-A POSTROUTING -s 10.1.1.0/255.255.255.0 -o eth0 -j MASQUERADE
----------

  I sent packets from a shell outside my network on the internet (to my rou=
ter ip address on the internet, 201.x, not 10.1.1.1, of course):


 ----- tcp port 41001 -----

 PACKET GOT TO MY NETWORK ROUTER
H015 -t:nat:prerouting 01 dpt IN=3Deth0 OUT=3D MAC=3Dok:ok:ok:ok:ok:ok:ok:o=
k:ok:ok:ok:ok:ok:=3D) SRC=3D87.227.31.20 DST=3D201.OK.OK.=3D) LEN=3D60 TOS=
=3D0x00 PREC=3D0x20 TTL=3D42 ID=3D20327 DF PROTO=3DTCP SPT=3D38631 DPT=3D41=
001 WINDOW=3D5840 RES=3D0x00 SYN URGP=3D0

 PACKET INSIDE MY NETWORK BEING FORWARDED TO MACHINE INSIDE THE NET
H015 -t fwd tcp41001 dport IN=3Deth0 OUT=3Deth1 SRC=3D87.227.31.20 DST=3D10=
.1.1.15 LEN=3D60 TOS=3D0x00 PREC=3D0x20 TTL=3D41 ID=3D20327 DF PROTO=3DTCP =
SPT=3D38631 DPT=3D41001 WINDOW=3D5840 RES=3D0x00 SYN URGP=3D0

 MACHINE INSIDE MY NETWORK SENDING REPLY TO INTERNET MACHINE WHERE THE PACK=
ET ORIGINATED
H015 -t fwd tcp41001 sport IN=3Deth1 OUT=3Deth0 SRC=3D10.1.1.15 DST=3D87.22=
7.31.20 LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D127 ID=3D20293 PROTO=3DTCP SP=
T=3D41001 DPT=3D38631 WINDOW=3D0 RES=3D0x00 ACK RST URGP=3D0

 ----- tcp port 41001 -----

 ----- udp port 41002 -----

 PACKET GOT TO NETWORK ROUTER
H015 -t:nat:prerouting 02 dpt IN=3Deth0 OUT=3D MAC=3Dok:ok:ok:ok:ok:ok:ok:o=
k:ok:ok:ok:ok:ok:=3D) SRC=3D87.227.31.20 DST=3D201.OK.OK.=3D) LEN=3D54 TOS=
=3D0x00 PREC=3D0x20 TTL=3D42 ID=3D55587 DF PROTO=3DUDP SPT=3D53050 DPT=3D41=
002 LEN=3D34

 PACKET INSIDE MY NETWORK BEING FORWARDED TO MACHINE INSIDE THE NET
H015 -t fwd udp41002 dport IN=3Deth0 OUT=3Deth1 SRC=3D87.227.31.20 DST=3D10=
.1.1.15 LEN=3D54 TOS=3D0x00 PREC=3D0x20 TTL=3D41 ID=3D55587 DF PROTO=3DUDP =
SPT=3D53050 DPT=3D41002 LEN=3D34

 ----- udp port 41002 -----

 ----- udp port 41004 -----

 PACKET GOT TO NETWORK ROUTER
H015 -t:nat:prerouting 04 dpt IN=3Deth0 OUT=3D MAC=3Dok:ok:ok:ok:ok:ok:ok:o=
k:ok:ok:ok:ok:ok:=3D) SRC=3D87.227.31.20 DST=3D201.OK.OK.=3D) LEN=3D54 TOS=
=3D0x00 PREC=3D0x20 TTL=3D42 ID=3D61379 DF PROTO=3DUDP SPT=3D53050 DPT=3D41=
004 LEN=3D34

 PACKET INSIDE MY NETWORK BEING FORWARDED TO MACHINE INSIDE THE NET
H015 -t fwd udp41004 dport IN=3Deth0 OUT=3Deth1 SRC=3D87.227.31.20 DST=3D10=
.1.1.15 LEN=3D54 TOS=3D0x00 PREC=3D0x20 TTL=3D41 ID=3D61379 DF PROTO=3DUDP =
SPT=3D53050 DPT=3D41004 LEN=3D34

 ----- udp port 41004 -----

=20=20
  now check item 3.2 from http://www.stearns.org/iptables/netfilter-hacking=
-HOWTO.txt if it shows weird here (the ascii illustration showing packet fl=
ow):

----ascii----

          --->PRE------>[ROUTE]--->FWD---------->POST------>
              Conntrack    |       Filter   ^    NAT (Src)
              Mangle       |                |    Conntrack
              NAT (Dst)    |             [ROUTE]
              (QDisc)      v                |
                           IN Filter       OUT Conntrack
                           |  Conntrack     ^  Mangle
                           |                |  NAT (Dst)
                           v                |  Filter

----ascii----

 I disabled WinXP firewall on the machine inside the network, and checked i=
t again after reboot.

 Now I think the problem is not with packet forwarding, I think it's with t=
he p2p client OR
  maybe the p2p client is not able to send out stuff?


 Anyone agrees with me?


 thanks for your time

=3D


--=20
Powered by Outblaze

