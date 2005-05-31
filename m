From: "Clemente Aguiar" <caguiar@madeiratecnopolo.pt>
Subject: RE: mysterious dropped echo replies
Date: Tue, 31 May 2005 19:38:49 +0100
Message-ID: <6A0C419392D7BA45BD141D0BA4F253C78580@loureiro.madeiratecnopolo.pt>
References: <1117558710.27138.4.camel@athene.bestsolution.at>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0016_01C56618.5EC1E1E0"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1117558710.27138.4.camel@athene.bestsolution.at>
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
To: Netfilter list <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.

------=_NextPart_000_0016_01C56618.5EC1E1E0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


I have a similar situation where I get mysterious dropped echo replies.

May 31 18:26:37 fw1 FW-RULE 19 -- DENY IN=3D OUT=3Deth0 =
SRC=3D64.48.194.253
DST=3D62.183.11.71 LEN=3D28 TOS=3D0x00 PREC=3D0xE0 TTL=3D64 ID=3D63250 =
PROTO=3DICMP TYPE=3D0
CODE=3D0 ID=3D512 SEQ=3D46741
May 31 19:03:36 fw1 FW-RULE 19 -- DENY IN=3D OUT=3Deth0 =
SRC=3D64.48.194.253
DST=3D62.118.140.48 LEN=3D28 TOS=3D0x00 PREC=3D0xE0 TTL=3D64 ID=3D41443 =
PROTO=3DICMP
TYPE=3D0 CODE=3D0 ID=3D512 SEQ=3D22592

Again these packets originate at the FW (64.48.194.253) running =
iptables,
and in my case all dropped packets are destined to the outside =
addresses.

I looked at the rules and I cannot see the reason of this behaviour.

Can anybody help?
Note: I attached the iptables script.

Clemente

-----Mensagem original-----
De: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] Em nome de Udo Rader
Enviada: ter=E7a-feira, 31 de Maio de 2005 17:59
Para: Netfilter list
Assunto: Re: mysterious dropped echo replies


thanks for your suggestion, now indeed I don't get any strange log =
messages
any more. And even better I reviewed the firewall configuration and =
found
some other "strange" things in it as well :-)

Udo Rader

BestSolution.at GmbH
http://www.bestsolution.at

On Wed, 2005-06-01 at 18:21 +0300, Sertys wrote:
> Well , this line :
> iptables -t nat -A Cid3D99741E.0   -d 192.168.100.0/24 -j RETURN
>=20
> change it to -j DROP and it wont generate any replies. -j RETURN,=20
> returns
> the packet and sends and icmp message to the src!
>=20
>=20
> On Tue, 31 May 2005 13:33:48 +0200, Udo Rader=20
> <udo.rader@bestsolution.at>
> wrote:
>=20
> > Hi Sertys,
> >
> > thanks for your reponse. I doubt that my entire script will help=20
> > much, but anyway, I attached it (obfuscated a bit, of course :-)
> >
> > Yes, we are using traffic shaping (qdisc), but not RP_filter.
> >
> > The netmask for .240 is find, actually .240 _is_ the router, the=20
> > router sends echo replies to some other hosts in the DMZ for reasons =

> > unknown ...
> >
> > And no, this is no PPP network but a leased line instead.
> >
> > Udo Rader
> >
> > BestSolution.at GmbH
> > http://www.bestsolution.at
> >
> > On Wed, 2005-06-01 at 15:57 +0300, Sertys wrote:
> >> I was totally wrong and realised it a min after sending. In fact=20
> >> why
> >> don't
> >> you post your whole script. Do you use connection limiting? =
RP_filter?
> >> First - check that the netmask is set correctly on 240. As long as =
they
> >> are on the same segment, they aren't suppose to talk via the =
router. =20
> >> They
> >> just have to ARP discover each other and talk directly. A machine =
gets

> >> to
> >> default gw, when the ip is not in the routing table. IS THIS A PPP  =

> >> network?
> >>
> >>
> >>
> >> On Wed, 01 Jun 2005 15:50:35 +0300, Sertys <sertys@supportivo.org>
> >> wrote:
> >>
> >> > On Tue, 31 May 2005 10:42:36 +0200, Udo Rader=20
> >> > <udo.rader@bestsolution.at> wrote:
> >> >
> >> > Those are illegal packets:
> >> >> DROP IN=3D OUT=3Deth1 SRC=3D192.168.100.240 DST=3D192.168.100.10 =
LEN=3D28
> >> TOS=3D0x00
> >> >> PREC=3D0x00 TTL=3D64 ID=3D32153 PROTO=3DICMP TYPE=3D0 CODE=3D0 =
ID=3D45639=20
> >> >> SEQ=3D0
> >> > There's no type0&code0 combination.
> >> >
> >> >
> >> >> Hi,
> >> >>
> >> >> I am stuck with a strange phenonemon where iptables drops=20
> >> >> packages it
> >> >> (probably) shouldn't.
> >> >>
> >> >> The dropped packages are logged like this:
> >> >>
> >> >> DROP IN=3D OUT=3Deth1 SRC=3D192.168.100.240 DST=3D192.168.100.10 =
LEN=3D28
> >> TOS=3D0x00
> >> >> PREC=3D0x00 TTL=3D64 ID=3D32153 PROTO=3DICMP TYPE=3D0 CODE=3D0 =
ID=3D45639=20
> >> >> SEQ=3D0
> >> >>
> >> >> So that means that this is about an icmp echo reply, originating =

> >> >> from 192.168.100.240, pending to be sent through its internal=20
> >> >> interface
> >> >> (eth1) and destined to 192.168.100.10.
> >> >>
> >> >> It is completely mysterious to me where this reply comes from,=20
> >> >> but that's not all.
> >> >>
> >> >> Each of the two hosts involved can ping each other and in the=20
> >> >> case
> >> of a
> >> >> ping, iptables does not drop any packages.
> >> >>
> >> >> If I shut down 192.168.100.10 (a box within the DMZ), it doesn't =

> >> >> take long until iptables starts to drop packages destined to =
other
boxes
> >> in
> >> >> the DMZ.
> >> >>
> >> >> One of the first rules in my iptables setup is this:
> >> >>
> >> >> iptables -A INPUT -s 192.168.100.0/24 -m state --state NEW -j=20
> >> >> ACCEPT iptables -A OUTPUT -s 192.168.100.0/24 -m state --state=20
> >> >> NEW -j ACCEPT iptables -A FORWARD -s 192.168.100.0/24 -m state
--state NEW -j
> >> ACCEPT
> >> >>
> >> >> For the internal interface this is the first rule:
> >> >>
> >> >> iptables -A INPUT -i eth1 -s 192.168.100.0/24 -d=20
> >> >> 192.168.100.0/24 -m state --state NEW -j ACCEPT iptables -A=20
> >> >> FORWARD  -i eth1 -s 192.168.100.0/24 -d 192.168.100.0/24
> >> -m
> >> >> state --state NEW -j ACCEPT
> >> >> iptables -A OUTPUT -o eth1 -s 192.168.100.0/24 -d=20
> >> >> 192.168.100.0/24 -m state --state NEW -j ACCEPT iptables -A=20
> >> >> FORWARD -o eth1 -s 192.168.100.0/24 -d 192.168.100.0/24
> >> -m
> >> >> state --state NEW -j ACCEPT
> >> >>
> >> >> The rule that drops the package is the very last one (the 'catch
> >> all')
> >> >> rule.
> >> >>
> >> >> This is something new, because I haven't changed the iptaples=20
> >> >> setup
> >> for
> >> >> quite some time, so if anybody has any guess on what's going on=20
> >> >> here.
> >> >>
> >> >> Udo Rader
> >> >>
> >> >> BestSolution.at GmbH
> >> >> http://www.bestsolution.at
> >> >
> >> >
> >> >
> >>
> >>
> >>
>=20
>=20
>=20
> --
> www.supportivo.org
>=20
> I can't stop myself checking for pigs in the outlets. Everybody thinks =

> i'm
> a punk, cause of the hairstyle(220V).
> end
--=20
B e s t S o l u t i o n . a t                        EDV Systemhaus GmbH
------------------------------------------------------------------------
udo rader              technischer leiter/CEM   mobile  ++43 660 5263642
------------------------------------------------------------------------
eduard-bodem-gasse 8/3    A-6020 innsbruck      fax      ++43 512 935833
http://www.bestsolution.at                      phone    ++43 512 935834

------=_NextPart_000_0016_01C56618.5EC1E1E0
Content-Type: application/octet-stream;
	name="fw.sh"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="fw.sh"

#!/bin/sh=20
#
IPTABLES_RESTORE=3D"iptables-restore"
cat << EOF | $IPTABLES_RESTORE
*filter
:INPUT DROP [0:0]
:FORWARD DROP [0:0]
:OUTPUT DROP [0:0]
-A INPUT   -m state --state ESTABLISHED,RELATED -j ACCEPT
-A OUTPUT  -m state --state ESTABLISHED,RELATED -j ACCEPT
-A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

#=20
# Rule 0 (eth0)
#=20
# anti spoofing rule
#=20
:eth0_In_RULE_0 - [0:0]
-A INPUT  -i eth0  -s 64.48.194.253  -j eth0_In_RULE_0=20
-A INPUT  -i eth0  -s 64.48.194.190  -j eth0_In_RULE_0=20
-A INPUT  -i eth0  -s 64.48.194.238  -j eth0_In_RULE_0=20
-A INPUT  -i eth0  -s 64.48.194.250  -j eth0_In_RULE_0=20
-A INPUT  -i eth0  -s 192.168.2.233  -j eth0_In_RULE_0=20
-A INPUT  -i eth0  -s 64.48.194.128/26  -j eth0_In_RULE_0=20
-A INPUT  -i eth0  -s 64.48.194.224/28  -j eth0_In_RULE_0=20
-A INPUT  -i eth0  -s 64.48.194.248/30  -j eth0_In_RULE_0=20
-A FORWARD  -i eth0  -s 64.48.194.253  -j eth0_In_RULE_0=20
-A FORWARD  -i eth0  -s 64.48.194.190  -j eth0_In_RULE_0=20
-A FORWARD  -i eth0  -s 64.48.194.238  -j eth0_In_RULE_0=20
-A FORWARD  -i eth0  -s 64.48.194.250  -j eth0_In_RULE_0=20
-A FORWARD  -i eth0  -s 192.168.2.233  -j eth0_In_RULE_0=20
-A FORWARD  -i eth0  -s 64.48.194.128/26  -j eth0_In_RULE_0=20
-A FORWARD  -i eth0  -s 64.48.194.224/28  -j eth0_In_RULE_0=20
-A FORWARD  -i eth0  -s 64.48.194.248/30  -j eth0_In_RULE_0=20
-A eth0_In_RULE_0    -m limit --limit 5/second -j LOG  --log-level info =
--log-prefix "FW-RULE 0 -- DENY "
-A eth0_In_RULE_0   -j DROP=20
#=20
# Rule 0 (eth4)
#=20
# anti spoofing rule
#=20
:eth4_In_RULE_0 - [0:0]
-A INPUT  -i eth4  -s 64.48.194.253  -j eth4_In_RULE_0=20
-A INPUT  -i eth4  -s 64.48.194.190  -j eth4_In_RULE_0=20
-A INPUT  -i eth4  -s 64.48.194.238  -j eth4_In_RULE_0=20
-A INPUT  -i eth4  -s 64.48.194.250  -j eth4_In_RULE_0=20
-A INPUT  -i eth4  -s 192.168.2.233  -j eth4_In_RULE_0=20
-A INPUT  -i eth4  -s 64.48.194.252/30  -j eth4_In_RULE_0=20
-A INPUT  -i eth4  -s 64.48.194.224/28  -j eth4_In_RULE_0=20
-A INPUT  -i eth4  -s 64.48.194.248/30  -j eth4_In_RULE_0=20
-A FORWARD  -i eth4  -s 64.48.194.253  -j eth4_In_RULE_0=20
-A FORWARD  -i eth4  -s 64.48.194.190  -j eth4_In_RULE_0=20
-A FORWARD  -i eth4  -s 64.48.194.238  -j eth4_In_RULE_0=20
-A FORWARD  -i eth4  -s 64.48.194.250  -j eth4_In_RULE_0=20
-A FORWARD  -i eth4  -s 192.168.2.233  -j eth4_In_RULE_0=20
-A FORWARD  -i eth4  -s 64.48.194.252/30  -j eth4_In_RULE_0=20
-A FORWARD  -i eth4  -s 64.48.194.224/28  -j eth4_In_RULE_0=20
-A FORWARD  -i eth4  -s 64.48.194.248/30  -j eth4_In_RULE_0=20
-A eth4_In_RULE_0    -m limit --limit 5/second -j LOG  --log-level info =
--log-prefix "FW-RULE 0 -- DENY "
-A eth4_In_RULE_0   -j DROP=20
#=20
# Rule 0 (lo)
#=20
#=20
#=20
-A INPUT  -i lo  -m state --state NEW  -j ACCEPT=20
-A OUTPUT  -o lo  -m state --state NEW  -j ACCEPT=20
#=20
# Rule 0 (eth2)
#=20
# anti spoofing rule
#=20
:eth2_In_RULE_0 - [0:0]
-A INPUT  -i eth2  -s 64.48.194.253  -j eth2_In_RULE_0=20
-A INPUT  -i eth2  -s 64.48.194.190  -j eth2_In_RULE_0=20
-A INPUT  -i eth2  -s 64.48.194.238  -j eth2_In_RULE_0=20
-A INPUT  -i eth2  -s 64.48.194.250  -j eth2_In_RULE_0=20
-A INPUT  -i eth2  -s 192.168.2.233  -j eth2_In_RULE_0=20
-A INPUT  -i eth2  -s 64.48.194.248/30  -j eth2_In_RULE_0=20
-A INPUT  -i eth2  -s 64.48.194.252/30  -j eth2_In_RULE_0=20
-A INPUT  -i eth2  -s 64.48.194.128/26  -j eth2_In_RULE_0=20
-A FORWARD  -i eth2  -s 64.48.194.253  -j eth2_In_RULE_0=20
-A FORWARD  -i eth2  -s 64.48.194.190  -j eth2_In_RULE_0=20
-A FORWARD  -i eth2  -s 64.48.194.238  -j eth2_In_RULE_0=20
-A FORWARD  -i eth2  -s 64.48.194.250  -j eth2_In_RULE_0=20
-A FORWARD  -i eth2  -s 192.168.2.233  -j eth2_In_RULE_0=20
-A FORWARD  -i eth2  -s 64.48.194.248/30  -j eth2_In_RULE_0=20
-A FORWARD  -i eth2  -s 64.48.194.252/30  -j eth2_In_RULE_0=20
-A FORWARD  -i eth2  -s 64.48.194.128/26  -j eth2_In_RULE_0=20
-A eth2_In_RULE_0    -m limit --limit 5/second -j LOG  --log-level info =
--log-prefix "FW-RULE 0 -- DENY "
-A eth2_In_RULE_0   -j DROP=20
#=20
# Rule 0 (eth5)
#=20
# anti spoofing rule
#=20
:eth5_In_RULE_0 - [0:0]
-A INPUT  -i eth5  -s 64.48.194.253  -j eth5_In_RULE_0=20
-A INPUT  -i eth5  -s 64.48.194.190  -j eth5_In_RULE_0=20
-A INPUT  -i eth5  -s 64.48.194.238  -j eth5_In_RULE_0=20
-A INPUT  -i eth5  -s 64.48.194.250  -j eth5_In_RULE_0=20
-A INPUT  -i eth5  -s 192.168.2.233  -j eth5_In_RULE_0=20
-A INPUT  -i eth5  -s 64.48.194.128/26  -j eth5_In_RULE_0=20
-A INPUT  -i eth5  -s 64.48.194.224/28  -j eth5_In_RULE_0=20
-A INPUT  -i eth5  -s 64.48.194.252/30  -j eth5_In_RULE_0=20
-A FORWARD  -i eth5  -s 64.48.194.253  -j eth5_In_RULE_0=20
-A FORWARD  -i eth5  -s 64.48.194.190  -j eth5_In_RULE_0=20
-A FORWARD  -i eth5  -s 64.48.194.238  -j eth5_In_RULE_0=20
-A FORWARD  -i eth5  -s 64.48.194.250  -j eth5_In_RULE_0=20
-A FORWARD  -i eth5  -s 192.168.2.233  -j eth5_In_RULE_0=20
-A FORWARD  -i eth5  -s 64.48.194.128/26  -j eth5_In_RULE_0=20
-A FORWARD  -i eth5  -s 64.48.194.224/28  -j eth5_In_RULE_0=20
-A FORWARD  -i eth5  -s 64.48.194.252/30  -j eth5_In_RULE_0=20
-A eth5_In_RULE_0    -m limit --limit 5/second -j LOG  --log-level info =
--log-prefix "FW-RULE 0 -- DENY "
-A eth5_In_RULE_0   -j DROP=20
#=20
# Rule 0 (global)
#=20
# Blocking unwanted types of packets.
# - IP Fragments
# - SCAN XMAS (see SNORT)
# - SCAN nmap XMAS (see SNORT)
# - SCAN nmap fingerprint attempt
#=20
:RULE_0 - [0:0]
-A OUTPUT -p all  -f   -j RULE_0=20
-A OUTPUT -p tcp -m tcp  --tcp-flags ALL URG,PSH,FIN  -j RULE_0=20
-A OUTPUT -p tcp -m tcp  --tcp-flags ALL URG,ACK,PSH,RST,SYN,FIN  -j =
RULE_0=20
-A OUTPUT -p tcp -m tcp  --tcp-flags ALL URG,PSH,SYN,FIN  -j RULE_0=20
-A INPUT -p all  -f   -j RULE_0=20
-A INPUT -p tcp -m tcp  --tcp-flags ALL URG,PSH,FIN  -j RULE_0=20
-A INPUT -p tcp -m tcp  --tcp-flags ALL URG,ACK,PSH,RST,SYN,FIN  -j =
RULE_0=20
-A INPUT -p tcp -m tcp  --tcp-flags ALL URG,PSH,SYN,FIN  -j RULE_0=20
-A FORWARD -p all  -f   -j RULE_0=20
-A FORWARD -p tcp -m tcp  --tcp-flags ALL URG,PSH,FIN  -j RULE_0=20
-A FORWARD -p tcp -m tcp  --tcp-flags ALL URG,ACK,PSH,RST,SYN,FIN  -j =
RULE_0=20
-A FORWARD -p tcp -m tcp  --tcp-flags ALL URG,PSH,SYN,FIN  -j RULE_0=20
-A RULE_0   -m limit --limit 5/second -j LOG  --log-level info =
--log-prefix "FW-RULE 0 -- DENY "
-A RULE_0  -j DROP=20
#=20
# Rule 1 (global)
#=20
# Acesso da rede de Servers (que tb tem redes Internas) e da rede das =
Empresas
#=20
:Cid4267E6B5.0 - [0:0]
-A FORWARD  -s 64.48.194.128/26  -m state --state NEW  -j Cid4267E6B5.0=20
-A FORWARD  -s 64.48.194.224/28  -m state --state NEW  -j Cid4267E6B5.0=20
-A Cid4267E6B5.0 -p tcp -m tcp  --dport 6700:6702  -j ACCEPT=20
-A Cid4267E6B5.0 -p tcp -m tcp  -m multiport  --dports =
443,143,22,80,53,21,25,110,113,8080,1709,5190,1755,1863,4661  -j ACCEPT=20
-A Cid4267E6B5.0 -p tcp -m tcp  -m multiport  --dports =
8888,6100,7000,1723,3389,211,43,5878,8003,6667,5900,5901,37,119  -j =
ACCEPT=20
-A Cid4267E6B5.0 -p udp -m udp  -m multiport  --dports =
53,1709,123,161,162,37  -j ACCEPT=20
-A Cid4267E6B5.0 -p 47  -j ACCEPT=20
#=20
# Rule 2 (global)
#=20
#=20
#=20
:Cid4267FD87.0 - [0:0]
-A FORWARD  -d 64.48.194.128/26  -m state --state NEW  -j Cid4267FD87.0=20
-A FORWARD  -d 64.48.194.224/28  -m state --state NEW  -j Cid4267FD87.0=20
-A Cid4267FD87.0 -p tcp -m tcp  --dport 6700:6702  -j ACCEPT=20
-A Cid4267FD87.0 -p tcp -m tcp  -m multiport  --dports =
443,143,22,80,53,21,25,110,113,8080,1709,5190,1755,1863,4661  -j ACCEPT=20
-A Cid4267FD87.0 -p tcp -m tcp  -m multiport  --dports =
8888,6100,7000,3389,1723,211,5878,9800  -j ACCEPT=20
-A Cid4267FD87.0 -p udp -m udp  -m multiport  --dports 53,1709,123  -j =
ACCEPT=20
-A Cid4267FD87.0 -p 47  -j ACCEPT=20
#=20
# Rule 3 (global)
#=20
#=20
#=20
:Cid4268C2FE.0 - [0:0]
-A FORWARD  -s 64.48.194.232/31  -m state --state NEW  -j Cid4268C2FE.0=20
-A FORWARD  -s 64.48.194.230  -m state --state NEW  -j Cid4268C2FE.0=20
-A FORWARD  -s 64.48.194.231  -m state --state NEW  -j Cid4268C2FE.0=20
-A FORWARD  -s 64.48.194.234  -m state --state NEW  -j Cid4268C2FE.0=20
-A Cid4268C2FE.0 -p tcp -m tcp  -m multiport  --dports 500,981,18190,264 =
 -j ACCEPT=20
-A Cid4268C2FE.0 -p udp -m udp  -m multiport  --dports 500,981,2746  -j =
ACCEPT=20
#=20
# Rule 4 (global)
#=20
#=20
#=20
:Cid4268C2DE.0 - [0:0]
-A FORWARD  -d 64.48.194.232/31  -m state --state NEW  -j Cid4268C2DE.0=20
-A FORWARD  -d 64.48.194.230  -m state --state NEW  -j Cid4268C2DE.0=20
-A FORWARD  -d 64.48.194.231  -m state --state NEW  -j Cid4268C2DE.0=20
-A FORWARD  -d 64.48.194.234  -m state --state NEW  -j Cid4268C2DE.0=20
-A Cid4268C2DE.0 -p tcp -m tcp  -m multiport  --dports 500,981,18190,264 =
 -j ACCEPT=20
-A Cid4268C2DE.0 -p udp -m udp  -m multiport  --dports 500,981,2746  -j =
ACCEPT=20
#=20
# Rule 5 (global)
#=20
#=20
#=20
-A FORWARD -p tcp -m tcp  -s 64.48.194.154  --dport 1025:1035  -m state =
--state NEW  -j ACCEPT=20
#=20
# Rule 6 (global)
#=20
#=20
#=20
-A FORWARD -p tcp -m tcp  -d 64.48.194.154  --dport 1025:1035  -m state =
--state NEW  -j ACCEPT=20
#=20
# Rule 7 (global)
#=20
#=20
#=20
-A FORWARD  -s 64.48.194.170  -m state --state NEW  -j ACCEPT=20
-A FORWARD  -s 213.190.196.77  -m state --state NEW  -j ACCEPT=20
-A FORWARD  -s 64.48.194.148  -m state --state NEW  -j ACCEPT=20
-A FORWARD  -s 64.48.194.145  -m state --state NEW  -j ACCEPT=20
-A FORWARD  -s 64.48.194.147  -m state --state NEW  -j ACCEPT=20
-A FORWARD  -s 64.48.194.146  -m state --state NEW  -j ACCEPT=20
-A FORWARD  -s 64.48.194.149  -m state --state NEW  -j ACCEPT=20
#=20
# Rule 8 (global)
#=20
# Aten=C3=A7=C3=A3o: Sem protec=C3=A7=C3=A3o!!!
# Verificar todos os servi=C3=A7os que correm nestas maquinas.
#=20
-A FORWARD  -d 64.48.194.170  -m state --state NEW  -j ACCEPT=20
-A FORWARD  -d 64.48.194.148  -m state --state NEW  -j ACCEPT=20
-A FORWARD  -d 64.48.194.145  -m state --state NEW  -j ACCEPT=20
-A FORWARD  -d 64.48.194.147  -m state --state NEW  -j ACCEPT=20
-A FORWARD  -d 64.48.194.146  -m state --state NEW  -j ACCEPT=20
-A FORWARD  -d 64.48.194.149  -m state --state NEW  -j ACCEPT=20
-A FORWARD  -d 64.48.194.230  -m state --state NEW  -j ACCEPT=20
#=20
# Rule 9 (global)
#=20
#=20
#=20
-A FORWARD -p tcp -m tcp  -d 64.48.194.173  --dport 3306  -m state =
--state NEW  -j ACCEPT=20
#=20
# Rule 10 (global)
#=20
#=20
#=20
:Cid4268C560.0 - [0:0]
-A FORWARD  -d 64.48.194.180  -m state --state NEW  -j Cid4268C560.0=20
-A Cid4268C560.0 -p tcp -m tcp  -m multiport  --dports =
80,443,8003,5900,5901  -j ACCEPT=20
#=20
# Rule 11 (global)
#=20
#=20
#=20
-A FORWARD -p tcp -m tcp  -d 0.0.0.0  --dport 81  -m state --state NEW  =
-j ACCEPT=20
#=20
# Rule 12 (global)
#=20
# Permitir acesso da VLAN3 =C3=A0 Internet
#=20
:Cid42613510.0 - [0:0]
-A FORWARD  -s 64.48.194.151  -m state --state NEW  -j Cid42613510.0=20
-A Cid42613510.0 -p tcp -m tcp  -m multiport  --dports 445,139,135  -j =
RETURN=20
-A Cid42613510.0 -p udp -m udp  -m multiport  --dports 138,137  -j =
RETURN=20
-A Cid42613510.0  -m state --state NEW  -j ACCEPT=20
#=20
# Rule 13 (global)
#=20
# SSH Access to firewall is permitted
# only from the Management network (VLAN2).
# Temporariamente permitir acesso de qualquer endere=C3=A7o.
#=20
:Cid426134BF.0 - [0:0]
-A INPUT -p tcp -m tcp  --dport 22  -m state --state NEW  -j =
Cid426134BF.0=20
:Cid426134BF.1 - [0:0]
-A Cid426134BF.0  -s 64.48.194.128/26  -j Cid426134BF.1=20
-A Cid426134BF.0  -s 192.168.2.0/24  -j Cid426134BF.1=20
-A Cid426134BF.1  -d 64.48.194.253  -j ACCEPT=20
-A Cid426134BF.1  -d 64.48.194.190  -j ACCEPT=20
-A Cid426134BF.1  -d 64.48.194.238  -j ACCEPT=20
-A Cid426134BF.1  -d 64.48.194.250  -j ACCEPT=20
-A Cid426134BF.1  -d 192.168.2.233  -j ACCEPT=20
#=20
# Rule 14 (global)
#=20
# Permitir acesso da FW =C3=A0 Internet.
# Acesso necess=C3=A1rio =C3=A9:
# DNS e NTP ao dns1.madeiratecnopolo.pt
# RSYNC e HTTP para update do sistema.
# SMTP para poder enviar emails de alerta.
#=20
:Cid426134C9.0 - [0:0]
-A OUTPUT  -s 64.48.194.253  -m state --state NEW  -j Cid426134C9.0=20
-A OUTPUT  -s 64.48.194.190  -m state --state NEW  -j Cid426134C9.0=20
-A OUTPUT  -s 64.48.194.238  -m state --state NEW  -j Cid426134C9.0=20
-A OUTPUT  -s 64.48.194.250  -m state --state NEW  -j Cid426134C9.0=20
-A OUTPUT  -s 192.168.2.233  -m state --state NEW  -j Cid426134C9.0=20
-A Cid426134C9.0 -p icmp  -m icmp  --icmp-type 8/0   -j ACCEPT=20
-A Cid426134C9.0 -p tcp -m tcp  -m multiport  --dports 80,53,873,25  -j =
ACCEPT=20
-A Cid426134C9.0 -p udp -m udp  -m multiport  --dports 123,53  -j ACCEPT =

#=20
# Rule 15 (global)
#=20
# Usefull communication protocols.
# - ping request should be removed or at least limited
# - Source quench maybe?? has to be stateless
#=20
-A OUTPUT -p icmp  -m icmp  --icmp-type 8/0   -m state --state NEW   -m =
limit --limit 1/second --limit-burst 5 -j ACCEPT=20
-A OUTPUT -p icmp  -m icmp  --icmp-type 4  -m state --state NEW   -m =
limit --limit 1/second --limit-burst 5 -j ACCEPT=20
-A OUTPUT -p udp -m udp  --dport 33434:33524  -m state --state NEW   -m =
limit --limit 1/second --limit-burst 5 -j ACCEPT=20
-A INPUT -p icmp  -m icmp  --icmp-type 8/0   -m state --state NEW   -m =
limit --limit 1/second --limit-burst 5 -j ACCEPT=20
-A INPUT -p icmp  -m icmp  --icmp-type 4  -m state --state NEW   -m =
limit --limit 1/second --limit-burst 5 -j ACCEPT=20
-A INPUT -p udp -m udp  --dport 33434:33524  -m state --state NEW   -m =
limit --limit 1/second --limit-burst 5 -j ACCEPT=20
-A FORWARD -p icmp  -m icmp  --icmp-type 8/0   -m state --state NEW   -m =
limit --limit 1/second --limit-burst 5 -j ACCEPT=20
-A FORWARD -p icmp  -m icmp  --icmp-type 4  -m state --state NEW   -m =
limit --limit 1/second --limit-burst 5 -j ACCEPT=20
-A FORWARD -p udp -m udp  --dport 33434:33524  -m state --state NEW   -m =
limit --limit 1/second --limit-burst 5 -j ACCEPT=20
#=20
# Rule 17 (global)
#=20
# Quickly reject attempts to connect
# to ident server to avoid SMTP delays
#=20
-A FORWARD -p tcp -m tcp  --dport 113  -j REJECT  --reject-with =
tcp-reset=20
#=20
# Rule 18 (global)
#=20
# Drop all broadcast - but NO log
#=20
-A OUTPUT  -m pkttype --pkt-type broadcast  -j DROP=20
-A INPUT  -m pkttype --pkt-type broadcast  -j DROP=20
-A FORWARD  -m pkttype --pkt-type broadcast  -j DROP=20
#=20
# Rule 19 (global)
#=20
#=20
#=20
:RULE_19 - [0:0]
-A OUTPUT  -j RULE_19=20
-A INPUT  -j RULE_19=20
-A FORWARD  -j RULE_19=20
-A RULE_19   -m limit --limit 5/second -j LOG  --log-level info =
--log-prefix "FW-RULE 19 -- DENY "
-A RULE_19  -j DROP=20
#
COMMIT
#
EOF
#
#
echo 1 > /proc/sys/net/ipv4/ip_forward
------=_NextPart_000_0016_01C56618.5EC1E1E0--


