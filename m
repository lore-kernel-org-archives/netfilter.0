From: Brent Clark <brentgclarklist@gmail.com>
Subject: connect to openvpn but multipath routing used.
Date: Tue, 23 Sep 2008 17:34:58 +0200
Message-ID: <48D90CA2.8090208@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 'Mail List - Netfilter' <netfilter@vger.kernel.org>

Hi

For the likes of me I cant get my mind around this.

I got two DSL (two separate ISP's) lines that I use multipath routing on 
(works like a bomb, i.e. from in the LAN out to internet). But what I 
want to do is have it that I can randomly connect to my openvpn (sits 
and configured on my router / fw), via either ISP.

Basically in the openvpn conf file I would like to have

remote-random
remote oneisp.dyndns.org (fixed ip)
remote anotherisp.dyndns.org (dynamic ip)

Currently I have openvpn working through the one ISP (fixed ip).

For my tests I have being trying :

iptables -t filter -A INPUT -p udp --dport 1194 -m state --state NEW -j 
ACCEPT

For output (please bare with me on this)
iptables -t filter -A OUTPUT -m state --state NEW -j ACCEPT

For marking I have been trying and trying to get traffic out the dynamic 
ISP.

iptables -t mangle -A OUTPUT -p udp --sport 1194 -j MARK --set-mark 0x1
iptables -t mangle -A POSTROUTING -p udp --sport 1194 -j MARK --set-mark 0x1

The stranges thing that I saw was that on using the last two of the 
above rules, is that with using tshark, that i was seeing that ip 
address of my primary interface (fixed ip address), as opposed to that 
of the dynamic ip.

If anyone can help it would be appreciate.

Kind Regards
Brent Clark
