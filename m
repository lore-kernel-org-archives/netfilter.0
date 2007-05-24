From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Dynamic kernel module load
Date: Thu, 24 May 2007 18:35:44 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0705241833220.31549@yvahk01.tjqt.qr>
References: <9875566032E2AE41ADB6D9CF037D312652F8F2@skyline.skld.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9875566032E2AE41ADB6D9CF037D312652F8F2@skyline.skld.net>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Harlow <pharlow@skld.com>
Cc: Netfilter Lists <netfilter@lists.netfilter.org>


On May 24 2007 10:31, Paul Harlow wrote:
>Hi all,
>
>Fedora 5 patched, i386 SMP
>
>I am looking for info on how to dynamically load a particular kernel
>module when I restart IPTables. I have firewalling rules in place for FTP
>traffic (both passive and active) however when I restart IPTables I
>notice that the module ip_conntrack_ftp does not load, I have to load it
>manually.

That is because your ruleset only depends [as in: symbols] on
iptable_filter, ip_conntrack and such, but not ip_conntrack_ftp.

>This presents a problem if someone other than myself has to
>reload firewall rules on this machine but isn't aware of the FTP
>rules/needs.
>
>Will adding the line "ip_conntrack_ftp" to the modules.conf file solve
>this problem and leave the particular module in permanently?

Adding it to /etc/sysconfig/kernel variable MODULES_LOADED_ON_BOOT
(opensuse; YMMV) will do that, yes. (modprobe.conf? I do not think
that is the right place.) Until someone manually rmmods it (,yes).


	Jan
-- 

