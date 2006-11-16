From: "Marcos Gileno" <gileno@digilab.com.br>
Subject: Multicast route table
Date: Thu, 16 Nov 2006 10:37:48 -0200
Message-ID: <018d01c7097c$0ee67f10$4401a8c0@Gileno>
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
Content-Type: text/plain; format="flowed"; charset="iso-8859-1"; reply-type="original"
To: netfilter@lists.netfilter.org

Hi there people!

I have a linux box as a multi-homed host, 3 interfaces, and I want to route=
=20
a multicast traffic that comes in one of the interface to another, let=B4s =

say, eth0 receveis the multicast and I want eth1 to forward it.

route add -net 224.0.0.0 netmask 240.0.0.0 dev eth1

Then my route table is:

Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use=20
Iface
192.168.5.0     0.0.0.0         255.255.255.0   U     0      0        0 eth2
192.168.4.0     0.0.0.0         255.255.255.0   U     0      0        0 eth1
192.168.1.0     0.0.0.0         255.255.255.0   U     0      0        0 eth0
224.0.0.0       0.0.0.0              240.0.0.0       U     0      0        =
0=20
eth1
0.0.0.0       192.168.1.250       0.0.0.0         UG    0      0        0=20
eth0

But when I tcpdump the interfaces, I see that all interfaces still have the=
=20
traffic.
Does anybody could have an idea ?
Thank=B4s in advance !

---
Marcos Gileno M. Santos
SysAdmin - DIGILAB S.A.
(48) 3234-4041 r.215

"CONFIDENCIAL: As informa=E7=F5es contidas nesta mensagem s=E3o de
propriedade da DIGILAB. Caso n=E3o seja o destinat=E1rio favor contatar
imediatamente o remetente e eliminar esta mensagem sem a reproduzir,
armazenar ou divulgar a qualquer entidade".

"CONFIDENTIALITY: The information contained in this message is the
sole property of Digilab. In case you are not the intended addressee
of this message, please notify the sender immediately and delete this
message without reproducing, storing or publishing it".=20


