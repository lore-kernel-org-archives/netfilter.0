From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: port forwarding
Date: Sun, 27 Apr 2003 11:37:43 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000a01c30ca0$a6fc2930$0401000a@sterenborg.info>
References: <548356826.20030427140916@intal.uz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <548356826.20030427140916@intal.uz>
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
To: netfilter@lists.netfilter.org

> I want to forward all the packets to port 80 and 443 to 16721 and
> using the following rules:
>=20
> # 80->16721->80
> ${IPTABLES} -t nat -A PREROUTING -s 0.0.0.0/0 -d 192.168.0.1=20
> -p tcp --dport 80 -j DNAT \
> --to-destination 192.168.0.1:16721
> ${IPTABLES} -t nat -A POSTROUTING -s 192.168.0.1 -d 0/0 -p=20
> tcp --sport 16721 -j SNAT \
>  --to-source 192.168.0.1:80
>=20
> # 443->16721->443
> ${IPTABLES} -t nat -A PREROUTING -s 0.0.0.0/0 -d 192.168.0.1=20
> -p tcp --dport 443 -j DNAT \
> --to-destination 192.168.0.1:16721
> ${IPTABLES} -t nat -A POSTROUTING -s 192.168.0.1 -d 0/0 -p=20
> tcp --sport 16721 -j SNAT \
>  --to-source 192.168.0.1:443
>=20
> I'm just wondering - won't the source address of packets to 443 be
> changed to 192.168.0.1:80 instead of 192.168.0.1:443 when they're
> replied to the client?

NAT will handle that, but I'm not sure if this setup is going to work :
you are forwarding both http and https to the same port.

> I don't know what type of connection tracking to use. Your help is
> appreciated.

With conntrack, you don't need the postrouting rules.

iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i <if_inet> -d 192.168.0.1 -p tcp --dport 80 \
 -j ACCEPT
iptables -A FORWARD -i <if_inet> -d 192.168.0.1 -p tcp --dport 443 \
 -j ACCEPT

iptables -t nat -A PREROUTING -i <if_inet> -p tcp --dport 80 \
 -j DNAT --to-destination 192.168.0.1:16721
iptables -t nat -A PREROUTING -i <if_inet> -p tcp --dport 443 \
 -j DNAT --to-destination 192.168.0.1:16721

If I were you I'd make the webserver listen on 16722 (or whatever) for
https and forward port 443 to 16722.


Gr,
Rob


