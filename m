From: Tom <tom@t0mb.net>
Subject: hex string matching at a negative offset from the end of the packet
 payload
Date: Tue, 29 Jan 2013 10:10:16 +0000
Message-ID: <5107A008.90806@t0mb.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Greetings,

I'm trying to match DNS ANY type queries and rate limit them with 
iptables.  An imperfect way of doing this is in use at the moment:

-A INPUT -p udp -m udp --dport 53 -m string --hex-string "|0000ff0001|" 
--algo bm --from 50 --to 65535 -m recent --set --name dnsanyqueryudp 
--rsource
-A INPUT -p udp -m udp --dport 53 -m string --hex-string "|0000ff0001|" 
--algo bm --from 50 --to 65535 -m recent --rcheck --seconds 60 
--hitcount 100 --name dnsanyqueryudp --rsource -j ANYRATELIMIT

What I want is a way of checking the byte which is at a negative offset 
from the end of the payload, so I can match only the byte I need.  Is 
there any mechanism at all by which I can do this?

It's annoying that the query type always comes after the variable length 
query in DNS!

Thanks for any help.

Tom.
