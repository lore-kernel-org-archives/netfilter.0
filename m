From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: prob accessing server in DMZ from LAN with official IP
Date: 18 Jun 2003 07:26:23 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1055913983.7354.6.camel@kermit.spenneberg.de>
References: <5.2.0.9.0.20030617233726.02c98360@mail.sdr.co.at>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <5.2.0.9.0.20030617233726.02c98360@mail.sdr.co.at>
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
To: Mailingliste <liste@sdr.info>, Netfilter <netfilter@lists.netfilter.org>

Am Die, 2003-06-17 um 23.57 schrieb Mailingliste:
Hi Mailingliste (??)

I answer at the beginning:
Do you have a FORWARD rule, which allows the passing of a packet from=20
192.168.0.25 (int FW) to 192.168.0.17 (NS) on the external firewall? If
you filter for the interfaces in the FORWARD chain you have to take into
account, that both -i and -o are $INT_IF.

Cheers,

Ralf
=20
> I have a DMZ between  2 Firewalls. In the DMZ there are Nameserver,=20
> HTTP-Server, etc.
> I have 10 official IP-Addresses. The DMZ has IP-Adresses 192.168.0.0/24.=20
> The LAN has
> the net 192.168.1.0/24. With DNAT I transfer the first official IP to let=
s=20
> say 192.168.0.17
> for the nameserver. the second to 192.168.0.20 to the mailserver, and so=20
> on. This works OK.
> The nameserver is authoritativ for the domain lets say "myname.at". when =
i=20
> make a
> "dig www.myname.at" from outside i get the right answer. But when I type
> "dig www.myname.at" from the LAN at lets say 192.168.1.12 i get the answe=
r=20
> "no servers could be reached".
> with tcpdump on the outer firewall i see the packet with source=20
> 192.168.0.25 (the DMZ-IP of the inner
> firewall) and destination the official IP of the nameserver. But no more=20
> translation from the official IP to the
> DMZ-IP of the nameserver.
> In my rules i have put:
> $IPTABLES -t nat -A PREROUTING -i $INT_IF -p udp --sport 1024:65535 \
>            -d $PUBLIC_DNS1 --dport 53 -j DNAT --to-destination $DMZ_DNS1
>=20
> $IPTABLES -A FORWARD -i $INT_IF -o $INT_IF -p udp --sport 1024:65535 \
>            -d $DMZ_DNS1 --dport 53 -m state --state NEW -j ACCEPT
> but its not working.
>=20
> Has anybody a hint what to do ?
>=20
> Thanks Fritz
>=20
>=20
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                   =20
http://honeynet.spenneberg.org

