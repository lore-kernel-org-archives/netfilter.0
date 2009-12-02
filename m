From: Lorenzo Allegrucci <lorenzo.allegrucci@forinicom.it>
Subject: match SIP & RTP packets
Date: Wed, 02 Dec 2009 23:38:07 +0100
Message-ID: <4B16EC4F.4080703@forinicom.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org
Cc: netdev@vger.kernel.org


Hi all, it's not clear to me whether nf_conntrack_sip does SIP and RTP connection
tracking or just SIP.. can you clarify?
I need to match both SIP and RTP packets and I was wondering if the rule
below would satisfy my requirements:

iptables -t mangle -A FORWARD -o eth0 -m helper --helper sip -j CLASSIFY --set-class 1:1


Thank you,
