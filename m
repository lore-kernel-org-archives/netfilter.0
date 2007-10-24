From: Mike -- EMAIL IGNORED <m_d_berger_1900@yahoo.com>
Subject: iptables and openvpn bridge
Date: Wed, 24 Oct 2007 21:05:05 +0000 (UTC)
Message-ID: <ffoc21$bju$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I run openvpn on a linux (FC7) box with an
ethernet bridge.  As specified at
  http://openvpn.net/bridge.html
I set iptables thus:
   iptables -A INPUT -i tap0 -j ACCEPT
   iptables -A INPUT -i br0 -j ACCEPT
   iptables -A FORWARD -i br0 -j ACCEPT
Now it works, but this opens up much more
on the host machine than I want.  But I
do not understand the paths so that I can
know how to add additional restriction.

Can someone direct me to further relevant
documentation?

Thanks,
Mike.

