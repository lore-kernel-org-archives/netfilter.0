From: "Barry A Rich" <barich@trisectrix.com>
Subject: Statistic module
Date: Tue, 27 Jan 2009 19:35:09 -0500
Message-ID: <004e01c980e0$470aa780$d51ff680$@com>
Reply-To: <barich@trisectrix.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I'm working with an embedded system with the 2.6.19.2 kernel. I'd prefer not
to upgrade the kernel at this time, but need features of the latest versions
of iproute and iptables. I built iptables-1.4.1.1 and iproute2-2.6.26 for
this kernel. Everything seems to work except the following:

iptables -t mangle -A PREROUTING -p udp --sport 6970 -m statistic --mode nth
--every 2 --packet 0 -j MARK --set-mark 1

It produces:

iptables: No chain/target/match by that name

I think it is not finding the statistic module.

What am I doing wrong.


