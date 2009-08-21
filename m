From: "J. Bakshi" <joydeep@infoservices.in>
Subject: bad argument state
Date: Fri, 21 Aug 2009 13:51:56 +0530
Message-ID: <4A8E5924.2050302@infoservices.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Dear list,

Here is a rule set to prevent distributed ( from different machine) port
scan.
But whenevr I insert these rules in my existing iptables rule it reports
"bad argument state"

Any clue ?

``````````````````
IFACE=eth0
iptables -A INPUT -p tcp -i $IFACE -m state --state NEW -m recent --set
iptables -A INPUT -p tcp -i $IFACE -m state --state NEW -m recent
--update --seconds 30 --hitcount   10 -j DROP
iptables -A FORWARD -p tcp -i $IFACE -m state --state NEW -m recent --set
iptables -A FORWARD -p tcp -i $IFACE -m state --state NEW -m recent
--update --seconds 30 --hitcoun  10 -j DROP
`````````````````````````````

thanks
