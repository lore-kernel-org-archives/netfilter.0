From: Marc <ccc@lebertbro.com>
Subject: Confusion about filtering traffic in a bridge scenario
Date: Wed, 11 Apr 2012 16:58:11 +0200
Message-ID: <4F859C03.1080803@lebertbro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; t=1334156335; l=1620;
	s=domk; d=eq3.info;
	h=Content-Transfer-Encoding:Content-Type:Subject:To:MIME-Version:From:
	Date:X-RZG-CLASS-ID:X-RZG-AUTH;
	bh=QuCBeIPWPQYeHg/xbikszHSxQLc=;
	b=H3EVN1q0VVibpOGgH5ePNpziHv6WAXwW323yyFM5oKVo6zo8oOL6z9LiNqhI+rKIdW9
	bvYo7mpNNMgeiL/szedna26M25RaszTGK9zKpqQxd8IINIGCuwaFGtCuW/2fVJM9GQzgQ
	YdddW6+oRj0KGkdwhtAoQf6oZmqMxSQjGAo=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I was/am trying to setup packet filtering on a virtualisation host and
couldnt get it to work and was hoping for some pointers.

Heres the setup:

Said host has:
eth0 - the physical interface, no address assigned
br0 - the bridge interface, has IP 10.0.0.1 and gateway and default
route assigned to it
veth0 - the virtual interface for one of the VMs, has IP 192.168.0.1

both eth0 and veth0 are added to the bridge, the networking setup is
functional, however I seem to be unable to filter traffic to the VM with
iptables. Heres what Ive tried:

iptables -A FORWARD -m physdev --physdev-in eth0 --physdev-out veth0  -p
tcp --dport 22

However, this only results in a /var/log/messages entry:

kernel: physdev match: using --physdev-out in the OUTPUT, FORWARD and
POSTROUTING chains for non-bridged traffic is not supported anymore.

Since this _IS_ in fact bridged traffic, I dont see why I would get this
error?

Maybe Im looking at it the completely wrong way and physdev isnt even
the way to go here anymore, I dont know. Any kind of help is greatly
appreciated.

Oh, I figured I should add the following information:

Kernel is Linux 2.6.32-11, running Debian stable (6.0.4)

/etc/sysctl.conf contains these:

net.ipv4.ip_forward=1
net.ipv4.conf.all.rp_filter=1
net.ipv4.icmp_echo_ignore_broadcasts=1
net.ipv6.conf.all.proxy_ndp=1
net.bridge.bridge-nf-call-arptables = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1

iptables -I FORWARD -j REJECT -p tcp -i veth0 --dport 22
didnt stop ssh from working either

Regards, Marc





