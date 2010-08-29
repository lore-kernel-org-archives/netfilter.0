From: Jonathan Tripathy <jonnyt@abpni.co.uk>
Subject: NDP and ebtables
Date: Sun, 29 Aug 2010 11:54:42 +0100
Message-ID: <4C7A3C72.6070105@abpni.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi Everyone,

I'm just trailing out ipv6 on my network. Currently, all my bridge ports 
are protected from MAC address spoofing by using ebtables:

/usr/local/sbin/ebtables -I FORWARD -p ARP -o "$vif" -j ACCEPT
/usr/local/sbin/ebtables -I FORWARD -i "$vif" -s "$mac" -j ACCEPT
/usr/local/sbin/ebtables -I FORWARD -o "$vif" -d "$mac" -j ACCEPT

As you can see above, I allow all ARP packets to flow to the host 
(who-has). This allows ARP resolution to work. Is-at works at the source 
MAC address is set in the frame.

However, adding IPv6 to the mix is a little trickier. As it turns out, 
IPv6 doesn't use ARP, but uses NDP.

Is there any way to make NDP work with ebtables, but still preventing 
MAC address spoofing?

Many Thanks
