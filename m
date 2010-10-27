From: Sandro Tosi <sandro.tosi@register.it>
Subject: netfilter stats, info and resources usage
Date: Wed, 27 Oct 2010 16:42:47 +0200
Message-ID: <4CC83A67.1010202@register.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org
Cc: Jesper Dangaard Brouer <hawk@comx.dk>

Hello,
we are using quite a lot iptables and we'd like to gather some 
stats/information to "what's doing" and hopefully also an idea of the 
resources used by it (in particular cpu and ram).

Probably my google search karma is very low today, given the only 
reference to CPU usage I could find was vague refs to softirq data, and 
for stats some links like:

1. http://forums.cacti.net/about36629.html
2. http://forums.cacti.net/about26714.html
3. http://people.netfilter.org/hawk/DDoS/2010-04-12__001/list.html

3 is very interesting, Jesper: how did you generate it? :)

In general: is there a place I can look for netfilter stats and also for 
the impact it generates on the loadavg of the machine?

Regards,
Sandro

PS: please CC me, I'm not subscribed

-- 
Sandro Tosi
Product Engineer
Linux based Solutions
Hosting Products
R&D | Dada.pro
sandro.tosi@register.it
