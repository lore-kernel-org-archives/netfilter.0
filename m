From: Noino <mg8c1zu02@sneakemail.com>
Subject: Re: local NAT; reconfigured kernel, problems still
Date: Tue, 01 Apr 2008 11:40:14 +0200
Message-ID: <20080401094014.8143178C95@gam.mel.teaser.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Eljas Alakulppi wrote : 

> 1. Are you trying to redirect traffic directed to port 53 to port 10053?  
> Use REDIRECT target.  

This is overwhelming :-(  would you (collective) be so kind as to write out 
the needed rule(s) so I can leave you to rest at last ? 

>> iptables -t nat -A OUTPUT -o lo -p udp --dport 53 -j DNAT 
>> --to-destination :10053
>> iptables: Invalid argument
> 2. DNAT requires destination IP as well.

OK, if I replace an explicit --to-destination 127.0.0.1:10053 , still I'm 
getting "Invalid argument" !
Is that diag what you would get ? I suspect my iptables may be out of sync 
with my kernel, which is why I dare reiterate my question... 

TYVM 

-- 
Noino

