From: <aletum@lavabit.com>
Subject: RATEEST pps precision is unacceptable
Date: Fri, 14 Oct 2011 15:53:11 +0000
Message-ID: <20111014155311.0e764f16@wwwwww-701SD>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Since -m limit didn't provide sufficient precision, I took RATEEST for a spin and I discovered that it's precision is just as much unreliable.
Ruleset was simple:

iptables -N log_and_drop
iptables -A log_and_drop -j LOG --log-prefix DROPPING_OVERFLOW
iptables -A log_and_drop -j DROP

iptables -t mangle -A POSTROUTING -m state --state NEW -j RATEEST --rateest-name myrateest  --rateest-interval 50ms --rateest-ewmalog 100ms
iptables -t mangle -A POSTROUTING -m state --state NEW -j LOG --log-prefix ACCEPTED

iptables -A OUTPUT -m state --state NEW -m rateest --rateest myrateest --rateest-gt --rateest-pps 1 -j log_and_drop
iptables -A OUTPUT -m state --state NEW -j NFQUEUE --queue-num 11220

THE NFQUEUE 11220 queue handler always issued NF_ACCEPT on the packets. Such packets get into the -t mangle POSTROUTING chain. I could see that in the LOGs.

My application constantly generates 30+ new connections per second.
I ran it for a minute and observed the amount of packets that hit NFQUEUE 11220.
Here is the table of the actual results depending on --rateest-pps
--rateest-pps 1 --> actual 7 pps
--rateest-pps 3 --> actual 9 pps
--rateest-pps 5 --> actual 11 pps
--rateest-pps 6 --> actual 12 pps
--rateest-pps 10 --> actual 15 pps

So basically the precision was always off by 5-6 pps.
There are no CPU/network intensive processes running apart from the test. In fact barely anything was running.
The only consoling news is that the error margin seems to be constant.
Could somebody please offer a word of comfort?

