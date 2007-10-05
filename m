From: James Lay <jlay@slave-tothe-box.net>
Subject: Interesting message
Date: Fri, 05 Oct 2007 11:51:29 -0600
Message-ID: <C32BD5C1.3419%jlay@slave-tothe-box.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

So I'm not sure how I managed to do this, but here it is:

sudo iptables -A FORWARD -s 10.0.0.0/8 -m string --string "myspace.com"
--algo bm -j DROP
iptables: match `string' v1.3.6 (I'm v1.3.8).

I'm running kernel 2.6.21.7.  Is there something I'm missing to get this to
fly?  Thanks all.

James


