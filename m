From: "Oscar N" <oscar@linnea.net>
Subject: interfaces in /proc/net/ip_conntrack
Date: Mon, 10 Dec 2007 18:49:26 +0100 (CET)
Message-ID: <26618.83.227.11.237.1197308966.squirrel@mh.linnea.com>
Reply-To: oscar@linnea.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Are the interfaces saved in any way in a session or is it only ip src, dst
and ports that are saved and matched against?

Why I ask is because what happens if I configure a linuxbox as two virtual
firewall with same nets being used on different vlans. Will all the
sessions be separate or will they sometimes "merge" if it happens to be
the same IPs and ports in two sessions.

/Oscar



