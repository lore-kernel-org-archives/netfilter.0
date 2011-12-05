From: "U.Mutlu" <for-gmane@mutluit.com>
Subject: [iptables] misleading print
Date: Mon, 05 Dec 2011 16:26:30 +0100
Message-ID: <jbinrb$2l7$1@dough.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I have in my script these statements:
   iptables -A INPUT  -i lo -j ACCEPT
   iptables -A OUTPUT -o lo -j ACCEPT

When doing "iptables -L -n" then the above gets shown as this:
   ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0

IMHO, this could easily be misinterpreted if one looks
only at the iptables output, because the crucial info,
ie. that it applies to the "lo" device only, is missing...

Right?

