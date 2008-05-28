From: "ArcosCom Linux User" <linux@arcoscom.com>
Subject: Problem accessing to Windows Terminal Server in load balancing.
Date: Wed, 28 May 2008 10:54:22 +0200 (CEST)
Message-ID: <34055.195.55.244.106.1211964862.squirrel@www.arcoscom.com>
Reply-To: linux@arcoscom.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-net-owner@vger.kernel.org>
Sender: linux-net-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org, linux-net@vger.kernel.org
Cc: centos@centos.org

Hi guys, I have this configuration:


LAN -- LINUX BRIDGE -- LINUX BRIDGE -- TS

The linux's bridges are for wifi purposes (2 centos machines) and is
working fine.

The problem I have is that the TS are 3 windows TS in load balancing
configuration. There is 1 IP for general purposes and every TS has its own
IP.
For example, the configuration is:

    192.168.0.1/24  TS1
    192.168.0.2/24  TS2
    192.168.0.3/24  TS3
    192.168.0.10/24 (TS server IP for load balancing)

The problem I encountered is that every PC into the LAN has access from
the LAN to every TS (tested with ping), but them have no access to the IP
for load balancing.

I observed that all TSn IP's has their ARP entry in the ARP table, but the
IP for load balancing not.

How can I solve this problem at the bridge level? I think that there is
something that the bridges are filtering and perhaps is because the TS
load balancing software uses various "virtual macs" for the load balancing
IP.

Perhaps I must change any /proc/sys/net/ipv4/conf/<dev>/ file to bypass
this filter, I'm thinking in "arp_ignore", put a "1" into it, but is a
production environment and I don't want to loss the access to the devices.

Any help?

