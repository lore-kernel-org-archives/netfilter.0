From: =?ISO-8859-1?Q?Ren=E9_Gallati?= <draxinusom@gmail.com>
Subject: Re: vpn
Date: Wed, 15 Sep 2004 10:42:36 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <50f03b970409150142291aaa96@mail.gmail.com>
References: <012a01c49a61$340e8ad0$49caa8c0@caris.priv>
	<1095172947.2055.33.camel@localhost>
	<20040914160735.GP26823@metastasis.org.uk>
Reply-To: =?ISO-8859-1?Q?Ren=E9_Gallati?= <draxinusom@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040914160735.GP26823@metastasis.org.uk>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: Netfilter Mailing List <netfilter@lists.netfilter.org>
Cc: Nick Drage <nickd@metastasis.org.uk>

On Tue, 14 Sep 2004 17:07:35 +0100, Nick Drage <nickd@metastasis.org.uk> wr=
ote:
> On Tue, Sep 14, 2004 at 10:42:27AM -0400, John A. Sullivan III wrote:
> > On Tue, 2004-09-14 at 09:46, Peter Marshall wrote:
>=20
> <snip>
>=20
> > I would suggest an IPSec VPN using either the native IPSec stack in the
> > latest Linux or either StrongSWAN (www.strongswan.org) or OpenSWAN
> > (www.openswan.org) and placing access control and VPN on the same
> > device.  That is how we design most devices for use in the ISCS project
> > (http://iscs.sourceforge.net).
>=20
> Reading "Network Security Hacks" recently I liked the look of VTun.  Any
> thoughts on that?  How does it interface with IPTables?

As far as I know openvpn uses it
(http://openvpn.sourceforge.net/index.html) It is fairly easy to
install and far more flexible and robust if one or both sides of the
tunnels have dynamic ip addresses. I've used FreeSwan for some years
and always had stability troubles when one side went down but the
tunnel wasn't properly terminated on the other side and such things.
I've switched to openvpn after the removal of the ipsec pseudodevices
which made my firewall rules unusable.

Now with openvpn you again have a device per tunnel on which you can
easily filter as before with ipsecN, just now they are called tunN
and/or tapN (depending on which type of tunnel you want)

You can furthermore do some things that ipsec cannot or are very
difficult. Using the tap's it emulates a virtual network card, so you
have arp running over it. You can easily do dhcp over taps and
furthermore broadcasts and multicast simply works over these pseudo
devices. It's just like both ends of the vpn have an additional nic
that is directly connected to each other.

I currently use it in a project where many peers connect to one vpn
server which then bridges together all these vpn endpoints and thus
creates one big "lan" segment where the peers can communicate to each
other mainly using broadcast and multicast. (it's a network testbed
for multihop routing protocols)

--=20
C U

     - -- ---- ----- -----/\/  Ren=E9 Gallati  \/\---- ----- --- -- -

