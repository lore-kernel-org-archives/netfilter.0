From: "news.gmane.org" <seandarcy2@gmail.com>
Subject: DNAT to a specific interface?
Date: Mon, 10 Nov 2008 13:34:46 -0500
Message-ID: <gf9us7$pub$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I have a multihomed server. eth0 for internal NAT, eth1 for default 
internet, and eth3 for VOIP.

VOIP comes into the server with dport set to 19999. What I'd like to do 
is have all those VOIP packets set to a real VOIP port ( which I think I 
can figure out ) and go out eth3. I can't set up a static route going 
out eth3 since the SIP proxies are dynamic, so they don't have a fixed 
ip address.

So:

iptables -t nat -A POSTROUTING -i eth0 -p udp --dport 19999 -j DNAT --to 
:5469
iptables -t nat -A PREROUTING  -i eth3 -p udp --dport 5469  -j DNAT --to 
:19999

would change the port, but how can I tell it to use interface eth3?

sean

