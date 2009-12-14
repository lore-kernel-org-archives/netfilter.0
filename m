From: "J. Bakshi" <joydeep@infoservices.in>
Subject: ip_forwarding in a more restricted way
Date: Mon, 14 Dec 2009 12:16:08 +0530
Message-ID: <4B25DF30.5010607@infoservices.in>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Dear list,

I have ip_forwarding running well on my gateway since long. The
configuration is simple to allow a linux box to work as a gateway.

#### my old ip_forwarding rule ########

echo 1 >  /proc/sys/net/ipv4/ip_forward

iptables -A FORWARD -i ${WAN_IFACE} -o ${LAN_IFACE} -s 192.168.1.0/24 -=
m
conntrack --ctstate NEW -j ACCEPT
iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEP=
T
iptables -A POSTROUTING -t nat -j MASQUERADE
##############

With a 2.6.X series of kernel and 2 NIC cards the box is working as a
gateway.  But now I like to add some more fine tuned control.  I have
created a routing table at  /etc/iproute2/rt_tables and I want to
*force* the traffic to pass within ${WAN_IFACE} and ${LAN_IFACE} or to
go through the table I have created for routing.
It might me

1] ${WAN_IFACE}  <--- ip_forwarding always between these two interfaces
---> ${LAN_IFACE}

                                   OR

2]  ${WAN_IFACE} <--> [routing table]  <--- route  always via these
table from these two interfaces  ---> ${LAN_IFACE}


Could any one kindly suggest any possible modification of the above rul=
e ?

One possible solution can be ( collected from net )

` ` `
# iptables --table ${tablename} --append POSTROUTING --out-interface
${WAN_IFACE} -j MASQUERADE
# iptables --append FORWARD --in-interface ${LAN_IFACE} -j ACCEPT
` ` `

But I have no idea if it can do the job in right way. Any more robust
configuration ?

Thanks

--=20
=E0=A6=9C=E0=A7=9F=E0=A6=A6=E0=A7=80=E0=A6=AA =E0=A6=AC=E0=A6=95=E0=A7=8D=
=E0=A6=B8=E0=A7=80

