From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: Internet satellite link.
Date: Wed, 05 May 2004 11:28:15 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1083770894.9138.38.camel@localhost>
References: <200405051129.16104.carles@unlimitedmail.org>
	 <200405050843.00628.Alistair@nerdnet.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405050843.00628.Alistair@nerdnet.ca>
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
To: Alistair Tonner <Alistair@nerdnet.ca>
Cc: netfilter@lists.netfilter.org

On Wed, 2004-05-05 at 08:43, Alistair Tonner wrote:
> On May 5, 2004 05:29 am, Carles Xavier Munyoz Bald=C3=B3 wrote:
> > Hi,
> > I have two lilnux boxes with FreeS/WAN and NAT-Traversal compiled in.
> > One of them is behind a NAT router that connects to the Internet using =
a
> > satellite link, and the other has its own public IP behind a DSL router=
.
> >
> > I have tried the connection of the NATed linux box using a DSL router a=
nd
> > all goes fine, but when I use the satellite link router, I get the erro=
rs:
> > [...]
> > May  4 13:54:21 FW1 pluto[16116]: packet from 81.47.250.201:1623: recei=
ved
> > Vendor ID payload [draft-ietf-ipsec-nat-t-ike-03]
> >
> > May  4 13:54:21 FW1 pluto[16116]: packet from 81.47.250.201:1623: ignor=
ing
> > Vendor ID payload [draft-ietf-ipsec-nat-t-ike-02]
> >
> > May  4 13:54:21 FW1 pluto[16116]: packet from 81.47.250.201:1623: ignor=
i
> > ng Vendor ID payload [draft-ietf-ipsec-nat-t-ike-00]
> >
> > May  4 13:54:21 FW1 [16116]: "vpn1"[9] 81.47.250.201:1623 #40: respondi=
ng
> > to Main Mode from unknown peer 81.47.250.201:1623
> >
> > May  4 13:54:22 FW1 pluto[16116]: "vpn1"[9] 81.47.250.201:1623 #40:
> > NAT-Traversal: Result using draft-ietf-ipsec-nat-t-ike-02/03: peer is N=
ATed
> >
> > May  4 13:55:32 FW1 pluto[16116]: "vpn1"[9] 81.47.250.201:1623 #40: max
> > number of retransmissions (2) reached STATE_MAIN_R2
> >
> > May  4 13:55:32 FW1 pluto[16116]: "vpn1"[9] 81.47.250.201:1623: deletin=
g
> > connection "vpn1" instance with peer 81.47.250.201 {isakmp=3D3D#0/ipsec=
=3D3D#0}
> > [...]
> >
> > I believe that there is no difference between the DSL NAT router and th=
e
> > satellite link NAT router, isn't it ?
> > Which may be the problem ?
>=20
> =09
> 	I sincerely doubt the two work identically on a mechanical level, howeve=
r if=20
> they are both connected to the iptables hosts with ethernet cable, the=20
> product should be the same.  Keep in mind that routers/switches between y=
ou=20
> and the internet can indeed mangle/NAT/alter/twist/bend/fold/mutilate pac=
kets=20
> based on their objectives.  As I've been given to understand, this can in=
deed=20
> cause havoc with VPN tunnels.  At a guess, the connecting VPN client is=20
> behind a NAT itself, and -THAT- appears to be the problem -- There are=20
> FAR more experienced VPN people on this list than I, but I believe that t=
here=20
> are patches that make this possible.
>=20
> 	Alistair.
<snip>
This is probably better posted to one of the *swan mailing lists.  There
are some issues with Satellite but they are usually related to
performance rather than establishing a connection.  There is typically
high latency on a satellite link.  Many satellite providers compensate
for this by spoofing the tcp ACKs (I believe) but since the real packets
cannot be seen in the ESP encapsulation, the spoofing doesn't work and
one must live with the real latency.  This can really kill latency
sensitive (ping-pongy) applications but should not prevent connection.

It would be helpful to see what the logs look like on the other side to
see what the complaints are there - John
> > ---
--=20
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net=20


