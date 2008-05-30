From: Erich Weiler <weiler@soe.ucsc.edu>
Subject: Re: IPTABLES port forwarding woes
Date: Fri, 30 May 2008 14:06:19 -0700
Message-ID: <48406C4B.9070002@soe.ucsc.edu>
References: <484008D8.3080601@soe.ucsc.edu> <4840124D.2000303@plouf.fr.eu.org> <48401A99.70408@soe.ucsc.edu> <48405164.3000706@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48405164.3000706@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

> No, the connection tracking takes care of all this. The NAT operations 
> applied by iptables rules to the first packet creating the connection 
> are recorded and applied to subsequent packets in the same direction, 
> while the inverse operations are applied to reply packets in the 
> opposite direction.

Excellent, it works just fine now!  Here's my final iptables file, just 
in case it would help anyone in the list:

*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [66:7948]
-A FORWARD -d 10.1.3.133 -i eth0 -o eth1 -p tcp -m tcp --dport 22 -m 
state --state NEW -j ACCEPT
-A FORWARD -o eth0 -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
-A FORWARD -i eth0 -m state --state RELATED,ESTABLISHED -j ACCEPT
COMMIT
*nat
:PREROUTING ACCEPT [451:32699]
:POSTROUTING ACCEPT [2:236]
:OUTPUT ACCEPT [2:236]
-A PREROUTING -d 120.1.1.10 -i eth0 -p tcp -m tcp --dport 2222 -j DNAT 
--to-destination 10.1.3.133:22
-A POSTROUTING -s 10.1.3.133 -o eth0 -j SNAT --to-source 120.1.1.10
COMMIT
-A POSTROUTING -o eth1 -p tcp --dport 22 -d 10.1.3.133 -j SNAT --to 
10.1.1.50

Thanks again!

-erich
