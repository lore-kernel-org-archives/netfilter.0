From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: wherr to find and how to install ip_conntrck_pptp and ip_nat_pptpmodules
Date: Wed, 11 Aug 2004 09:07:49 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC905126A@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> I am trying to enable a multiple VPN tunnels to pass through my Linux
> machine so that VPN clients on the LAN can access the VPN server on =
the WAN.
> Through my google search I found there are two modules required to =
enable
> this functionality on my Linux box, these modules should be loaded in =
the
> kernel. So any body can help and direct me where to find these two =
modules
> and how can I install them?

the pptp-conntrack-nat is part of POM in the "extra" suite.  if you're =
running RH9, you won't have much luck with pom-ng, but you should be =
able to patch/compile from the older pom located at:

	http://netfilter.org/files/patch-o-matic-20031219.tar.bz2

read the README, and have at it.

> I am expecting you urgent help regarding this matter

i hope this was fast enough...  jeez--gettin' a little pushy on this =
list these days.  might have to invite some folks from openbsd-misc to =
"work the door."  ;-)

-j

