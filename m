From: "Urban Spielmann" <spielmann@it-insourcing.ch>
Subject: AW: Multi PPTP clients behind iptables firewall
Date: Tue, 27 May 2003 10:10:12 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <A9B668705BE3754790A3C32C7682149463C8@pluto.insourcing.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
Cc: Netfilter <netfilter@lists.netfilter.org>

Now it works, but I had to do not only
modprobe ip_nat_pptp
also
modprobe ip_nat_proto_gre

I do not know why. But im lucky it works.

Regards,
Urban

-----Urspr=FCngliche Nachricht-----
Von: Ralf Spenneberg [mailto:lists@spenneberg.org]=20
Gesendet: Dienstag, 20. Mai 2003 08:16
An: Urban Spielmann
Cc: Netfilter
Betreff: Re: Multi PPTP clients behind iptables firewall


Am Sam, 2003-05-17 um 05.41 schrieb Urban Spielmann:
> Hi
> =20
> I have Windows-XP-Clients behind a linux firewall ( kernal 2.4.20). I=20
> do VPN over PPTP to a VPN-Server on the internet.
> =20
> I configured the iptables and it works fine for ONE client.
> =20
> But a second client at the same time does not :-(
> =20
> Do I have to use any patches for kernal 2.4.20?
Yes.
You have to use the nat_pptp module. Depending on your kernel you have =
to patch and recompile your kernel. You will find the patch on=20
http://www.netfilter.org.
Then do a=20
modprobe ip_nat_pptp
And it should work.

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                   =20
http://honeynet.spenneberg.org


