From: Marcel de Boer <marceldb@luon.net>
Subject: FTP large file problem
Date: Thu, 17 Jul 2003 19:52:46 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0307171941591.549-100000@sun.shark.demon.nl>
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

Hello everybody,

for my home network I have built a Linux-based firewall (based on the
slackware-built 2.4.21 kernel). The firewall is working fine, except for
large FTP downloads. After 13.68MB (sometimes a bit more, sometimes a bit
less, but most of the time 13.68) the connection just hangs. The control
channel is still active, because I can abort the download and start it
again, but it never gets beyond 14MB.

I have tried this with multiple servers (ftp.kpn.be and ftp.slackware.no),
multiple local computers (two Slackware-based, one Debian-based) and
multiple clients (ncftp and lftp), and the problem returns in all
situations (even when downloading directly to my firewall machine).

I strongly suspect the firewall, but I can't imagine what I have done
wrong (especially because a very similar configuration based on the same
framework at my work does not have this problem).

TIA && Gtnx
	Marcel de Boer

PS. Please also Cc a reply to me, because I am not on the list.


