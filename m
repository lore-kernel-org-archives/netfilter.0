From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: simple questions to finally understand netfilter
Date: 27 Nov 2003 17:04:06 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1069949045.28653.85.camel@kermit>
References: <1069947718.9126.39.camel@webmail.aeropostal.com.ve>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1069947718.9126.39.camel@webmail.aeropostal.com.ve>
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
To: Juan Hernandez <alucard@kanux.com>
Cc: Lista de netfilter <netfilter@lists.netfilter.org>

Am Don, 2003-11-27 um 16.41 schrieb Juan Hernandez:

> 1) This rule tells netfilter to drop any packet forwarding I guess
> iptables -P FORWARD DROP
This is a default rule. All packets not accepted or dropped by other
rules will be dropped by this one.

>=20
> 2) This one only accepts related and stablished packets
> iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
correct.

> 3) This one forwards everything from the mailserver to the outside i
> guess
> iptables -A FORWARD -d 192.168.0.2 -p tcp --dport 25 -j ACCEPT
No. This allows all packets destined for 192.168.0.2:25 through.

> 4) and this rule redirects everything in port 25 to the mailserver
> iptables -t nat -A PREROUTING -d 192.168.0.1 -p tcp --dport 25 -j DNAT
> --to-destination 192.168.0.2:25
This rule redirects all packets targeted at 192.168.0.1:25 to 192.168.0.2:2=
5.=20

> Now these are the questions I have about netfilter
>=20
> 1) What does the first rules do exactly??=20
>=20
> 2) How come if I add this rule to redirect everything from port 666 to
> the mailserver's ssh port it doesnt work??=20
>=20
> iptables -t nat -A PREROUTING -d 192.168.0.1 -p tcp --dport 666 -j DNAT
> --to-destination 192.168.0.2:22=20
You need a rule which will allow these packets through the FORWARD
chain:
iptables -A FORWARD -d 192.168.0.2 -p tcp --dport 22 -j ACCEPT

> 3) How do I use DROP with a range of port in oder to close everyhing
> else to the outside? or is there other way to do it??
Everything else is closed by the Default rule (1)

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: VPN mit Linux
Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

