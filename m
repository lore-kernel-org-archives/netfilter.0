From: "Dennis J." <dennisml@conversis.de>
Subject: NOTRACK not working
Date: Tue, 26 Jan 2010 19:38:47 +0100
Message-ID: <4B5F36B7.5010004@conversis.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,
For a while now I excluded two IPs on my firewall from connection tracking 
which works very well. Now I tried adding another IP but that doesn't seem 
to work. I added the following rules:

iptables -t raw -A PREROUTING -s 192.168.10.10 -j NOTRACK
iptables -t raw -A PREROUTING -d 192.168.10.10 -j NOTRACK

Yet when I look in /proc/net/ip_conntrack I still see 192.168.10.10 using 
up most of the entries.
Is there something else that needs to be done to exclude this IP completely 
from the connection tracking table?

Regards,
   Dennis
