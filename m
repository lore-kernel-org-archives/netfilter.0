From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: PREROUTING problem
Date: Mon, 27 Aug 2007 16:57:33 +0200
Message-ID: <46D2E65D.4080001@plouf.fr.eu.org>
References: <560582340708270726m77e3467eo46b6ac91e034605b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <560582340708270726m77e3467eo46b6ac91e034605b@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

Diego K. a =E9crit :
> Hello, I have the following problem
>=20
> LAN ---------------------------------Etch Linux
> Firewall-----------------------------------------------------Internet
> 10.1.x.x/16    |             eth1:10.1.1.1             eth0:200.3.5.100
>                         |
>                         |
>                         |
> Server1: 10.1.1.50

[Beware of line wrapping]

> When I get a conection from the internet to 200.3.5.100:80, the ip
> forward works OK to server1, but when I try to connect to 200.3.5.100
> from the LAN its does not work, I know that i can connect to 10.1.1.50
> but I need from both IPs, private and public from the LAN

Well known routing problem. Replies from the server go directly back to=20
the client and arrive there with the wrong source address.

> I have the following config
>=20
> iptables -t nat -A PREROUTING -s 0/0 -p tcp -d 200.3.5.100 --dport 80
> -j DNAT --to 10.1.1.50:80
> iptables -A FORWARD -p tcp -d 10.1.1.50 --dport 80 -j ACCEPT

You must SNAT the connections coming from the LAN so the reply packets=20
go back to the firewall which puts back the correct source address.=20
Adding the following rule should do it :

iptables -t nat -A POSTROUTING -o eth1 -s 10.1.0.0/16 -d 10.1.1.50 \
   -p tcp --dport 80 -j SNAT --to 10.1.1.1

Note that this will prevent the server from seeing the real source=20
address when a connection comes from the LAN using the public address.

Also make sure traffic in FORWARD from eth1 to eth1 is accepted.

