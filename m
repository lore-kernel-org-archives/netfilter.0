From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Routing through PtP and iptables
Date: Sat, 13 May 2006 12:38:42 +0200
Message-ID: <000601c67679$67d1c940$0101000a@sterenborg.info>
References: <200605122335.10078.antonio.dibacco@aruba.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200605122335.10078.antonio.dibacco@aruba.it>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

netfilter-bounces@lists.netfilter.org scribbled on :

> Hi all,
>=20
> I have two identical linux boxes (A e B), each one with two
> interfaces: an ethernet (eth0 with ip 192.168.1.50) and an hdlc
> (hdlc0). The two boxes are only connected via a link through their
> hdlc interfaces. Because they have to be =A0exactly the same, if I =
have
> to assign an ip address to hdlc0 of A then the hdlc0 of B should have
> the same ip address. Each one should have a default route that cannot
> coincide with the hdlc interface. Every linux box has a web server.
> When I connect with my notebook to box A I want to reach the web
> server on A typing in my browser http://192.168.1.50 and I want to
> reach web server on B typing http://192.168.1.50:8080 .=20
> Some one knows how could it be possible?
>=20
> Thank you for your help,
> Antonio.

If Server A has IP 192.168.1.50, you *cannot* have a server B also on
192.168.1.50 in the samen LAN. You would have 1 IP address for multiple
servers and that just isn't going to work.

What you *can* do is :
Server A =3D 192.168.1.50
Server B =3D 192.168.1.51
Forward requests to 192.168.1.50:8080 to 192.168.1.51(:8080 or whatever
you like)


Gr,
Rob


