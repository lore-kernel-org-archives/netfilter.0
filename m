From: Dustin Marquess <jailbird@alcatraz.fdf.net>
Subject: Problem with pptp patch
Date: Mon, 30 Jun 2003 23:54:09 -0500 (CDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.55.0306302348500.1549@bobdole.alcatraz.fdf.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

All,

I've been trying to ugprade my router/AP running 2.4.19 to 2.4.21.  With
2.4.19 I was running Brian Kuschak's PPTP patch.

With 2.4.21 I've tried both the newnat patch from
http://roeder.goe.net/~koepi/newnat.html and the pptp patches in
patch-o-matic-20030630.

Both apply cleanly and compile without errors.  Both work and allow the
client to sucessfully make and use a PPTP connection.  The problem comes
that when the PPTP connection is terminated, the masq machine completely
hard-locks.  I can't ping it from any machine as soon as I terminate my
PPTP connection on my client.

I believe the kernel is Oops'ing, although I don't have a console on it
to verify.  I'll try to get a serial console setup in the morning to
verify.

The machine is an AMD Duron 800Mhz.  The kernel was compiled with gcc
2.95.3.  The kernel was a stock 2.4.21 kernel with either the newnat
patches or the patch-o-matic patches.  The only other patch applied was
a patch to upgrade the wireless extensions support from 15 to 16.  I can
try removing this patch, although I don't believe it is the cause of
the problem, since I'm not even using an 802.11b machine to establish
the PPTP connection.

The PPTP client was a Windows Server 2003 machine, and the PPTP server
was a Cisco 3030 VPN Concentrator, if that helps at all.

Thanks!
-Dustin


