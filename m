From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: iptables help..
Date: 10 Oct 2003 07:29:56 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1065763796.1650.21.camel@kermit>
References: <200310101245.55993.jerome@gmanmi.tv>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200310101245.55993.jerome@gmanmi.tv>
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
To: jerome@gmanmi.tv
Cc: Netfilter <netfilter@lists.netfilter.org>

Am Fre, 2003-10-10 um 06.45 schrieb JM:
> i want to access the http server on "remote server x" from LAN.. without =
going through the internet..
> so what i did is setup DNAT on "remote server A" but somehow its not work=
ing..=20
>=20
> this is my ruleset..
>=20
> NAT
> -A PREROUTING -d serverA_IP -p tcp -m tcp --sport 1024:65535 --dport 81 -=
j DNAT --to-destination serverx_IP:80
>=20
> FILTER
> -A INPUT -p tcp -s LAN_IP/24 --sport 1024:65535 -d serverA_IP --dport 81 =
-j LOG --log-prefix "INPUT packets:"
> -A FORWARD -d  serverx_IP -p tcp -m tcp --sport 1024:65535 --dport 80 -m =
state --state NEW -j ACCEPT
> -A FORWARD -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
> -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
> -A FORWARD -p tcp -j LOG --log-prefix "FORWARD packets:"
>=20
So how does it not work? What error messages do you see? Did you enable
routing on server_A? You probably want an SNAT rule too, because
otherwise server_X will try to answer directly to the LAN. That might
create problems doing conntrack on server_A and your Firewall protecting
the LAN.

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

