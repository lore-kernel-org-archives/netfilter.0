From: Knute Johnson <knute2008@www.knutejohnson.com>
Subject: UDP netbios nameserver packets blocked
Date: Mon, 08 Dec 2008 16:39:46 -0800
Message-ID: <493DBE52.1010003@www.knutejohnson.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I have the following line in my iptables configuration;

-A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

When I use the smbclient command, it attempts a DNS lookup, which fails 
as it should, then does a netbios nameserver lookup.  The response is 
getting blocked with the last line in my configuration;

-A INPUT -j REJECT --reject-with icmp-host-prohibited

I can make it work if I put in the following;

-A INPUT -p udp --sport 137 -j ACCEPT

but I thought the top line should have allowed the response to pass 
through.  It is coming back on the same port as it was sent on.

Any insight would be appreciated.

Thanks,

-- 

Knute Johnson
knute2008@www.knutejohnson.com

