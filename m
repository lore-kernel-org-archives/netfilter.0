From: Nemeth Denes <nemeth.denes@iit.bme.hu>
Subject: INVALID state
Date: Sun, 28 Feb 2010 10:24:19 +0100
Message-ID: <4B8A3643.6070000@iit.bme.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Dear all

Could someone help me to identify the difference between
the following 3 rules.

1. iptables -t mangle -A PREROUTING -p tcp ! --syn -m state --state 
INVALID -j DROP
2. iptables -A INPUT -p tcp ! --syn -m state --state INVALID -j DROP
3. iptables -A INPUP -p tcp ! --syn -m conntrack --cstate INVALID -j DROP

Many thanks


