From: Jeremy Hansen <jeremy@cigarsoul.com>
Subject: middleman Raspberry Pi wired to wifi configuration
Date: Wed, 3 May 2017 04:32:52 -0700
Message-ID: <88D4348C-63A1-47FC-B096-9DB67B239098@cigarsoul.com>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.subtraverse.net 1082F65F88
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org


I’m sharing a wifi connection in some office space.  I’d like to create my own internal network.  I have a raspberry pi, connected to the office wifi, a switch connected to the ethernet port of the pi, and a wifi AP connected to the switch.  DHCP and DNS running on the Pi…

The configuration works and I’m able to gateway to the public internet via the AP connected to the Pi.

It’s just very slow and I’m wondering if it has to do with my iptables rules and the fact that it’s basically NAT’ing twice, once at the pi for my internal network, and secondly at the office’s main internet connection...  

Here’s my current rules:

*filter
:INPUT ACCEPT [73:5085]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [72:6792]
-A FORWARD -i eth0 -j ACCEPT
-A FORWARD -i wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT
COMMIT
*nat
:PREROUTING ACCEPT [43:2584]
:INPUT ACCEPT [2:278]
:OUTPUT ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
-A POSTROUTING -o eth0 -j MASQUERADE
-A POSTROUTING -o eth0 -j MASQUERADE
-A POSTROUTING -o wlan0 -j SNAT --to-source 192.168.10.30
COMMIT

192.168.10.30 is the IP of the wireless interface on the PI.  This wireless interface is connected to the office wifi…

Not sure what other details I’m missing.  If there’s something I’m obviously doing wrong, please let me know.  It’s just extremely slow compared to going direct to the office network.

Thank you
-jeremy