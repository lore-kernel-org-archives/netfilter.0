From: Buddy wu <ejournal4me@gmail.com>
Subject: why can't use connlimit ??
Date: Fri, 28 Oct 2005 14:19:17 +0800
Message-ID: <43a0cdcb0510272319m69a7a1d4g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

   I want to use connlimit to set the connections of each person to a
certain number, but when I add a rule using iptables, error occured
like these:

[root@server1 linux]# /sbin/iptables -A INPUT -m connlimit
--connlimit-above 6 -j DROP
iptables: No chain/target/match by that name

   I have searched for this problem, someone said it maybe need to
load the ipt_connlimit module. I tried it, but it can not work. I
doubted that I have the wrong command.
   first I use '/sbin/modprobe ipt_connlimit' command ,and then I
reaceive the error 'FATAL: Module ipt_connlimit not found.'
   second, I use '/sbin/modprobe /lib/iptables/libipt_connlimit.so'
and then error comes again 'FATAL: Module
/lib/iptables/libipt_connlimit.so not found.'

   How to make it work ? I'm almost mad

Thank for your advise

