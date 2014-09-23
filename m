From: Maarten <maarten@ba.be>
Subject: advanced routing with NAT: returning UDP traffic
Date: Tue, 23 Sep 2014 14:46:17 +0200
Message-ID: <1955116.aThXd60LEg@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

Hi,

until now, i've done multiple ISPs with nexthop default route, 2 extra tables, 
ip rule and TCP connmark.

but, how does this involve UDP traffic...

if for example i have in my NAT LAN an NTP server, how would i get the udp 
packet out the same interface where it was originally coming in from?

please advise...

Maarten
-- 
BA NV
IT & Security
