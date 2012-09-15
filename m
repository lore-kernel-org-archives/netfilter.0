From: "U.Mutlu" <for-gmane@mutluit.com>
Subject: Mysterious string "<4>"  in LOG
Date: Sat, 15 Sep 2012 12:20:16 +0200
Message-ID: <k31kov$5me$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

A mysterious string "<4>" gets prepended in LOG:
Rule:
  iptables -A INPUT  -m state --state INVALID -m limit --limit 7200/h -j LOG --log-prefix "INPUT INVALID "

Result (sanitized):
Sep 15 11:46:17 s7 kernel: [227009.792828] <4>INPUT INVALID IN=eth0 OUT= 
MAC=00:1b:21:ad:7b:d3:00:0c:db:4e:e8:00:08:00 SRC=**.210.155.237 DST=**.114.132.147 LEN=40 TOS=0x00 PREC=0x00 
TTL=52 ID=49676 PROTO=TCP SPT=6667 DPT=46271 WINDOW=0 RES=0x00 ACK SYN URGP=0

Happens with all LOG entries.
Is the string "<4>" in front of "INPUT INVALID" a new feature, or is it garbage due to a bug?


My system:

# iptables --version
iptables v1.4.14

# uname -a
Linux s7 3.6.0-rc5-my1 #1 SMP Wed Sep 12 19:22:44 CEST 2012 x86_64 GNU/Linux

# dpkg -l | grep -i iptables
ii  iptables                              1.4.14-3                   amd64        administration tools for 
packet filtering and NAT
ii  iptables-dev                          1.4.14-3                   amd64        iptables development files
ii  xtables-addons-common                 1.42-2                     amd64        Extensions targets and 
matches for iptables [tools, libs]
ii  xtables-addons-dkms                   1.42-2                     all          Extensions targets and 
matches for iptables
ii  xtables-addons-source                 1.42-2                     all          Extensions targets and 
matches for iptables [modules sources]


