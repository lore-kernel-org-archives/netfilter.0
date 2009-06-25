From: Ramunas Vabolis <ramuva@openoffice.lt>
Subject: raw table and NOTRACK target
Date: Thu, 25 Jun 2009 16:05:56 +0300
Message-ID: <20090625130555.GB9856@openoffice.lt>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org


	Hello there,

I'm looking after a pretty busy router. Right now everyting in
PREROUTING chain is joined to NOTRACK.:

/sbin/iptables -t raw -A PREROUTING -j NOTRACK
I need to intercept and redirect tcp http sessions. But right now I'm
stuck while trying to add exceptions to NOTRACK.

I've tried adding one test on local IP (real one) and use RETURN target:
/sbin/iptables -t raw -I PREROUTING -p tcp -s host.ip --dport 80 -j RETURN
/sbin/iptables -t raw -I PREROUTING -p tcp -d host.ip --sport 80 -j RETURN

Does not work. (Tried -j ACCEPT too). Tried creating another chain, jump
from PREROUTING to that chain and RETURN or ACCEPT in there. Same thing.
iptables -vxnL shows increase only in first rule

When I add any of these rules, tcpdump shows that packet arrives to
inner interface, but does not travel to outgoing one. 

I'm using Debian Lenny with stock packets (kernel icluding). 

What am I missing or doing wrong? From what I gather packets are 
discarded at raw table. 
