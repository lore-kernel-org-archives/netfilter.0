From: Technical Support <support@bluenorthernsoftware.com>
Subject: "new not syn" packets.. false positive?
Date: Wed, 3 Jun 2009 23:19:36 -0500
Message-ID: <200906032319.36957.support@bluenorthernsoftware.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Using Linux kernel 2.6.26 and iptables with this rule....

iptables -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j DROP

...a certain group of known reputable sites have a copious number of packets 
dropped by that rule.  A capture of a conversation with one of those sites 
via Wireshark indicated that the following was the offending packet...

TCP      [TCP Window Update] http > 58666 [ACK] Seq=1 Ack=1 Win=1049248 Len=0 
TSV=1194040538 TSER=2055704

While this group of known sites accounts for 99% of all packets stopped by 
the 'new not syn' rule above, they suggest that it's a problem in our 
firewalling or TCP.implementation.  Their sites are a client/server operation 
where remote clients connect to their servers irregularly to send and receive 
data via HTTP.  I suspect the problem  lies somewhere in their server 
software, but knowing just enough about networking to be mildly dangerous I 
can't say that with any authority.  If the above infomation is pertinent, or 
if further data from the sniffer or kernel log would be useful, please let me 
know and I'll provide what I can. Thanks in advance.

Chuck Logan
