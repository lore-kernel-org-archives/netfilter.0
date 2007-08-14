From: =?UTF-8?Q?warpme?= <warpme@o2.pl>
Subject: error - but I don't know where....
Date: Tue, 14 Aug 2007 11:59:07 +0200
Message-ID: <42a76351.4ca18173.46c17ceb.6b792@o2.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org
Cc: piotr.oniszczuk@aster.pl

Hi=20*

I=20just=20try=20setup=20firewall.=20Config=20is=20following:

Desktop=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20Firewll=20=20
(192.168.1.1)=20------Eth0=20=20=20Eth1(91.189.74.10)---------ISP

Script=20below=20is=20working=20OK=20for=20all=20LAN=20hosts,=20but=20not=
=20for=20for=20firewall=20PC=20itself=20(i=20tested=20it=20with=20i.e.=20=
ping=20www.ibm.com)
Commenting=20line=20"iptables=20-P=20INPUT=20DROP"=20allows=20to=20ping=20=
from=20firewall,=20but=20it=20effectivelly=20turning=20off=20firewall....=

It=20is=20probably=20simple=20error=20-=20but=20I=20can't=20find=20where=20=
it=20is...
Can=20somebody=20verify=20thid=20script=20and=20tell=20me=20what=20is=20w=
rong=20?

thx=20in=20advance
=20=20

#Config=20area=20BEGIN---------------------------------------------------=
-----------

LAN=5Fintf=3Deth0
LAN=5Fsubnetwork=3D192.168.1.0/255.255.255.0

WAN=5Fintf=3Deth1
WAN=5Fip=3D91.189.74.10

Open=5FWAN=5FTCP=5Fports=3D20,21,80,500,1352,4500
Open=5FWAN=5FUDP=5Fports=3D500,1352,4500,5060
Open=5FWAN=5FRTP=5Fport=5Frange=3D7070:7080


#Config=20area=20END-----------------------------------------------------=
-----------




#--Flushing=20all=20iptables=20tables------------------------------------=
-------------
iptables=20-F
iptables=20-X=20
iptables=20-t=20nat=20-F
iptables=20-t=20nat=20-X
iptables=20-t=20mangle=20-F
iptables=20-t=20mangle=20-X




#--Setting=20up=20SNAT=20for=20outgoing=20to=20WAN=20DATA=20connections--=
----------------------
iptables=20-t=20nat=20-A=20POSTROUTING=20-s=20$LAN=5Fsubnetwork=20-o=20$W=
AN=5Fintf=20-j=20SNAT=20--to-source=20$WAN=5Fip
=20=20
=20=20
#--Allowing=20self=20access=20by=20loopback=20interface------------------=
----------------
iptables=20-A=20INPUT=20-i=20lo=20-p=20all=20-j=20ACCEPT



#--Allowing=20local=20access=20to=20LAN----------------------------------=
--------------
iptables=20-A=20INPUT=20-i=20$LAN=5Fintf=20-p=20all=20-j=20ACCEPT



#--Allowing=20WAN=20incoming=20traffic=20form=20already=20established=20c=
onnections----------
iptables=20-A=20INPUT=20-i=20WAN=5Fintf=20-m=20state=20--state=20ESTABLIS=
HED,RELATED=20-j=20ACCEPT


#--Allowing=20WAN=20incoming=20traffic=20for=20desired=20services--------=
------------------
#Open=20WAN=20TCP=20ports
iptables=20-A=20INPUT=20-p=20tcp=20-i=20$WAN=5Fintf=20-m=20multiport=20--=
dport=20$Open=5FWAN=5FTCP=5Fports=20-j=20ACCEPT

#Open=20WAN=20UDP=20ports
iptables=20-A=20INPUT=20-p=20udp=20-i=20$WAN=5Fintf=20-m=20multiport=20--=
dport=20$Open=5FWAN=5FUDP=5Fports=20-j=20ACCEPT

#Open=20VoIP=20UDP=20port=20ranges
iptables=20-A=20INPUT=20-p=20udp=20-i=20$WAN=5Fintf=20--dport=20$Open=5FW=
AN=5FRTP=5Fport=5Frange=20-j=20ACCEPT


#--Drop=20all=20other=20incoming=20connection.=20Only=20above=20will=20be=
=20allowed-------------
iptables=20-P=20INPUT=20DROP
=20=20=20=20

