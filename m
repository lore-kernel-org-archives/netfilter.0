From: Filip Sneppe <filip.sneppe@gmail.com>
Subject: Re: help with fast nat
Date: Thu, 14 Apr 2005 09:42:26 +0200
Message-ID: <9151ac2a05041400427dd043e2@mail.gmail.com>
References: <Pine.GSO.4.58.0504131520420.25950@mcnet.marietta.edu>
Reply-To: Filip Sneppe <filip.sneppe@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.GSO.4.58.0504131520420.25950@mcnet.marietta.edu>
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
Content-Type: text/plain; charset="us-ascii"
To: Stephen Beck <becks@marietta.edu>
Cc: netfilter@lists.netfilter.org

Hi Stephen,

On 4/13/05, Stephen Beck <becks@marietta.edu> wrote:

>=20
> can anyone get me on to the next step:
>=20

Unfortionately, "fast nat" is broken on 2.6 kernels, due to the ipsec code
that went in. It should actually be removed. Apparently, even RH 2.4 kernel=
s=20
with the ipsec code are broken:

https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=3D126611

See also:
http://mailman.ds9a.nl/pipermail/lartc/2004q4/014307.html

And the thread at:
http://marc.theaimsgroup.com/?l=3Dlinux-netdev&m=3D109582576330019&w=3D2

So I guess you're better off trying something like the NETMAP target
in iptables.

Regards,
Filip

