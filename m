From: "Payam Chychi" <pchychi@gmail.com>
Subject: Iptables stats in FORWARD chain from SPAN port...
Date: Thu, 10 Jul 2008 21:30:37 -0700
Message-ID: <f08c15d10807102130r2ebdae8cn9d1c0313370988b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=nYNEVKm3cWRwbmz3e4jTzPi529i8qqxBwxTbGfjOsXQ=;
        b=JUpcTjhyfzxUygT7223Us2C8ZARaF2YwfdcLBSX2GvsR+/ZQOYA24MZCJE18CpcgtW
         VzPo2RnG6wSkxUt54eZn4sSw+JY3E1W13JSIR0UQ/s1+aq/a99jOV+T/LboR81yNnPZg
         bhpT6SCadkO8H8SiNVRaevHx0oJ6IKhXtPkrA=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hey Guys,

Ive been having issues trying to use iptables to keep stats on traffic
that it sees in layer2 bridge mode. When the box is inline and running
under bridge mode, all traffic is accounted for and iptables keeps
proper stats however, when i move the linux box to a SPAN port
(traffic mirrored), iptables is no longer able to keep stats on the
packets being forwarded from one interface to another. is there anyway
around this problem? I am trying to use iptables for keeping stats and
graphing the data via rrdtool and I dont want the device to be placed
between my two network gear... instead id like to have it sit
somewhere on the switch fabric and simply keeping stats.

Here is a quick diagram... sorry if the diag sucks big time :)

----------------------
traffic generator |
----------------------
	|
----------------------------					                ------------------------------
 Layer 3 Cisco Switch |  --> SPAN PORT, vlan1 --> eth0 | iptables
bridge mode | eth1 --> { Dell switch }
----------------------------					                ------------------------------
       | "access ports, vlan1"
----------------------------
 Layer 3 Cisco Switch |
----------------------------
	|
---------------------
    WWW Server  |
---------------------

Reasons: I have the eth1 bridged port connected to a dell switch to
allow the bridged ports to activate and move into forwarding so
traffic can flow through the bridge
the traffic generator generates the traffic and uses the www server as
its destination ip address.
the 2 layer 3 cisco switches are there to simply do routing ( nothing
special, can get away with one but i am also using them as a testing
network for other things...)
both eth0 and eth1 are part of br0

I have ran tcpdump during the phase where the iptables is connected to
the span port and can confirm traffic flowing through the box however,
iptables can not match against policies and keep stats for the traffic
per destination based.

Thanks in advance and much appreciate any comments/help
Regards,
Payam
