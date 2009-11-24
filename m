From: "M. Arts - Rootnet" <marco@rootnet.nl>
Subject: Spontaneous reboot after change ip_pkt_list_tot - deb
Date: Tue, 24 Nov 2009 10:54:20 +0100
Message-ID: <1259056460.2205.75.camel@office-nmg03-v200>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I'm working on some virtual servers running debian with kernel version:
2.6.18.8.xs5.5.0.13.442.

iptables version v1.3.6.

I've been running some tests on an test server which frankly doesn't get
much traffic. I've ran the recent module with a modified maximum
hitcount which has been running without problems for several weeks.
The file I edited for this
was /sys/module/ipt_recent/parameters/ip_pkt_list_tot


However once I changed it on a live environment it soon rebooted itself
without any real indication as to why. Even changing it at all resulted
in the same problem. Now I couldn't find much of a reason for this so
I'm hoping one of you could fill me in on this or could give me a
recommendation or tip.

I've tried looking up info but frankly couldn't find any real
information other than people recommending to change it, which at this
point seems like a curious recommendation.

Thanks in advance.

