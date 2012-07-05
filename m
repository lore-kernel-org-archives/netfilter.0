From: Michael Vallaly <netfilter@nolatency.com>
Subject: IPSet Interface Matching
Date: Thu, 5 Jul 2012 16:19:58 -0500
Message-ID: <20120705161958.aa3403ffc39ac5c4e041fa1d@nolatency.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


Hello all,

Not sure if this is a known issue/feature request for ipset and/or
iptables not: 

Using ipset + iptables as follows:

<snip>
ipset create newset hash:net,iface
ipset add newset 192.168.0.0/24,eth+
 
ipset -L newset

Name: newset
Type: hash:net,iface
Header: family inet hashsize 1024 maxelem 65536 
Size in memory: 17360
References: 1
Members:
192.168.0.0/24,eth+

iptables -I INPUT -m set --match-set newset dst,src -j ACCEPT

</snip>

I was expecting the above set match line to to be equivalent to:

"iptables -I INPUT -i eth+ -d 192.168.0.0/24 -j ACCEPT"

The rule set doesn't seem to match the interface names as I would
expect (trying to match multiple eth adapters). 

Iptables docs seems to indicate 'If the interface name ends in a "+",
then any interface which begins with this name will match.'

Is this expected behavior? 

If I manually add each interface (ie: eth0,eth1,ethN) to the ipset it
seems to work, but seems less than ideal. 

Thanks for your time.

-Mike

-- 
Michael Vallaly <netfilter@nolatency.com>
