From: bossk <bossk@tyntec.biz>
Subject: Performance question for chains
Date: Wed, 12 Mar 2008 20:24:55 +0100
Message-ID: <200803122024.56217.bossk@tyntec.biz>
Reply-To: bossk@tyntec.biz
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I have a lot of FORWARD rules to the same IPs and handfull different ports and 
I try to increase the overall performance. I have the following ruleset in my 
mind to achieve this goal,

iptables -A FORWARD -d 10.0.0.1 -j next
iptables -A next -p TCP --dport 111 -j next2
iptables -A next2 -s 10.7.0.1 -j ACCEPT

This means that I have to traverse 2 chains and than the next2 chain for 
finding the right IP. If the sender sends another packet the packet has to 
traverse the same chains again. If I instead do a

iptables -A FORWARD -d 10.0.0.1 -m conntrack --ctstate ESTABLISHED -j ACCEPT
iptables -A FORWARD -d 10.0.0.1 -j next
iptables -A next -p TCP --dport 111 -j next2
iptables -A next2 -s 10.7.0.1 -m conntrack --ctstate NEW -j ACCEPT

The following packets just traverse the first rule. 

My question now is are there any drawbacks to do it this way? Or is there 
another more convenient way to do it?

Thanks,
bossk
