From: Carles Xavier Munyoz =?iso-8859-15?q?Bald=F3?= <carles@unlimitedmail.org>
Subject: Internet satellite link.
Date: Wed, 5 May 2004 11:29:15 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405051129.16104.carles@unlimitedmail.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
To: users@lists.freeswan.org
Cc: netfilter@lists.netfilter.org

Hi,
I have two lilnux boxes with FreeS/WAN and NAT-Traversal compiled in.
One of them is behind a NAT router that connects to the Internet using a=20
satellite link, and the other has its own public IP behind a DSL router.

I have tried the connection of the NATed linux box using a DSL router and a=
ll=20
goes fine, but when I use the satellite link router, I get the errors:
[...]
May  4 13:54:21 FW1 pluto[16116]: packet from 81.47.250.201:1623: received
Vendor ID payload [draft-ietf-ipsec-nat-t-ike-03]

May  4 13:54:21 FW1 pluto[16116]: packet from 81.47.250.201:1623: ignoring
Vendor ID payload [draft-ietf-ipsec-nat-t-ike-02]

May  4 13:54:21 FW1 pluto[16116]: packet from 81.47.250.201:1623: ignori
ng Vendor ID payload [draft-ietf-ipsec-nat-t-ike-00]

May  4 13:54:21 FW1 [16116]: "vpn1"[9] 81.47.250.201:1623 #40: responding t=
o=20
Main Mode from unknown peer 81.47.250.201:1623

May  4 13:54:22 FW1 pluto[16116]: "vpn1"[9] 81.47.250.201:1623 #40:=20
NAT-Traversal: Result using draft-ietf-ipsec-nat-t-ike-02/03: peer is NATed

May  4 13:55:32 FW1 pluto[16116]: "vpn1"[9] 81.47.250.201:1623 #40: max num=
ber=20
of retransmissions (2) reached STATE_MAIN_R2

May  4 13:55:32 FW1 pluto[16116]: "vpn1"[9] 81.47.250.201:1623: deleting=20
connection "vpn1" instance with peer 81.47.250.201 {isakmp=3D3D#0/ipsec=3D3=
D#0}
[...]

I believe that there is no difference between the DSL NAT router and the=20
satellite link NAT router, isn't it ?
Which may be the problem ?

Greetings.
=2D--
Carles Xavier Munyoz Bald=F3
carles@unlimitedmail.org
http://www.unlimitedmail.net/
=2D--


