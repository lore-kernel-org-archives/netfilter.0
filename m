From: Andreas Herz <andi@geekosphere.org>
Subject: PolicyBasedRouting with two IPv6 WAN uplinks without NAT possible?
Date: Thu, 16 Jul 2015 10:44:21 +0200
Message-ID: <20150716084421.GU21348@kvmbude>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

We discussed the following scenario:

Linuxrouter with two IPv6 WAN connections and behind the Linuxrouter
several clients which got IPv6 IPs assigned from both lines. Let's say
primay WAN is 2001:db8:1001: and secondary WAN is 2001:db8:2002: and
with that the client got assigned 2001:db8:1001::abcd and
2001:db8:2002::abcd.

Now there should be a policy based routing for http protocol active on
the router to send every http stuff through the 2nd WAN connection. So
default is the 2001:db8:1001: but for http 2001:db8:2002: should be
used.

When the client send HTTP requests he will use 2001:db8:1001::abcd as
his default IP, so without NAT there is (AFAIK) no way to send the HTTP
traffic through the 2nd line since this IP is not valid for that.
With NAT i could change the source IP according to the policy based
rule.

I didn't found a working implementation that tells the client which
source IP to use based on the protocol/policy based routing decision on
the router.

So either the router needs to modify the request to suit the need which
means NAT or the client needs to choose the other IP which means he
needs to know this information.

Would you suggest to _use_ NAT in such an usecase or do you know a
better solution i hadn't seen yet?

Thanks

-- 
Andreas Herz
