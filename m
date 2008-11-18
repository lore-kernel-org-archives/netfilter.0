From: "John Lister" <john.lister@kickstone.co.uk>
Subject: SNAT with ip address range not working...
Date: Tue, 18 Nov 2008 14:50:57 -0000
Message-ID: <8FC72664318547708851AFDCFB7B1721@squarepi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@vger.kernel.org

Hi, i'm trying to set up a rule to snat over a range of ip addresses with
something like this:

iptables -t nat -A POSTROUTING -m state --state NEW -j SNAT --to-source 
192.168.96.34-192.168.96.136

however after dumping the packets, it seems that only the first address is 
ever used and the rule is being matched correctly

In the docs it mentions that it selects an address in the range at random 
for a stream - i'm assuming for netfilter a stream is a single connection 
and each subsequent connection should get a new ip address, or does it group 
similar connections to/from the same ip addresses and give it the same ip 
address - which happens with routing (cache)?

I've bound the additional ip addresses to the ethernet device using "ip add 
addr ..." and if i use the statistics module and create separate rules for 
each ip address in the SNAT range, it works fine. Obviously this results in 
a much bigger ruleset and is harder to manage.

Any ideas?

Thanks

--

Got needs? Get Goblin'! - http://www.pricegoblin.co.uk/ 

