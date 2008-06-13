From: Maxim Britov <maxim.britov@gmail.com>
Subject: iptables 1.4.1 + iprange fails for me
Date: Fri, 13 Jun 2008 09:02:36 +0300
Message-ID: <20080613090236.417411cd@maxim.office.modum.by>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: netfilter-devel@vger.kernel.org

I updated yesterday kernel + iptables on my router (into Internet) box.
Kernel from kernel.org 2.6.25.6 + iptables 1.4.1-1 from fedora rawhide.
I'm use kernel without modules on that box.

I found troubles with iprange:
# iptables -A INPUT -m iprange --src-range 1.1.1.1-2.2.2.2 -j DROP
# iptables-save |fgrep range
-A INPUT -m iprange -j DROP

iptables -L -n show it as:
DROP       all  --  0.0.0.0/0            0.0.0.0/0           



-- 
Maxim Britov

GnuPG KeyID 0x4580A6D66F3DB1FB              xmpp:maxim@modum.by
Fingerprint:  4059 B5C5 8985 5A47 8F5A 8623 4580 A6D6 6F3D B1FB
GnuPG-ru Team (http://lists.gnupg.org/mailman/listinfo/gnupg-ru
               xmpp:gnupg-ru@conference.jabber.ru)
