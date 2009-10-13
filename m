From: whiplash <whiplash@bofhland.org>
Subject: A little question about the RATEEST target.
Date: Tue, 13 Oct 2009 18:06:37 +0200
Message-ID: <4AD4A58D.9010305@bofhland.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi.
The iptables man page states that:

RATEEST
The RATEEST target collects statistics, performs rate estimation
calculation and saves the results for later evaluation using the
rateest match.

The simple question is: where are the results saved, actually? :)
In other words, is there any way to access and collect such data
to pass them to some userspace tool, like rrdtool, for example?

Regards.
