From: romaniuc@edumed.org.br
Subject: Portscan??
Date: Tue, 12 Nov 2002 09:57:31 -0200 (BRST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0211120954570.4953-100000@mestre.edumed.org.br>
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
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: netfilter@lists.netfilter.org


Hi all,

	I=B4m trying to detect and block portscan.... and Im using=20
rules below.....
	It=B4s doesn=B4t work... I use a lot of portscan and no one have been=20
detected;;; what is wrong???

Thanks

RULES.....


$IPTABLES -F NOVA_CONEXAO
$IPTABLES -X NOVA_CONEXAO > /dev/null

## NAT
$IPTABLES -t nat -F

$IPTABLES -N NOVA_CONEXAO

## New packets
$IPTABLES -A INPUT -i $EXTIF -p ! icmp -m state --state NEW -j=20
NOVA_CONEXAO

## PortScanners - Detection
#$IPTABLES -A NOVA_CONEXAO -j LOG --log-prefix=20
"############################"
## NMAP FIN/URG/PSH
$IPTABLES -A NOVA_CONEXAO -p tcp --tcp-flags ALL FIN,URG,PSH -m limit=20
--limit 2/s -j LOG --log-prefix "(Nmap) Stealth XMAS Scan: "
# SYN/RST
$IPTABLES -A NOVA_CONEXAO -p tcp --tcp-flags SYN,RST SYN,RST -m limit=20
--limit 2/s -j LOG --log-prefix "SYN/RST Scan: "

# SYN/FIN (probably)
$IPTABLES -A NOVA_CONEXAO -p tcp --tcp-flags SYN,FIN SYN,FIN -m limit=20
--limit 2/s -j LOG --log-prefix "SYN/FIN Scan(?): "
# NMAP FIN Stealth
$IPTABLES -A NOVA_CONEXAO -p tcp --tcp-flags ALL FIN -m limit --limit 2/s=20
-j LOG --log-prefix "(Nmap) Stealth FYN Scan: "
# ALL/ALL Scan
$IPTABLES -A NOVA_CONEXAO -p tcp --tcp-flags ALL ALL -m limit --limit 2/s=20
-j LOG --log-prefix "ALL/ALL Scan: "
# NMAP Null Scan (probably)
$IPTABLES -A NOVA_CONEXAO -p tcp --tcp-flags ALL NONE -m limit --limit 2/s =

-j LOG --log-prefix "(Nmap) Stealth Null Scan(?): "
## Now Dropping
$IPTABLES -A NOVA_CONEXAO -p tcp --tcp-flags ALL FIN,URG,PSH -j DROP
$IPTABLES -A NOVA_CONEXAO -p tcp --tcp-flags SYN,RST SYN,RST -j DROP
$IPTABLES -A NOVA_CONEXAO -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP
$IPTABLES -A NOVA_CONEXAO -p tcp --tcp-flags ALL FIN -j DROP
$IPTABLES -A NOVA_CONEXAO -p tcp --tcp-flags ALL ALL -j DROP
$IPTABLES -A NOVA_CONEXAO -p tcp --tcp-flags ALL NONE -j DROP

################################
## Now my rules..... INPUT


