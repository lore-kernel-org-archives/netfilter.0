From: R Keith Beal <r@CMSS.com>
Subject: Ingress filter issue with pedit
Date: Tue, 11 Jul 2023 14:28:24 -0700
Message-ID: <c363df6b-38cd-c55a-c5ec-0152ac6cac37@CMSS.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

Netfilter Users,

I am trying to prioritize traffic from specific IP addresses by using an 
ingress filter to set the TOS filed with a pedit action.
In my simple test, I try to set the TOS to 15.
The commands I use are as follows...

sudo tc qdisc add dev wlan0 handle ffff: ingress
sudo tc filter add dev wlan0 protocol ip parent ffff: u32 match ip src 
10.0.1.99/32 action pedit ex munge ip dsfield set $((15 << 2)) retain 
0xfc action pass

This results in all traffic from the IP being dropped.

I deleted the ingress qdisc and re-added it then added a filter with 
just the pass action.
The packets go through.

sudo tc filter add dev wlan0 protocol ip parent ffff: u32 match ip src 
10.0.1.99/32 action pass
pi@GW-13:~ $ tc -p -s -d filter show dev wlan0 parent ffff:
filter protocol ip pref 49152 u32 chain 0
filter protocol ip pref 49152 u32 chain 0 fh 800: ht divisor 1
filter protocol ip pref 49152 u32 chain 0 fh 800::800 order 2048 key ht 
800 bkt 0 terminal flowid ??? not_in_hw
   match IP src 10.0.1.99/32
         action order 1: gact action pass
          random type none pass val 0
          index 1 ref 1 bind 1 installed 6 sec firstused 6 sec
         Action statistics:
         Sent 2710836 bytes 1917 pkt (dropped 0, overlimits 0 requeues 0)
         backlog 0b 0p requeues 0

This seems to indicate the problem is with the pedit action.
Or am I missing something?

hanks in advance,
Keith

-- 
*R Keith Beal*
Distinguished Engineer
CMSS
949 932-0359
603 391-2847 Cell
r.keith.beal Skype
www.linkedin.com/in/rkeithbeal <http://www.linkedin.com/in/rkeithbeal>
