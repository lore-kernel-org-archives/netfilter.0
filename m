From: Yuwen Dai <yuwen.dai@windriver.com>
Subject: how to drop a TCP segment with specific sequence
Date: Thu, 9 Feb 2012 12:00:28 +0800
Message-ID: <1328760028.2710.5.camel@localhost>
Reply-To: <yuwen.dai@windriver.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Dear all,

I'm simulating an network environment that some TCP segments are
missing. So I want to use iptables to drop these segments. How to write
a rule to drop a segment with a specific sequence number from a host?
Thanks in advance.

Best regards,
Yuwen Dai

