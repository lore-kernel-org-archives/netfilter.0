From: <abcabc@home.nl>
Subject: iptables match owner not 'matching' anything?
Date: Mon, 3 Jan 2005 10:55:07 +0100
Message-ID: <00ec01c4f17a$4ef8f860$0a01a8c0@cc8273a>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

I am running iptables v1.2.11 with kernel 2.4.28 on a RH 7.3. server and =
I can't get the match owner option to actually 'match' anything.

For example, I add the following rule to iptables.
iptables -A OUTPUT -p tcp --match owner --uid-owner 503 --dport 80 -j =
DROP=20
=20
It is added to iptables without an error:
root@host [/]# iptables -L | grep dynax
DROP       tcp  --  anywhere             anywhere            OWNER UID =
match dynax tcp dpt:http

But I can still wget http://www.domain.com with this user , nothing is =
being blocked.
I did also try it as the only rule (after flushing iptables), still =
nothing.=20

I tried it with user nobody (--uid-owner 99) and have a php script =
retrieve http://www.domain.com. This wasn't blocked either.
So somehow match owner doesn't match anything it seems.

root@host [/]# iptables -V
iptables v1.2.11

root@host [/]# uname -r
2.4.28

root@host [/]# lsmod
Module                  Size  Used by    Not tainted
ipt_owner               2040   1  (autoclean)
ipt_mark                1016   0  (autoclean)
ipt_MARK                1368   0  (autoclean)
ipt_TOS                 1720   7  (autoclean)
iptable_mangle          2840   1
ip_conntrack_ftp        5008   0  (unused)
ip_conntrack_irc        3760   0  (unused)
ipt_unclean             7448   0
ipt_REJECT              4184   5
ipt_LOG                 4216  12
ipt_limit               1592  10
iptable_filter          2444   1
ipt_multiport           1304   4
ipt_state               1080  19
ip_conntrack           27080   2  [ip_conntrack_ftp ip_conntrack_irc =
ipt_state]
ip_tables              15232  12  [ipt_owner ipt_mark ipt_MARK ipt_TOS =
iptable_mangle ipt_unclean ipt_REJECT ipt_LOG ipt_limit iptable_filter =
ipt_multiport ipt_state]
ehci-hcd               21516   0  (unused)
usb-uhci               26032   0  (unused)
usbcore                77164   1  [ehci-hcd usb-uhci]
raid1                  14608   6

Does anyone know what I'm doing wrong?

