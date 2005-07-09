From: "David Leangen" <dleangen@canada.com>
Subject: RE: /etc/sysconfig/iptables does not load on reboot
Date: Sun, 10 Jul 2005 01:20:07 +0900
Message-ID: <NEBBKBPLMLNABNADCIPAAEEJBEAB.dleangen@canada.com>
References: <NEBBKBPLMLNABNADCIPAGEGMBDAB.dleangen@canada.com>
Reply-To: dleangen@canada.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <NEBBKBPLMLNABNADCIPAGEGMBDAB.dleangen@canada.com>
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
To: netfilter@lists.netfilter.org


Thanks again for all the support so far...

> > Firewall loads before mount -a; probably at that point only the
> > root filesystem is mounted. If the match extensions are on /usr,
> > we can't get to them. I bet badhost has a separate /usr partition
> > and goodhost has /usr on the rootfs.

Actually, I don't believe this is the case. Also, I don't believe (no 100%
confirmation) that the kernel version makes a difference, so I doubt this is
a kernel bug, at least the way you suggested.

After a lot of playing around, I was finally able to figure out when the
problem occurs.

As long as I do not set up an ADSL connection using adsl-setup, everything
works fine. However, after having setup my connection, that's when my
firewall goes wack. The same is true whether or not the cable is actually
plugged in. This happens after having run adsl-setup.


Any ideas why setting up an ADSL connection would cause problems? Any ideas
how to work around this?


Again, thank you for all the help!!!

Dave



