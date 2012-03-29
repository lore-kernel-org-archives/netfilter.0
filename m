From: Sebastian Arcus <shop@open-t.co.uk>
Subject: Iptables "-m time" option doesn't update when the clock changes
Date: Thu, 29 Mar 2012 10:10:18 +0100
Message-ID: <4F7426FA.2060902@open-t.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I'm using the following line in my iptables firewall to block internet 
access for one of the machines on the network for one hour a day:

Code:

iptables -A FORWARD -p ALL -o $INET_IFACE -m mac --mac-source 
$BLOCKED_MAC1 -m time --timestart $BLOCKED_TIMESTART1 --timestop 
$BLOCKED_TIMESTOP1 -j DROP


Everything works fine - except that when the clocks change from winter 
time to summer time (in UK) - the rule keeps on working on the old time. 
The clock of this server (checked with "date") updates correctly. If I 
restart the server - the rule finally starts working on the correct 
time. Last year when this happened, I posted here and I was advised to 
change the hardware clock to UTC (from local time) - which I did. 
However, now that the clock just changed again from winter time to 
summer time - the user is complaining again that their Internet access 
slot is off by an hour.

Does anybody know why is this happening?
