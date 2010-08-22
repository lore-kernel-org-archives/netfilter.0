From: Jan Engelhardt <jengelh@medozas.de>
Subject: Forced lladdr change with bridge - or not?
Date: Sun, 22 Aug 2010 18:12:36 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1008221812200.22261@obet.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bart De Schuymer <bdschuym@pandora.be>
Cc: netfilter@vger.kernel.org

Hi,



# tunctl -p -t tap1
Set 'tap1' persistent and owned by uid 0
# tunctl -p -t tap2
Set 'tap2' persistent and owned by uid 0
# ip a
196: tap1: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN qlen 500
    link/ether 9a:17:c4:65:e9:76 brd ff:ff:ff:ff:ff:ff
197: tap2: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN qlen 500
    link/ether ce:61:28:5a:b7:93 brd ff:ff:ff:ff:ff:ff
# brctl addbr br0
# brctl addif br0 tap1
# brctl addif br0 tap2
# ip a
196: tap1: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN qlen 500
    link/ether 9a:17:c4:65:e9:76 brd ff:ff:ff:ff:ff:ff
197: tap2: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN qlen 500
    link/ether ce:61:28:5a:b7:93 brd ff:ff:ff:ff:ff:ff
198: br0: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN 
    link/ether 9a:17:c4:65:e9:76 brd ff:ff:ff:ff:ff:ff

Is this behavior normal that the lladdrs of all but the first brport
remain unchanged? If so, what is the purpose of changing the lladdr on 
the first brport?
