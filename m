From: "Trevor Marshall" <tmarshall@tirawireless.com>
Subject: pptp - bad csum
Date: Thu, 6 May 2004 18:26:33 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4BACC7DC3D667445A394ABB0AEEA1D08A955BB@mailer.corp.bspark.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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

Hello all, I'm hoping someone can help us here; I've been wrestling with =
the pptp nat patch all day and have a hit wall.
I'm running a straight RH9 install with Shorewall and have patched the =
latest vanilla kernel 2.2.26 with latest patch-o-matic-ng from CVS. I =
got iptables straight out of CVS as well, so as to try to ensure =
compatibility across the board. It's version 1.2.10.
Patch went fine, kernel compiled and installed fine, and after a reboot =
I made iptables again and it installed ok.=20
I started Shorewall up and all the rules work great and the 4 pptp/gre =
modules are loaded. The vpn is busted now though; while before it worked =
with one connection now it's hosed.
When I attempt to connect to the pptp server the client hangs on =
username verification and all I see in my logs is the following:

May  6 17:42:34 localhost kernel: ip_conntrack_pptp.c: bad csum

Of course I googlied this right away, and found some folks who'd had =
similar experiences but no luck resolving it. My best guess is =
incompatibility with kernel/patch/iptables versions. Can anyone suggest =
perhaps an older combination of tarballs that worked for them?=20

thanks, and regards
Trevor Marshall

