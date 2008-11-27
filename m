From: Michael Weiser <michael@weiser.dinsnail.net>
Subject: ipt_recent: negated seconds match not working
Date: Thu, 27 Nov 2008 21:58:01 +0100
Message-ID: <20081127205801.GD8942@weiser.dinsnail.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi there,

I'm trying to negate the seconds match with ipt_recent like this:

iptables -A INPUT -p tcp --dport 1234 \
        -m recent --rcheck --name LIST ! --seconds 60 --rttl \
        -j ACCEPT

This should accept packets only if the source IP is in LIST and its
entry was last updated 60 seconds ago or before. I know, this is quite
strange a thing to do, but the documentation on
http://www.netfilter.org/documentation/HOWTO//netfilter-extensions-HOWTO-3.html#ss3.16
says it should work and it doesn't. Can someone here clear this up?
-- 
bye, Micha
