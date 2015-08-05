From: Doug Applegate <dapplegate@cradlepoint.com>
Subject: One to One port range forwarding to different port range
Date: Wed, 5 Aug 2015 10:49:44 -0600
Message-ID: <55C23EA8.8020905@cradlepoint.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

After testing and looking at the kernel source, I realize that this mapping:

iptables -t nat -I PREROUTING -p tcp -m tcp --dport 30000:40000 -j DNAT 
--to [local_ip]:10000-2000

Doesn't do a one-to-one port mapping
e.g.:
100.0.0.1:30000 > 192.168.0.5:10000
100.0.0.1.30001 > 192.168.0.5:10001
100.0.0.1.30002 > 192.168.0.5:10002

I was wondering if it was possible to do the 1:1 port range forwarding 
to different port ranges or if you have to use individual rules.

Thanks

Doug
