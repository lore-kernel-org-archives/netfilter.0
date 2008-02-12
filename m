From: "Lamczak, Norbert" <Norbert.Lamczak@kiel.de>
Subject: Problem on natting large encrypted packets through an Iptables
 firewall
Date: Tue, 12 Feb 2008 11:49:07 +0100
Message-ID: <DF0A52DD11A46341A827CEAC54905732094773@rzmail4.lhk.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi,

we are trying to communicate with a pop3 server through a linux nat dev=
ice (we've tested CentOS 4, CentOS 5, SuSE 10.3). We are using a Window=
s box with PrivateWire-client (kind of vpn). We are able to connect to =
the pop3 server and to authenticate ourselves. But as soon as large pac=
kets (equal MTU) are received from the server (LIST, RETR) the answer p=
ackets are not natted any more by the nat device. Large (encrypted) pac=
kets are only routed and so will never reach the client.

Here you can see a little tcpdump example:

	09:23:02.034653 IP (tos 0x0, ttl 128, id 1464, offset 0, flags [DF], p=
roto 6, length: 48) 10.1.200.239.1153 > 10.5.250.216.110: S [tcp sum ok=
] 2194688755:2194688755(0) win 64512 <mss 1260,nop,nop,sackOK>
	09:23:02.088659 IP (tos 0x0, ttl 116, id 30830, offset 0, flags [none]=
, proto 6, length: 48) 10.5.250.216.110 > 10.1.200.239.1153: S [tcp sum=
 ok] 3216423261:3216423261(0) ack 2194688756 win 16384 <mss 1380,nop,no=
p,sackOK>
	.
	.
	.
	09:23:33.029924 IP (tos 0x0, ttl 116, id 32037, offset 0, flags [DF], =
proto 6, length: 40) 10.5.250.216.110 > 10.1.200.239.1153: . [tcp sum o=
k] 911:911(0) ack 218 win 65318
	09:23:33.585331 IP (tos 0x0, ttl 128, id 1590, offset 0, flags [DF], p=
roto 6, length: 42) 10.1.200.239.1153 > 10.5.250.216.110: P [tcp sum ok=
] 218:220(2) ack 911 win 64610
	09:23:33.641724 IP (tos 0x0, ttl 116, id 32039, offset 0, flags [DF], =
proto 6, length: 82) 10.5.250.216.110 > 10.1.200.239.1153: P [tcp sum o=
k] 911:953(42) ack 220 win 65316
	09:23:33.779934 IP (tos 0x0, ttl 116, id 32041, offset 0, flags [DF], =
proto 6, length: 1300) 10.5.250.216.110 > 10.154.16.103.1153: . 3216424=
214:3216425474(1260) ack 2194688975 win 65316
	09:23:33.784883 IP (tos 0x0, ttl 254, id 34087, offset 0, flags [none]=
, proto 6, length: 40) 10.154.16.103.1153 > 10.5.250.216.110: R [tcp su=
m ok] 1:1(0) ack 1260 win 65316
	09:23:33.824125 IP (tos 0x0, ttl 128, id 1592, offset 0, flags [DF], p=
roto 6, length: 40) 10.1.200.239.1153 > 10.5.250.216.110: . [tcp sum ok=
] 220:220(0) ack 953 win 64568
	09:23:33.824278 IP (tos 0x0, ttl 126, id 1592, offset 0, flags [DF], p=
roto 6, length: 40) 10.5.250.216.110 > 10.1.200.239.1153: R [tcp sum ok=
] 953:953(0) ack 220 win 64568


Greetings

Norbert

***********************************************************************=
************
Bitte beachten Sie: Zur Zeit k=F6nnen per E-Mail bei der Landeshauptsta=
dt Kiel noch keine rechtswirksamen Erkl=E4rungen abgegeben werden, dahe=
r ist der Inhalt dieser E-Mail nicht rechtsverbindlich. Irrt=FCmlich er=
haltene E-Mails bitten wir zu l=F6schen, da sie Eigentum der Landeshaup=
tstadt Kiel sind. Wir m=F6chten Sie au=DFerdem darauf hinweisen, dass d=
ie Kommunikation per E-Mail =FCber das Internet unsicher ist, da f=FCr =
unberechtigte Dritte grunds=E4tzlich die M=F6glichkeit der Kenntnisnahm=
e und Manipulation besteht. Dar=FCber hinaus k=F6nnen Versand und Empfa=
ng von E-Mails aus technischen und betrieblichen Gr=FCnden gest=F6rt se=
in. Vertrauliche und wichtige=20
Mitteilungen bitten wir daher per Post/Kurier/Telefax zu versenden.
