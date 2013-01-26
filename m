From: lejeczek <peljasz@yahoo.co.uk>
Subject: iptables and slave interfaces
Date: Sat, 26 Jan 2013 11:03:25 +0000
Message-ID: <5103B7FD.3010504@yahoo.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.uk; s=s1024; t=1359198206; bh=mmFQn0V77ynyUJN+EZSKzRLu0ph5Y14fGst3KBiLn6w=; h=X-Yahoo-Newman-Id:X-Yahoo-Newman-Property:X-YMail-OSG:X-Yahoo-SMTP:Received:Message-ID:Date:From:User-Agent:MIME-Version:To:Subject:Content-Type:Content-Transfer-Encoding; b=g54PekUvvKlGo0p+tHics/FrFdIS4KofwKjk4Dh+MuKzemqGB99QwtTmj1sNFPhZ4249sgpPxH28kzGJEb36eb8U+PDJbKgR790CyII3FtvPYH0u7tC7QOS274HxM7MeIRDawGvbIlFfp9RXLQge+hmO0FM6WQ1s1cmVUsXWEQ4=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

newbie sort of question:
does slave ifs of a bridge need to iptabled? does one need
to forward/input etc.. them? It should be only bridges in
this situation, right?

also maybe someone could share his/her thoughts on this one
problem I have, that boggles my mind for I'm unable to fix
it, namely:

I had to introduce additional routing tablesand rules in
order to allow for source based routing, before it was working
what was? - guests(VMs) behind a bridge interface(that
comprised of tap interfaces, one tap IF per VM) could
see/reach hostsystem one specific, separate/physical interface
now these guests cannot do that anymore, I think ever since
I introduced source based routes into this environment
I should try to provide you with better picture....

VM(via tap) --- HOST
VM(via tap) --- ------ > br0(taps + em4 + eth0); br1(em1 +
eth1); em2; em3
etc ...... ---

now, VMsreach allthe interfaces but one em3! VMs also reach
outside world to which em3 is the gateway(masquerade)
naturally VMS are reachable from the HOST itself and each
other, but not from/behind br1

VMs are on/behind br0
here are rutes+rules:

ip route add table internal from 172.25.12.0/24 to
192.168.2.64/27 via 192.168.2.65 dev br0
ip route add table internal from 172.25.12.0/24 to
192.168.2.0/24 via 192.168.2.100 dev br1
ip route add table internal to 172.25.12.0/24 via
172.25.12.203 dev em2

ip route add table external to 192.168.2.0/24 via 192.168.2.100
ip route add table external to 192.168.2.0/27 via 192.168.2.65
ip route add table external to ext_NET/24 dev em3

ip route add table external default viaext_IP(via em3)

ip rule add from 172.25.12.0/24 table internal
ip rule add from 192.168.2.0/24 table internal
ip rule add from ext_NET table external

or is it iptables?? but there is:
-A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
-A FORWARD -i br+ -o br+ -m state --state NEW -j ACCEPT

i really cannot get my head around it, have tampered with
routes+rules, iptables..cannot..
anybody's input much! appreciated
regards

