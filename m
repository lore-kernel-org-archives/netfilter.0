From: Anthony Frazee <afrazee@gmail.com>
Subject: How can I force all outgoing -p tcp --dport 80 from lan side to
 router lanside on port 80 and go out on router wanside?
Date: Sat, 15 Dec 2012 10:06:39 -0500
Message-ID: <CALYUh9OWG7S=VVT_3=xFd-ezUwui4SuodiJoq1fMGb-LAHR5eQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=FVPbJhluMzKORnSczO06y5fZ7SW6Bus6KnaWWGwt4Co=;
        b=GwI/BcmX6EzK8Q3SptDwje8BFZIVK3XKc2s5zhZC0IZKmNaE+cB0G570SUkDGkvNoV
         13NBIUAZsXkUgQ1iNV+NCv/2stQKNqEwc87hz7SxPgjX1YxzZi8eCS0BubVlHhw7DWGY
         y+jHLNWZJqaEwC1g6wLN4ISOBFPsPNICTLFe/OQm+O0Ze0/WCywFcIttTqsp5uCrMgnf
         R2rEN1eulWc1L4pMnQTleC6JqiMdaJ0tqSARqQkaITBv9kBL158QgD6iIjP0znpYnxXf
         Awh9GWkokE/jwiyldGrbpgBUXKoKCWeZjkI6Q/UEvUPPmeTisO/3p6bLVbox3xIjEgfd
         iD0A==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

This is on a router running DD-WRT (Buffalo WZR-HP-G300NH2, build 19154)

Here is what I am trying to do:

[CLIENT_A, 192.168.1.2] -p tcp --dport 80 -> [-i br0 ROUTER,
192.168.1.1, -o vlan2, 4.3.2.1(dynamic)] -> [internet]

My solution for redirecting port 80 traffic was:
iptables -t nat -A PREROUTING -i br0 -s 192.168.1.0/24 -p tcp --dport
80 -j DNAT 192.168.1.1:80

CLIENT_A is connecting to router's wifi.  I want only port 80 to be
routed thru port 80 of the router.
Currently I have lighttpd installed and using port 80.  I wanted PHP
to redirect via a header to wherever I'd like.
The problem is I keep getting a redirect loop. Here is how I was
somewhat able to track what was going on:

iptables -t nat -A PREROUTING -p tcp --dport 80 -j LOG --log-prefix
"NAT PREROUTING D: "
iptables -t nat -A PREROUTING -p tcp --sport 80 -j LOG --log-prefix
"NAT PREROUTING S: "
iptables -t nat -A POSTROUTING -p tcp --dport 80 -j LOG --log-prefix
"NAT POSTROUTING D: "
iptables -t nat -A POSTROUTING -p tcp --sport 80 -j LOG --log-prefix
"NAT POSTROUTING S: "
iptables -t nat -A OUTPUT -p tcp --dport 80 -j LOG --log-prefix "NAT OUTPUT D: "
iptables -t nat -A OUTPUT -p tcp --sport 80 -j LOG --log-prefix "NAT OUTPUT S: "
iptables -t filter -A INPUT -p tcp --dport 80 -j LOG --log-prefix
"FILTER INPUT D: "
iptables -t filter -A INPUT -p tcp --sport 80 -j LOG --log-prefix
"FILTER INPUT S: "
iptables -t filter -A FORWARD -p tcp --dport 80 -j LOG --log-prefix
"FILTER FORWARD D: "
iptables -t filter -A FORWARD -p tcp --sport 80 -j LOG --log-prefix
"FILTER FORWARD S: "
iptables -t filter -A OUTPUT -p tcp --dport 80 -j LOG --log-prefix
"FILTER OUTPUT D: "
iptables -t filter -A OUTPUT -p tcp --sport 80 -j LOG --log-prefix
"FILTER OUTPUT S: "
iptables -t mangle -A PREROUTING -p tcp --dport 80 -j LOG --log-prefix
"MANGLE PREROUTING D: "
iptables -t mangle -A PREROUTING -p tcp --sport 80 -j LOG --log-prefix
"MANGLE PREROUTING S: "
iptables -t mangle -A INPUT -p tcp --dport 80 -j LOG --log-prefix
"MANGLE INPUT D: "
iptables -t mangle -A INPUT -p tcp --sport 80 -j LOG --log-prefix
"MANGLE INPUT S: "
iptables -t mangle -A FORWARD -p tcp --dport 80 -j LOG --log-prefix
"MANGLE FORWARD D: "
iptables -t mangle -A FORWARD -p tcp --sport 80 -j LOG --log-prefix
"MANGLE FORWARD S: "
iptables -t mangle -A POSTROUTING -p tcp --dport 80 -j LOG
--log-prefix "MANGLE FORWARD D: "
iptables -t mangle -A POSTROUTING -p tcp --sport 80 -j LOG
--log-prefix "MANGLE FORWARD S: "
iptables -t mangle -A OUTPUT -p tcp --dport 80 -j LOG --log-prefix
"MANGLE OUTPUT D: "
iptables -t mangle -A OUTPUT -p tcp --sport 80 -j LOG --log-prefix
"MANGLE OUTPUT S: "
iptables -t raw -A PREROUTING -p tcp --dport 80 -j LOG --log-prefix
"RAW PREROUTING D: "
iptables -t raw -A PREROUTING -p tcp --sport 80 -j LOG --log-prefix
"RAW PREROUTING S: "
iptables -t raw -A OUTPUT -p tcp --dport 80 -j LOG --log-prefix "RAW OUTPUT D: "
iptables -t raw -A OUTPUT -p tcp --sport 80 -j LOG --log-prefix "RAW OUTPUT S: "
iptables -A INPUT -p tcp --dport 80 -j LOG --log-prefix "INPUT D: "
iptables -A INPUT -p tcp --sport 80 -j LOG --log-prefix "INPUT S: "
iptables -A FORWARD -p tcp --dport 80 -j LOG --log-prefix "FORWARD D: "
iptables -A FORWARD -p tcp --sport 80 -j LOG --log-prefix "FORWARD S: "
iptables -A OUTPUT -p tcp --dport 80 -j LOG --log-prefix "OUTPUT D: "
iptables -A OUTPUT -p tcp --sport 80 -j LOG --log-prefix "OUTPUT S: "

With just MASQUERADING and no DNAT involved the typical log went like:
TABLE: RAW, CHAIN: PREROUTING, in br0 source 192.168.1.2 destination
1.2.3.4 sport 51243 dport 80
TABLE: MANGLE, CHAIN: PREROUTING, in br0 source 192.168.1.2
destination 1.2.3.4 sport 51243 dport 80
TABLE: NAT, CHAIN: PREROUTING, in br0 source 192.168.1.2 destination
1.2.3.4 sport 51243 dport 80
TABLE: MANGLE, CHAIN: FORWARD, in br0 source 192.168.1.2 destination
1.2.3.4 sport 51243 dport 80
TABLE: MANGLE, CHAIN: FORWARD, in br0 out vlan2 source 192.168.1.2
destination 1.2.3.4 sport 51243 dport 80
TABLE: RAW, CHAIN: PREROUTING, in vlan2 source 1.2.3.4 destination
4.3.2.1 sport 80 dport 51243
TABLE: MANGLE, CHAIN: PREROUTING, in vlan2 source 1.2.3.4 destination
4.3.2.1 sport 80 dport 51243
TABLE: MANGLE, CHAIN: FORWARD, in vlan2 source 1.2.3.4 destination
192.168.1.2 sport 80 dport 51243
TABLE: MANGLE, CHAIN: FORWARD, out br0 source 1.2.3.4 destination
192.168.1.2 sport 80 dport 51243

*192.168.1.1 is router lan ip (br0)
*192.168.1.2 is the client ip
*1.2.3.4 is the remote ip
*4.3.2.1 is router wan ip, dhcp (vlan2)

When DNAT was applied i got results like this:
TABLE: RAW, CHAIN: PREROUTING, in br0 source 192.168.1.2 destination
1.2.3.4 sport 51243 dport 80
TABLE: MANGLE, CHAIN: PREROUTING, in br0 source 192.168.1.2
destination 1.2.3.4 sport 51243 dport 80
TABLE: MANGLE, CHAIN: INPUT, in br0 source 192.168.1.2 destination
192.168.1.1 sport 51243 dport 80
TABLE: RAW, CHAIN: OUTPUT, out br0 source 192.168.1.1 destination
192.168.1.2 sport 80 dport 51243
TABLE: RAW, CHAIN: OUTPUT, out br0 source 192.168.1.1 destination
192.168.1.2 sport 80 dport 51243
TABLE: MANGLE, CHAIN: OUTPUT, out br0 source 192.168.1.1 destination
192.168.1.2 sport 80 dport 51243
TABLE: MANGLE, CHAIN: FORWARD, out br0 source 192.168.1.1 destination
192.168.1.2 sport 80 dport 51243

And because this was a redirecting loop, this kept repeating.  So what
I tried to do wasn't even hitting vlan2 whatsoever.
So if I had to explain what I wanted to do it would be:
All incoming packets to br0 that the destination port is 80 change
destination to itself (192.168.1.1) and if
itself (lighttpd + php) wanted to redirect to an external page, let
it. I am hoping this can be done by iptables.

Anthony
