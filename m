From: Michael Deegan <michael@deegan.id.au>
Subject: wiki documentation error
Date: Sun, 25 Jun 2023 14:45:21 +0800
Message-ID: <ZJfigQmqgt3X5pnW@deegan.id.au>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

(please CC me on replies, I'm not subscribed)

It looks like I'm the first to attempt cutting and pasting the ruleset from
https://wiki.nftables.org/wiki-nftables/index.php?title=Simple_ruleset_for_a_home_router,
as it...doesn't work. :P

The main problem is this line:

   ip protocol . th dport vmap { tcp . 22 : accept, udp . 53 : accept, tcp . 53 : accept, udp . 67 : accept}

I worked out that there are far too many spaces in the line (for one thing
it looks like you can never have a space before a colon), but I have yet to
work out what was intended by "ip protocol . th dport".

-MD (attempting to make the iptables to nftables transition)

-- 
-----------------------------------------------------------------------------
Michael Deegan               Hugaholic              https://www.deegan.id.au/
------------------------  Jung, zr jbeel?  ----------------------------------
