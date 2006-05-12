From: Antonio Di Bacco <antonio.dibacco@aruba.it>
Subject: Routing through PtP and iptables
Date: Fri, 12 May 2006 23:35:10 +0200
Message-ID: <200605122335.10078.antonio.dibacco@aruba.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

Hi all,

I have two identical linux boxes (A e B), each one with two interfaces: an=
=20
ethernet (eth0 with ip 192.168.1.50) and an hdlc (hdlc0). The two boxes are=
=20
only connected via a link through their hdlc interfaces. Because they have =
to=20
be =A0exactly the same, if I have to assign an ip address to hdlc0 of A the=
n=20
the hdlc0 of B should have the same ip address. Each one should have a=20
default route that cannot coincide with the hdlc interface. Every linux box=
=20
has a web server. When I connect with my notebook to box A I want to reach=
=20
the web server on A typing in my browser http://192.168.1.50 and I want to=
=20
reach web server on B typing http://192.168.1.50:8080 .
Some one knows how could it be possible?

Thank you for your help,
Antonio.

