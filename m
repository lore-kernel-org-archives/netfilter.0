From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: vpn
Date: Wed, 15 Sep 2004 07:37:41 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095248261.2070.137.camel@localhost>
References: <012a01c49a61$340e8ad0$49caa8c0@caris.priv>
	<1095172947.2055.33.camel@localhost>
	<20040914160735.GP26823@metastasis.org.uk>
	<50f03b970409150142291aaa96@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <50f03b970409150142291aaa96@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="macroman"
To: =?ISO-8859-1?Q?Ren=E9?= Gallati <draxinusom@gmail.com>
Cc: Nick Drage <nickd@metastasis.org.uk>, Netfilter Mailing List <netfilter@lists.netfilter.org>

On Wed, 2004-09-15 at 04:42, Ren=C3=A9 Gallati wrote:
<snip>
> As far as I know openvpn uses it
> (http://openvpn.sourceforge.net/index.html) It is fairly easy to
> install and far more flexible and robust if one or both sides of the
> tunnels have dynamic ip addresses. I've used FreeSwan for some years
> and always had stability troubles when one side went down but the
> tunnel wasn't properly terminated on the other side and such things.
> I've switched to openvpn after the removal of the ipsec pseudodevices
> which made my firewall rules unusable.
>=20
> Now with openvpn you again have a device per tunnel on which you can
> easily filter as before with ipsecN, just now they are called tunN
> and/or tapN (depending on which type of tunnel you want)
>=20
> You can furthermore do some things that ipsec cannot or are very
> difficult. Using the tap's it emulates a virtual network card, so you
> have arp running over it. You can easily do dhcp over taps and
> furthermore broadcasts and multicast simply works over these pseudo
> devices. It's just like both ends of the vpn have an additional nic
> that is directly connected to each other.
>=20
> I currently use it in a project where many peers connect to one vpn
> server which then bridges together all these vpn endpoints and thus
> creates one big "lan" segment where the peers can communicate to each
> other mainly using broadcast and multicast. (it's a network testbed
> for multihop routing protocols)
OpenVPN does look like a very flexible technology.  We are very
interested in integrating other forms of VPN besides IPSec with iptables
in the ISCS project including OpenVPN.  As a slight aside, is anyone
interested in working on the OpenVPN module for ISCS (or SSL for that
matter)? The idea is that someone can describe their environment and
ISCS will go out and create and automatically distribute rule sets and
configurations that will make iptables and whatever VPN method work
together to provide a secure communications system.  An introduction is
available at http://iscs.sourceforge.net Thanks - John
--=20
John A. Sullivan III
Open Source Development Corporation
Financially sustainable open source development
http://www.opensourcedevel.com


