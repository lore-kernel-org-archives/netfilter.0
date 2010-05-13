From: Markus Feldmann <feldmann_markus@gmx.de>
Subject: iptables NEW or SYN
Date: Thu, 13 May 2010 19:08:47 +0200
Message-ID: <hshbmv$547$1@dough.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi All,

i am still experiment with iptables and the state extension. Some of my 
rules shall catch packets with the state NEW, but it doesn't catch all 
packets. Sometimes there are packets that have the SYN Flag set which go 
through my rules with the state NEW.

Any idea why?
I thought SYN is included in the state NEW, is that wrong?

What is the difference between SYN and NEW?

regards Markus

