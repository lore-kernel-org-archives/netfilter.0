From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: VPN through the firewall
Date: Wed, 2 Mar 2005 14:47:16 -0800
Message-ID: <27594E8BA9D5CA458F5EF87D88B6B48F1CB5@pxtvjoexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-class: urn:content-classes:message
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
To: Marty Phee <mphee@jump-technologies.com>, netfilter@lists.netfilter.org

Marty,=20
=20
If you are NAT'ing you will need to check out the pptp conntrack modules =
which would probably require a kernel recompile.
=20
Gary Smith

________________________________

From: netfilter-bounces@lists.netfilter.org on behalf of Marty Phee
Sent: Wed 3/2/2005 2:33 PM
To: netfilter@lists.netfilter.org
Subject: VPN through the firewall



I've got a SUSE box running my home firewall and a WinXP work machine
that I use to VPN into the office network.  Before I put this SUSE 9.2
in I had a Mandrake 9.1 box that worked just fine.

Everything but my VPN connection to the office works.

I've added all kinds of rules to try to get this to work, but nothings
working.  I don't see any packets getting dropped/rejected.  It looks
like it makes the connection to the vpn server, but it's not verifying
the password.

With Ethereal I see this:
Source: 129.230.241.140
Destination: 192.168.0.73
Protocol: EAP
Info: Request, EAP-TLS [RFC2716] [Aboba]

That line just keeps repeating until it timesout with a 619 on the
windows machine.

Help would be greatly appreciated!



