From: "Nishit Shah" <nishit@elitecore.com>
Subject: sequence of matches in a single rule
Date: Sat, 17 May 2008 11:10:44 +0530
Message-ID: <001501c8b7e0$8ef50a00$acdf1e00$@com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,
	Is there any specific order in which match will take place ?

	Ex:- lets say I have a following rules.

	1.) iptables -I PREROUTING -t mangle -m state --state NEW -m mark
--mark 1 -j ACCEPT
	2.) iptables -I PREROUTING -t mangle -m mark --mark 1 -m state
--state NEW -j ACCEPT

	When packet traverse first rule, does state match comes before mark
match ?
	When packet traverse second rule, does mark match comes before state
match ?


Rgds,
Nishit Shah.	

