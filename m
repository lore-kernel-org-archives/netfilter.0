From: Oliver Graute <oliver.graute@gmail.com>
Subject: Marking frames with ebtables for iptables
Date: Wed, 2 Dec 2015 14:02:39 +0000 (UTC)
Message-ID: <loom.20151202T145721-935@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I'am new to ebtables/iptables. I struggle with the mark feature. 

I try to mark some frames with ebtables on MAC Layer to pass these mark to 
iptables network layer.

I build up a bridge interface br0, cleared all ebtables and iptables tables 
as preparation. Then I try something like this:   

ebtables -t filter -A INPUT -p IPv4 -s 00:11:22:33:44:55 -i eth0 -j mark --
mark-set 0xffff --mark-target ACCEPT
ebtables -t filter -A INPUT --log-level info --log-ip --log-prefix EBFW
iptables -t mangle -A PREROUTING -m mark --mark 0xffff
iptables -t mangle -A PREROUTING -m mark --mark 0xffff -j LOG --log-level 
info --log-prefix MARKED


i would expect that iptables log show me the marked packages from ebtables. 
But i see no mark 0xffff

Does anyone know how this is done right?

Best regards,

Oliver

