From: "Eduardo Spremolla" <edspremolla@antel.com.uy>
Subject: Re: Kernel panic when routing large pings on an XScale (IXP425).
Date: Tue, 31 May 2005 10:08:26 -0300
Message-ID: <1117544906.6378.7.camel@fly.in.iantel.com.uy>
References: <BEC09F68.4CD5%gary@primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BEC09F68.4CD5%gary@primeexalia.com>
Content-Class: urn:content-classes:message
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
To: "Gary W. Smith" <gary@primeexalia.com>
Cc: netfilter@lists.netfilter.org, Cian Masterson <cianm@klasonline.com>

I experience the very same error just yesterday:
KERNEL PANIC - Not Syncing: net/ipv4/xfrm4_output.c:106 : spin_lock
(net/xfrm/xfrm_state.C : ddd2b014) already locked by
net/ipv4/xfrm4_output.c/106

on a Fedora Core2 box running 2.6.10-1.771_FC2 kernel and=20
ipsec-tools-0.5-2.fc2.

the curiosity is that this box was running ok for more than a month with
this policies:
=20
spdadd 10.3.1.0/24 10.3.4.0/24 any -P in ipsec
           esp/tunnel/CENTER_IP-MY_IP/require;

spdadd 10.3.4.0/24 10.3.1.0/24 any -P out ipsec
           esp/tunnel/MY_IP-CENTER_IP/require;

and start to trouble when changed to :


spdadd 10.0.0.0/8 10.3.4.0/24 any -P in ipsec
           esp/tunnel/CENTER_IP-MY_IP/require;

spdadd 10.3.4.0/24 10.0.0.0/8 any -P out ipsec
           esp/tunnel/MY_IP-CENTER_IP/require;


LALO



On Mon, 2005-05-30 at 10:46 -0700, Gary W. Smith wrote:
> I experienced a similar problem when I was doing some IPSEC stuff with
> IPTABLES under RHEL 4.  There was an issue with a TCP packet being =
locked by
> the system and in a chain and under a certain case it would attempt to =
lock
> it again.  Not sure of the complete details though.
>=20
> Anyways, after talking with some people about my problem it had to do =
with
> locking of the chain before passing it around through other chains for =
IPSEC
> where it had to traverse the same table again.  It sounds similar to =
my
> problem.  Here is the link to the RedHat bug I submitted (and was =
closed)
> some time ago. =20
>=20
> https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=3D154347
>=20
> It does require a kernel recompile as it's a kernel bug.
>=20
> Hope this helps.
>=20
> Gary Smith
>=20
>=20
> On 5/30/05 7:26 AM, "Cian Masterson" <cianm@klasonline.com> wrote:
>=20
> > Hi,
> >=20
> > I am using iptables on an Intel ixp425 (XScale/ARM processor) and am
> > finding that I get a kernel panic when I try to send large (65k) =
pings
> > to the board, or route them across the board.  Iptables is not
> > configured with any rules (see below) so all traffic is passed =
through
> > the board.  I don't see any problems with regular pings/FTP
> > transfers/etc and I have left a chain of boards passing traffic over =
the
> > weekend with no problems, however the board will always experience a
> > kernel panic within 30 seconds of me initiating large pings.  I have
> > applied the ixp425_eth_1_1_update_nf_bridge.patch patch that I got =
from
> > Intel=20
> > =
(http://developer.intel.com/design/network/products/npfamily/ixp400_osc.h=
tm)
> > to no avail.  I am running version 1.4 of Intel's software but =
before
> > anyone suggests it upgrading to 1.5 is simply not an option at this
> > point, unfortunately.
> >=20
> > If I don't insert the iptables modules the board passes large pings
> > without any problems so it is definitely a ixp425_eth.o/netfilter
> > interaction problem.  I've downloaded and searched through the =
archives
> > for this board and have found a posting from Rob Ranslam of Intel
> > stating that if I also have ebtables then I'll need an extra patch =
from
> > sourceforge, however I *don't* have ebtables so I can't see how that
> > patch would be needed in my case.  The documentation for the Intel =
patch
> > seems to relate to bridging, and I've seen posts from others who say
> > routing works but bridging doesn't but my problem definitely relates =
to
> > routing.  Has anyone seen a problem like this and/or can anyone =
offer
> > any ideas as to where I should be looking for the problem as I'm a
> > netfilter newbie?  Thanks.
> >=20
> > Slan,
> > Cian
> >=20
> > PS:  Below is the output of iptables --list for reference;
> >   root@(none):~# iptables
> > --list          =20
> >   Chain INPUT (policy
> > ACCEPT)         =20
> >   target     prot opt source
> > destination     =20
> >   =20
> >                 =20
> >=20
> >   Chain FORWARD (policy
> > ACCEPT)         =20
> >   target     prot opt source
> > destination     =20
> >   =20
> >                 =20
> >=20
> >   Chain OUTPUT (policy
> > ACCEPT)         =20
> >   target     prot opt source
> > destination     =20
> >   root@(none):~#
> >=20
> >=20
> >=20
>=20
>=20


Este e-mail y cualquier posible archivo adjunto est=E1 dirigido =
=FAnicamente al destinatario del mensaje y contiene informaci=F3n que =
puede ser confidencial. Si Ud. no es el destinatario correcto por favor =
notifique al remitente respondiendo este mensaje y elimine =
inmediatamente el e-mail y los posibles archivos adjuntos al mismo de su =
sistema. Est=E1 prohibida cualquier utilizaci=F3n, difusi=F3n o copia de =
este e-mail por cualquier persona o entidad que no sean las =
espec=EDficas destinatarias del mensaje. ANTEL no acepta ninguna =
responsabilidad con respecto a cualquier comunicaci=F3n que haya sido =
emitida incumpliendo nuestra Pol=EDtica de Seguridad de la =
Informaci=F3n.
. . . . . . . . .
This e-mail and any attachment is confidential and is intended solely =
for the addressee(s). If you are not intended recipient please inform =
the sender inmediately, answering this e-mail and delete it as well as =
the attached files. Any use, circulation or copy of this e-mail by any =
person or entity that not is the specific addressee(s) is prohibited. =
ANTEL is not responsible for any communication emitted without =
respecting our Information Security Policy.

