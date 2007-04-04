From: spaminator@web.de
Subject: Debian 2.6.8/bridge/iptables/passive ftp
Date: Wed, 04 Apr 2007 12:18:06 +0200
Message-ID: <361462969@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hi out there,

thanks for your replies.

@Ray
I already stumbled over http://slacksite.com/other/ftp.html and built my ruleset accordingly. As far as I understand you should be able to cater just for passive ftp.

@Arnd-Hendrik
I am not opening the high ports on the ftp server box. The (passive) ftp client sends the first request from a highport to port 21 on the server box. Have a look at the diagrams at slacksite. Which helper module do you refer to?

@Martijn
Your hint pointing to ip_conntrack_ftp lead to the solution. lsmod showed me that the module had not been loaded. After loading my ruleset worked and the clients could ftp properly.

Rebooting the bridge box left me again with an unloaded ip_conntrack_ftp. So I made an entry in /etc/modules which caters for the module to be loaded on (re)boot. Strange thing that, because other modules related to iptables are being loaded automatically, although they are not compiled into the kernel too. Are there other "surprise"-modules that have to be loaded via /etc/modules?

cu
Jo

_______________________________________________________________
SMS schreiben mit WEB.DE FreeMail - einfach, schnell und
kostenguenstig. Jetzt gleich testen! http://f.web.de/?mc=021192


