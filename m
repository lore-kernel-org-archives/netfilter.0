From: Chicken of the Apocalypse <satehen@btinternet.com>
Subject: iptables stop/start vs restart ...
Date: Thu, 29 Sep 2005 10:50:47 +0100 (BST)
Message-ID: <20050929095047.45779.qmail@web86503.mail.ukl.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Hi All,
 
Simple problem, although I'm sure it's been raised before and I need to search harder!
 
I've got a basic setup/configuration of iptables-1.2.11-3.1 running on 2.6.10-1.766_FC3smp with one change in the /etc/sysconfig/iptables-config file. I increase the hashsize using:
/sbin/modprobe ip_conntrack hashsize=32767.
 
If I run service iptables stop/start and then cat /proc/sys/net/ipv4/netfilter/ip_conntrack_buckets the value is 32767. If I run service iptables restart the value in the file goes back to default. I've noticed the same in a power failure scenario where the machine lost power and on reboot didn't change the hashsize.
I've had a quick look through /etc/init.d/tideway and as far as I can tell a restart just runs a stop and start. I'm assuming some sort of save/restore flag is or isn't set and this is causing the problem during a restart or power cut.
 
I need to ensure that the correct hashsize is always set. Any have any ideas?
 
Thanks
