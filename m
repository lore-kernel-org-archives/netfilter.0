From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: accessing a internal port fowarded email server from the
	internal network
Date: 08 Dec 2003 07:39:32 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1070865572.1705.9.camel@kermit>
References: <3FD3D65E.7000405@yahoo.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3FD3D65E.7000405@yahoo.com.au>
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
To: TN <tnuro@yahoo.com.au>
Cc: Netfilter <netfilter@lists.netfilter.org>

Am Mon, 2003-12-08 um 02.39 schrieb TN:

> Currently, laptop users internal to the network need to then become=20
> external when they work external to the LAN, and they have to either=20
> setup 2 different email accounts (one using the internal email server IP=20
> address, and one using the external IP address), or they have to=20
> remember to change their server settings each time they move from=20
> internal to external and vice-versa. Both of these are a pain for them.
> It doesn't work, the email client just times out, as if I'm still=20
> blocking some part of the data stream.
> What am I doing wrong ?
>=20
The client can reach the mailserver alright, but the mailserver tries to
respond directly to the client using the wrong IP-Address.=20
Easiest solution:
Apply both DNAT and SNAT at the same time. Add the following rule:
iptables -t nat -A POSTROUTING -p tcp -m multiport --dport 25,110,143 -d
192.168.10.12 -s  192.168.10.0/24 -j SNAT --to <firewall-ip>

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: VPN mit Linux
Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

