From: "John Ratliff" <jratliff@bluemarble.net>
Subject: nf_conntrack_max
Date: Wed, 31 Aug 2016 18:15:55 -0400
Message-ID: <000e01d203d5$3e576d00$bb064700$@bluemarble.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

What are the implications of raising net.ipv4.netfilter.ip_conntrack_max?

I have a pair of firewalls in an active/passive failover setup (using
keepalived and conntrackd) that I want to use to NAT several services
behind. When I added DNS yesterday, I quickly exceeded the default 65536
value. It never appeared to exceed 85000, so I simply doubled it for the
time being.

When I was reading about this online, there were many suggestions for
putting DNS servers outside the firewall. I am ambivalent about this
solution. It will work, but it will require me to duplicate many rules from
my main firewall to the packet filter on the individual DNS servers that I
Would prefer not be duplicated.

Would there be a serious performance penalty to simply raising the
conntrack_max value to 256k, 512k, or 1024k? Is it best to try and avoid
large connection tracking tables like this? I do not know what my average
table would be, but I would expect 100k from the data I have so far.

Thanks.

--John


