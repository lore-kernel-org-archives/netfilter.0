From: "David Leangen" <dleangen@canada.com>
Subject: RE: /etc/sysconfig/iptables does not load on reboot
Date: Mon, 4 Jul 2005 23:54:57 +0900
Message-ID: <NEBBKBPLMLNABNADCIPAGEGMBDAB.dleangen@canada.com>
References: <200507040937.25404.rob0@gmx.co.uk>
Reply-To: dleangen@canada.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200507040937.25404.rob0@gmx.co.uk>
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


> Firewall loads before mount -a; probably at that point only the
> root filesystem is mounted. If the match extensions are on /usr,
> we can't get to them. I bet badhost has a separate /usr partition
> and goodhost has /usr on the rootfs.

Well, it's true that /usr is mounted on a different partitition, but this is
the case for both goodhost and badhost.

Indeed, this is how I mounted my partitions on badhost:

Filesystem           Mounted on
/dev/hda2            /
/dev/hda1            /boot
/dev/hda8            /home
/dev/hda6            /tmp
/dev/hda3            /usr
/dev/hda7            /var

And this is goodhost:

/dev/sda2             /
/dev/sda1             /boot
/dev/sda3             /data
/dev/sda5             /home
/dev/sda8             /tmp
/dev/sda7             /usr
/dev/sda9             /var
/dev/sda10            /var/lib/pgsql


> If so, yes, this is an OS bug. And don't just write set to a file,
> do "mount > /root/firewall-mounted-fs" too. (I hope /root isn't a
> symlink or otherwise on a different FS.)

Sorry, I don't follow this last bit...

Thanks so much for helping me through this!!!

:-)



