From: "Adem" <for-gmane@alicewho.com>
Subject: Allow client only 1 connect per 20 seconds
Date: Tue, 25 Nov 2008 19:38:38 +0100
Message-ID: <gghgq9$33t$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

How would you code this rule in iptables:

If anybody tries to do more than 1 connection to port 8191
within 20 seconds, regardless of the protocol, then DROP 
it and ignore any further connect attempts on that port
from that source for 20 seconds.


