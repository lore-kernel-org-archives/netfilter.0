From: Elvar <elvar@elvar.org>
Subject: was there a syntax rule change regarding the use of '!'
Date: Wed, 29 Aug 2012 11:08:08 -0500
Message-ID: <503E3E68.9040703@elvar.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

I just deployed by first Ubuntu 12.04 install and I was seeing errors in 
my typical iptables script. I found that I had to change the order of 
where I placed my '!' in the rule. For example...

OLD -> iptables -A FORWARD -i eth1 -s ! 192.168.42.0/24 -j DROP
NEW -> iptables -A FORWARD -i eth1 ! -s 192.168.42.0/24 -j DROP


I don't see anything about this in the changelog so I was just wondering 
if anyone else has seen this as well.

Thanks,
Elvar

