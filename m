From: "Joey" <Joey@Web56.net>
Subject: help with whitelist
Date: Wed, 29 Oct 2008 14:13:10 -0400
Message-ID: <001101c939f2$00158910$00409b30$@net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: IPTables <netfilter@vger.kernel.org>

Hello All,

 

I have been refining my iptables code and have perfected the blocking side (
thanks to all who helped! ).  Rules here http://web56.net/iptables-save.cfg

 

But now, I need to create some whitelist entries.

 

Lets say I have a block rule of 207.144.68.0/24 and I need to whitelist
207.144.68.15

 

I tried this by hand for testing purposes:

 

Create chain

iptables -N WHITE_LIST

rue for chain

iptables -A WHITE_LIST -p tcp --dport 25 -s 207.144.68.15 -m state --state
NEW -j ACCEPT

hook rule

iptables -A INPUT -j WHITE_LIST

 

I also tried this, but no luck

 

iptables -A INPUT -p tcp -s 207.44.168.15 -j LOG --log-prefix JOEY-TEST-JOEY

iptables -A INPUT -p tcp -s 207.44.168.15 --dport 25 -j DROP

iptables -N WHITE_LIST

iptables -A SMTP_TRAFFIC -j WHITE_LIST

iptables -N LOG_WHITE_LIST

iptables -A LOG_WHITE_LIST -j LOG --log-prefix "WHITELISTED"

iptables -A LOG_WHITE_LIST -j ACCEPT

 

I'm not real clear on this so I figured before I break something ask for
help.

 

Thanks!


Joey


