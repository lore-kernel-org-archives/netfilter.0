From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: FTP and IPSEC
Date: Fri, 1 Jul 2005 10:12:25 -0700
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE582909ED0@pxtbenexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: "Gary W. Smith" <gary@primeexalia.com>, netfilter@lists.netfilter.org

Any ideas?

________________________________

From: netfilter-bounces@lists.netfilter.org on behalf of Gary W. Smith
Sent: Tue 6/28/2005 10:06 AM
To: netfilter@lists.netfilter.org
Subject: FTP and IPSEC



This is a follow up to a former problem, but unreleated.

I have two networks conencted via IPSEC.  On each side of the network I =
have client servers that have SNAT/DNAT to the internet.  Everything =
seems to work well under ISPEC except ftp.  Here is what I found.

From location A, a workstation without a static external IP address on =
the 10.0.10.x can FTP anywhere on the net without problems but CANNOT =
ftp to a machine at location B using it's internal 10.0.50.x IP.  This =
same workstation CAN ftp without restriction to it's external alias for =
the same machine at location B using it's external IP 199.199.199.x

If I remove ip_nat_ftp and ip_conntrack_ftp it seems to work fine.  But =
the problem is now that we cannot ftp externally from that location.  =
Both locations have ip_nat_ftp loaded but it doesn't seem to matter.

When we had a pptp connection between the two locations we didn't have =
this problem.  It only seems to happen with IPSEC.=20

Is there a workaround for this or is there a way to tell ip_nat_ftp to =
ignore a particular IP range?

Gary Smith


