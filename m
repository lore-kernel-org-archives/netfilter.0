From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: Internet satellite link.
Date: Wed, 5 May 2004 08:43:00 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405050843.00628.Alistair@nerdnet.ca>
References: <200405051129.16104.carles@unlimitedmail.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405051129.16104.carles@unlimitedmail.org>
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
To: netfilter@lists.netfilter.org

On May 5, 2004 05:29 am, Carles Xavier Munyoz Bald=F3 wrote:
> Hi,
> I have two lilnux boxes with FreeS/WAN and NAT-Traversal compiled in.
> One of them is behind a NAT router that connects to the Internet using a
> satellite link, and the other has its own public IP behind a DSL router.
>
> I have tried the connection of the NATed linux box using a DSL router and
> all goes fine, but when I use the satellite link router, I get the errors:
> [...]
> May  4 13:54:21 FW1 pluto[16116]: packet from 81.47.250.201:1623: received
> Vendor ID payload [draft-ietf-ipsec-nat-t-ike-03]
>
> May  4 13:54:21 FW1 pluto[16116]: packet from 81.47.250.201:1623: ignoring
> Vendor ID payload [draft-ietf-ipsec-nat-t-ike-02]
>
> May  4 13:54:21 FW1 pluto[16116]: packet from 81.47.250.201:1623: ignori
> ng Vendor ID payload [draft-ietf-ipsec-nat-t-ike-00]
>
> May  4 13:54:21 FW1 [16116]: "vpn1"[9] 81.47.250.201:1623 #40: responding
> to Main Mode from unknown peer 81.47.250.201:1623
>
> May  4 13:54:22 FW1 pluto[16116]: "vpn1"[9] 81.47.250.201:1623 #40:
> NAT-Traversal: Result using draft-ietf-ipsec-nat-t-ike-02/03: peer is NAT=
ed
>
> May  4 13:55:32 FW1 pluto[16116]: "vpn1"[9] 81.47.250.201:1623 #40: max
> number of retransmissions (2) reached STATE_MAIN_R2
>
> May  4 13:55:32 FW1 pluto[16116]: "vpn1"[9] 81.47.250.201:1623: deleting
> connection "vpn1" instance with peer 81.47.250.201 {isakmp=3D3D#0/ipsec=
=3D3D#0}
> [...]
>
> I believe that there is no difference between the DSL NAT router and the
> satellite link NAT router, isn't it ?
> Which may be the problem ?

=09
	I sincerely doubt the two work identically on a mechanical level, however =
if=20
they are both connected to the iptables hosts with ethernet cable, the=20
product should be the same.  Keep in mind that routers/switches between you=
=20
and the internet can indeed mangle/NAT/alter/twist/bend/fold/mutilate packe=
ts=20
based on their objectives.  As I've been given to understand, this can inde=
ed=20
cause havoc with VPN tunnels.  At a guess, the connecting VPN client is=20
behind a NAT itself, and -THAT- appears to be the problem -- There are=20
=46AR more experienced VPN people on this list than I, but I believe that t=
here=20
are patches that make this possible.

	Alistair.

=09


>
> Greetings.
> ---
> Carles Xavier Munyoz Bald=F3
> carles@unlimitedmail.org
> http://www.unlimitedmail.net/
> ---

