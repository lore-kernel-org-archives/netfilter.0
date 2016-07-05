From: alvin.ml@Mail.DDoS-Mitigator.net
Subject: Re: iptables TCP DDoS filtering
Date: Tue, 5 Jul 2016 12:08:49 -0700
Message-ID: <20160705190849.GA26405@Mail.DDoS-Mitigator.net>
References: <loom.20160705T084958-392@post.gmane.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <loom.20160705T084958-392@post.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Josh Day <conna666@gmail.com>
Cc: netfilter@vger.kernel.org, alvin.ml@Mail.DDoS-Mitigator.net


On 07/05/16 at 06:53am, Josh Day wrote:
> I'm curious if anyone of you has read this article 
> https://javapipe.com/iptables-ddos-protection and tried any of the 
> rules/settings. I read it today but I'm not sure what to make of it, so 
> thought you guys could maybe share your opinion.

i've seen/read most of the various articles/howto/snipplets of using
iptables for ddos mitigation .. the list of various iptables howto 
for ddos mitigation at the bottom of http://iptables-blacklist.net/Howto
 
some of the rules in javapipe.com seems way tooo complicated ...
( i think pre-routing and post-routing is un-necessary )
#
# more importantly, the iptables rules in javapipe is incomplete and
# "droping" packets is NOT ddos mitigation because you already received
# the packets.
#
the sysctl variables should be tuned per your server, cpu/mem, bandwidth,
and amt and type of DDoS attacks
 
i keep wondering which of the big brand-name ddos mitigation appliances
are using iptables under the hood ( under their "propritory os" )
 
i claim iptables + tarpit is ideal to defend against tcp-based ddos
attacks ... the attacking zombie-host has to sit and wait the
tcp-timeout ..  there are roughly 65,535 tcp-ports that should
be protected with tarpits :-) .. how one builds the LAMP servers
and how the network infrastrucure is configugred greatly affects
your ability to mitigate tcp-based ddos attacks
 
---

i think that dropping or limiting icmp-based or udp-based attacks are
pointless since you've already received the ddos packets

udp-based and icmp-based attacks must be mitigated at the uplink ISP
and not at the server under attack
 
also, limiting incoming is sorta misleading, since you cannot
limit/stop/block/drop incoming packets.  you can only limit which
of the incoming packets you are replying to
 
there are some icmp-packets you should reply to while ignoring
un-necessary and un-used udp services

there are some udp-packets you should reply to while ignoring 
un-necessary and un-used udp services

magic pixie dust
alvin
#
# DDoS-Mitigator.net ... automated tcp-based iptables + tarpits
# DDoS-Simulator.net
#

