From: Vivek Thrivikraman <vivek.thrivikraman@est.tech>
Subject: UDP IPVS: Incorrect conntrack entry in reply tuple
Date: Wed, 16 Feb 2022 08:38:19 +0000
Message-ID: <DB8P189MB06018A3459E97B07B0DB2074E7359@DB8P189MB0601.EURP189.PROD.OUTLOOK.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com;
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MttottENj+Av2yX8AeR27aiLIf8qLBdzDdYN26OwoHc=;
 b=cI5rFojpFTFzFPr42Y6QGMvkDxMvlV6E8Wkhtc2Nrk3oHaTdjmCFJxPKzBYLOCK002240gq6OZsCrrveoQt3eWl20MqV7pZ76pYSmjpu8HOUxboJAx0dpe4vyPP8ScOE8GiC2jbEjL5HclayZanq/soT4EkcOEI/fhlNuOJN7/o=
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi

We are using Kubernetes in IPVS mode, we have a scaled set up with 159 node=
s, ~11k pods and ~1500 services(k8s in ipvs mode). We have many pods which =
acts as UDP clients, which tries to access multiple VIP, on every node rest=
art we are seeing many client UDP requests to multiple VIP:port serving UDP=
 traffic is getting black holed because of invalid conntrack entry(here the=
 UDP servers/Real servers are not restarted as they are not in the restarte=
d node).=20
The client udp pods keeps on retrying connection with the same udp source p=
ort(we reuse source port) and because of the incorrect conntrack entry and =
frequent connections, conntrack entry stays and traffic is never restored. =
From the logs it was clear that the first packet came after the ipvs rules =
were programmed, but still the reply tuple did not contain the real server =
ip, the reply tuple was just a reverse of original direction(ie reply tuple=
 had source as VIP and destination as the actual source)

Invalid conntrack:
[1644409107.142928] [NEW] udp 17 30 src=3D50.117.79.3 dst=3D64.64.64.59 spo=
rt=3D42467 dport=3D8890 [UNREPLIED] src=3D64.64.64.59 dst=3D50.117.79.3 spo=
rt=3D8890 dport=3D42467
Timestamp above translates to : GMT: Wednesday, February 9, 2022 12:18:27.1=
42 PM
VIP IP:64.64.64.59 , udp client pod:50.117.79.3
If you see the 2nd tuple(reverse direction) does not have NAT'ed entries(bu=
t from below logs looks like by that time ipvs rules were already written).

Logs which clearly shows ipvs rules were added before first packet(conntrac=
k entry above):
I0209 12:17:52.516740 1 endpointslicecache.go:358] "Setting endpoints for s=
ervice port name" portName=3D"bat-t2/cnf-cp-sfs-t2-46-net-udp:tapp-udp" end=
points=3D[192.168.11.237:8890 192.168.110.139:8890 192.168.135.77:8890 192.=
168.183.209:8890 192.168.200.199:8890 192.168.214.234:8890 192.168.215.32:8=
890 192.168.219.117:8890 192.168.219.222:8890 192.168.220.125:8890 192.168.=
247.165:8890 192.168.248.97:8890 192.168.250.78:8890 192.168.255.76:8890 19=
2.168.37.61:8890 192.168.55.131:8890 192.168.57.24:8890 192.168.59.101:8890=
 192.168.7.62:8890 192.168.88.125:8890]
I0209 12:17:56.325097 1 proxier.go:1972] "Adding new service" serviceName=
=3D"bat-t2/cnf-cp-sfs-t2-46-net-udp:tapp-udp" virtualServer=3D"64.64.64.59:=
8890/UDP"
I0209 12:17:56.325126 1 proxier.go:1996] "Bind address" address=3D"64.64.64=
.59"
I0209 12:18:01.339193 1 ipset.go:176] "Successfully added ip set entry to i=
p set" ipSetEntry=3D"64.64.64.59,udp:8890" ipSet=3D"KUBE-LOAD-BALANCER"
I0209 12:18:11.338453 1 proxier.go:1008] "syncProxyRules complete" elapsed=
=3D"18.876838575s"

So the first packet came at 12:18:27.142 but the rules for the same service=
 with endpoints were programmed well before at 12:18:11.338453. And there w=
ere no other events related to this service/endpoint until the first packet=
 came.

Adding output of ipvadm commands, below command shows that ipvsadm has one =
hit(1 inactconn) for the packet in question:
UDP 05:00=A0 UDP=A0=A0=A0=A0=A0=A0=A0=A0 50.117.79.3:42467=A0 64.64.64.59:8=
890 =A0=A0192.168.88.125:8890

UDP=A0 64.64.64.59:8890 rr
=A0 -> 192.168.7.62:8890=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Masq=A0=A0=A0 1=
=A0=A0=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1=A0=A0=A0=A0=A0=A0=A0=A0=20
=A0=A0-> 192.168.11.237:8890=A0=A0=A0=A0=A0=A0=A0=A0=A0 Masq=A0=A0=A0 1=A0=
=A0=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=20
=A0=A0-> 192.168.37.61:8890=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Masq=A0=A0=A0 1=
=A0=A0=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1=A0=A0=A0=A0 =A0=A0=A0=A0
=A0=A0-> 192.168.55.131:8890=A0=A0=A0=A0=A0=A0=A0=A0=A0 Masq=A0=A0=A0 1=A0=
=A0=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1=A0=A0=A0=A0=A0=A0=A0=A0=20
=A0=A0-> 192.168.57.24:8890=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Masq=A0=A0=A0 1=
=A0=A0=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1=A0=A0=A0=A0=A0=A0=A0=A0=20
=A0=A0-> 192.168.59.101:8890=A0=A0=A0=A0=A0=A0=A0=A0=A0 Masq=A0=A0=A0 1=A0=
=A0=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1=A0=A0=A0=A0=A0=A0=A0=A0=20
=A0=A0-> 192.168.88.125:8890=A0=A0=A0=A0=A0=A0=A0=A0=A0 Masq=A0=A0=A0 1=A0=
=A0=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1=A0=A0=A0=A0=A0=A0=A0=A0=20
=A0=A0-> 192.168.110.139:8890=A0=A0=A0=A0=A0=A0=A0=A0 Masq=A0=A0=A0 1=A0=A0=
=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=20
=A0=A0-> 192.168.135.77:8890=A0=A0=A0=A0=A0=A0=A0=A0=A0 Masq=A0=A0=A0 1=A0=
=A0=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=20
=A0=A0-> 192.168.183.209:8890=A0=A0=A0=A0=A0=A0=A0=A0 Masq=A0=A0=A0 1=A0=A0=
=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=20
=A0=A0-> 192.168.200.199:8890=A0=A0=A0=A0=A0=A0=A0=A0 Masq=A0=A0=A0 1=A0=A0=
=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=20
=A0=A0-> 192.168.214.234:8890=A0=A0=A0=A0=A0=A0=A0=A0 Masq=A0=A0=A0 1=A0=A0=
=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=20
=A0=A0-> 192.168.215.32:8890=A0=A0=A0=A0=A0=A0=A0=A0=A0 Masq=A0=A0=A0 1=A0=
=A0=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=20
=A0=A0-> 192.168.219.117:8890=A0=A0=A0=A0=A0=A0=A0=A0 Masq=A0=A0=A0 1=A0=A0=
=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=20
=A0=A0-> 192.168.219.222:8890=A0=A0=A0=A0=A0=A0=A0=A0 Masq=A0=A0=A0 1=A0=A0=
=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=20
=A0=A0-> 192.168.220.125:8890=A0=A0=A0=A0=A0=A0=A0=A0 Masq=A0=A0=A0 1=A0=A0=
=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=20
=A0=A0-> 192.168.247.165:8890=A0=A0=A0=A0=A0=A0=A0=A0 Masq=A0=A0=A0 1=A0=A0=
=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=20
=A0=A0-> 192.168.248.97:8890=A0=A0=A0=A0=A0=A0=A0=A0=A0 Masq=A0=A0=A0 1=A0=
=A0=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=20
=A0=A0-> 192.168.250.78:8890=A0=A0=A0=A0=A0=A0=A0=A0=A0 Masq=A0=A0=A0 1=A0=
=A0=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=20
=A0=A0-> 192.168.255.76:8890=A0=A0=A0=A0=A0=A0=A0=A0=A0 Masq=A0=A0=A0 1=A0=
=A0=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=A0 =A0=A00=A0=A0=A0=A0=A0=A0=A0=20

Can anyone please help with any specific scenario where the reply tuple is =
not populated with real server ip? Or if someone could help with what other=
 logs/data to be collected to move forward.

Thanks,
Vivek

