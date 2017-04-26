From: Luescher Claude <stargate@tango.lu>
Subject: Getting rid of false ULOG events once and for all
Date: Wed, 26 Apr 2017 11:06:36 +0200
Message-ID: <1304d06c2895e5d7a3747cf2baafb572@tango.lu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

I'm using a similar ruleset since many years on many servers:

$FWCMD -A INPUT -p tcp -m state --state RELATED,ESTABLISHED -j ACCEPT
$FWCMD -A INPUT -s 10.0.0.2 -d 10.0.0.1 -p tcp -m tcp --dport 3306 
--tcp-flags SYN,RST,ACK SYN -m state --state NEW -j ACCEPT
$FWCMD -A INPUT -j $UL --ulog-prefix "LAN IN: "
$FWCMD -A INPUT -j DROP

These are basic stateful firewall rules to allow mysql connections from 
a sepcific server. However once in a while I always get log events from 
all the allowed targets such as:

Apr 24 11:51:56 mysql LAN IN:  IN=eth0 OUT=  SRC=10.0.0.2 DST=10.0.0.1 
LEN=52 TOS=00 PREC=0x00 TTL=64 ID=22317 PROTO=TCP SPT=28445 DPT=3306 
SEQ=1775770220 ACK=2310754247 WINDOW=2048 ACK URGP=0
Apr 24 11:51:56 mysql LAN IN:  IN=eth0 OUT= SRC=10.0.0.2 DST=10.0.0.1 
LEN=52 TOS=00 PREC=0x00 TTL=64 ID=17183 PROTO=TCP SPT=18431 DPT=3306 
SEQ=1985459406 ACK=286608940 WINDOW=2048 ACK URGP=0

What's happening here exactly? Are the packets out of sequence, 
connection broke up, packets duplicating etc. and how can I remove these 
false positives from my log files so only the bad traffic which was 
blocked is showing up?

Thank you.
