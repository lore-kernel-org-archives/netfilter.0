From: "Bertrand TACHAGO" <btachago@creolink.net>
Subject: Re: Iptables and Zebra
Date: Tue, 16 Dec 2003 12:58:29 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <007501c3c3cb$ed17c040$220aa8c0@BERTRAND>
References: <006301c3c3b7$e02ef0b0$220aa8c0@BERTRAND> <1071572792.1688.12.camel@kermit>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Ralf Spenneberg <lists@spenneberg.org>
Cc: netfilter@lists.netfilter.org


Bertrand TACHAGO
Computer specialist / Network administrator
Cellular: (237) 975 55 31
----- Original Message -----=20
From: "Ralf Spenneberg" <lists@spenneberg.org>
To: "Bertrand TACHAGO" <btachago@creolink.net>
Cc: "Netfilter" <netfilter@lists.netfilter.org>
Sent: Tuesday, December 16, 2003 12:06 PM
Subject: Re: Iptables and Zebra


Am Die, 2003-12-16 um 10.34 schrieb Bertrand TACHAGO:
> Hi to all!
> I'm trying to setup a zebra router on a RH9 machine but right I'm
> blocked because there's a firewall (iptables) problem. I had entered a
> POSTROUTING rule (iptables -t nat -A POSTROUTING -o eth0 -j
> MASQUERADE) but the packets are not routed to the external interface.
> Can somebody help me solve this problem (use zebra routing protocol to
> route packets from my network to the Internet)?
Why are you trying to setup zebra?

If you just want the Linux box to operate as a simple router between two
networks, remove zebra, activate forwarding and masquerading and you are
done.
Forwarding:
sysctl -w net.ipv4.ip_forward=3D1

The needed static routes are usually set automatically as soon as the
interfaces are initialized.
>
Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: VPN mit Linux
Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto      http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

I'm trying to setup zebra because I have 3 subnets with 3 linux boxes
configured as router with zebra and ospfd. Maybe if I activate Masquerading,
it would work.
Cheers,



