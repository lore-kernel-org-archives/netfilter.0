From: mailinglists@belfin.ch
Subject: RE: Portscan??
Date: Tue, 12 Nov 2002 13:17:06 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <31347F3CE518D6118ACB00A0246AD0560B245E@mx.snizek.ch>
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
To: "'romaniuc@edumed.org.br'" <romaniuc@edumed.org.br>, netfilter@lists.netfilter.org

Hi

in order to detect portscans you can use iptables but it would be a =
nicer
solution to use an IDS like snort. See www.snort.org.

To answer your question:

iptables -t nat -A PREROUTING -f -d 0/0 -j LOG --log-prefix FRAGMENT
iptables -t nat -A PREROUTING -f -d 0/0 -j DROP
iptables -t nat -A PREROUTING -p 6 --tcp-flags ALL NONE -j LOG =
--log-prefix
NULL-SCAN
iptables -t nat -A PREROUTING -p 6 --tcp-flags ALL NONE -j DROP
iptables -t nat -A PREROUTING -p 6 --tcp-flags ALL ALL -j LOG =
--log-prefix
XMAS-SCAN
iptables -t nat -A PREROUTING -p 6 --tcp-flags ALL ALL -j DROP
iptables -t nat -A PREROUTING -p 6 --tcp-flags ALL SYN,FIN -j LOG
--log-prefix SYNFIN-SCAN
iptables -t nat -A PREROUTING -p 6 --tcp-flags ALL SYN,FIN -j DROP
iptables -t nat -A PREROUTING -p 6 --tcp-flags ALL URG,PSH,FIN -j LOG
--log-prefix NMAP-XMAS-SCAN
iptables -t nat -A PREROUTING -p 6 --tcp-flags ALL URG,PSH,FIN -j DROP
iptables -t nat -A PREROUTING -p 6 --tcp-flags ALL FIN -j LOG =
--log-prefix
FIN-SCAN
iptables -t nat -A PREROUTING -p 6 --tcp-flags ALL FIN -j DROP
iptables -t nat -A PREROUTING -p 6 --tcp-flags ALL URG,PSH,SYN,FIN -j =
LOG
--log-prefix NMAP-ID
iptables -t nat -A PREROUTING -p 6 --tcp-flags ALL URG,PSH,SYN,FIN -j =
DROP
iptables -t nat -A PREROUTING -p 6 --tcp-flags SYN,RST SYN,RST -j LOG
--log-prefix SYN-RST
iptables -t nat -A PREROUTING -p 6 --tcp-flags SYN,RST SYN,RST -j DROP

iptables -N syn-flood
iptables -t nat -A PREROUTING -p 6 --syn -i $waneth -j syn-flood
iptables -t nat -A syn-flood -m limit --limit 1/s --limit-burst 4 -i =
$waneth
-j RETURN
iptables -t nat -A syn-flood -j LOG --log-level warn --log-prefix "***
SYN-FLOOD *** "
iptables -t nat -A syn-flood -i $waneth -j DROP

these are mine and they work nice. But I'm sure there are better ones =
in the
internet.

you also can go to www.google.com and search for string 'iptables syn =
scan'
or something like that.=20

HTH
Philipp


> -----Original Message-----
> From: romaniuc@edumed.org.br [mailto:romaniuc@edumed.org.br]
> Sent: Tuesday, November 12, 2002 12:58 PM
> To: netfilter@lists.netfilter.org
> Subject: Portscan??
>=20
>=20
>=20
> Hi all,
>=20
> 	I=B4m trying to detect and block portscan.... and Im using=20
> rules below.....
> 	It=B4s doesn=B4t work... I use a lot of portscan and no one=20
> have been=20
> detected;;; what is wrong???
>=20
> Thanks
>=20
> RULES.....
>=20
>=20
> $IPTABLES -F NOVA_CONEXAO
> $IPTABLES -X NOVA_CONEXAO > /dev/null
>=20
> ## NAT
> $IPTABLES -t nat -F
>=20
> $IPTABLES -N NOVA_CONEXAO
>=20
> ## New packets
> $IPTABLES -A INPUT -i $EXTIF -p ! icmp -m state --state NEW -j=20
> NOVA_CONEXAO
>=20
> ## PortScanners - Detection
> #$IPTABLES -A NOVA_CONEXAO -j LOG --log-prefix=20
> "############################"
> ## NMAP FIN/URG/PSH
> $IPTABLES -A NOVA_CONEXAO -p tcp --tcp-flags ALL FIN,URG,PSH -m limit =

> --limit 2/s -j LOG --log-prefix "(Nmap) Stealth XMAS Scan: "
> # SYN/RST
> $IPTABLES -A NOVA_CONEXAO -p tcp --tcp-flags SYN,RST SYN,RST -m limit =

> --limit 2/s -j LOG --log-prefix "SYN/RST Scan: "
>=20
> # SYN/FIN (probably)
> $IPTABLES -A NOVA_CONEXAO -p tcp --tcp-flags SYN,FIN SYN,FIN -m limit =

> --limit 2/s -j LOG --log-prefix "SYN/FIN Scan(?): "
> # NMAP FIN Stealth
> $IPTABLES -A NOVA_CONEXAO -p tcp --tcp-flags ALL FIN -m limit=20
> --limit 2/s=20
> -j LOG --log-prefix "(Nmap) Stealth FYN Scan: "
> # ALL/ALL Scan
> $IPTABLES -A NOVA_CONEXAO -p tcp --tcp-flags ALL ALL -m limit=20
> --limit 2/s=20
> -j LOG --log-prefix "ALL/ALL Scan: "
> # NMAP Null Scan (probably)
> $IPTABLES -A NOVA_CONEXAO -p tcp --tcp-flags ALL NONE -m=20
> limit --limit 2/s=20
> -j LOG --log-prefix "(Nmap) Stealth Null Scan(?): "
> ## Now Dropping
> $IPTABLES -A NOVA_CONEXAO -p tcp --tcp-flags ALL FIN,URG,PSH -j DROP
> $IPTABLES -A NOVA_CONEXAO -p tcp --tcp-flags SYN,RST SYN,RST -j DROP
> $IPTABLES -A NOVA_CONEXAO -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP
> $IPTABLES -A NOVA_CONEXAO -p tcp --tcp-flags ALL FIN -j DROP
> $IPTABLES -A NOVA_CONEXAO -p tcp --tcp-flags ALL ALL -j DROP
> $IPTABLES -A NOVA_CONEXAO -p tcp --tcp-flags ALL NONE -j DROP
>=20
> ################################
> ## Now my rules..... INPUT
>=20
>=20

