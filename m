From: zrm <zrm@trustiosity.com>
Subject: Any good way to exclude ports from SNAT?
Date: Wed, 22 Jun 2016 15:07:23 -0400
Message-ID: <3876ba7c-3b95-0243-2a93-160738e72f6a@trustiosity.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mx.trustiosity.com;
	s=mx; t=1466622387; bh=XmYJF9TF76aPPOu4RtGwN6EklO/TGZeJvk2u2uV+Tv0=;
	h=To:From:Subject:Date:From;
	b=kWwnWFDNor7rvOv/YcdmKinTC3tT5XsLguG5EbEYah6YD/40DJ0C4tgG/VfZFuY2P
	 /txYcjMkKL/PBunrE0vdjOvBruoA/I2N0oLhFwgImLozdL5Q6RVX3ut7UFodvakwi/
	 CMKnci7Ua/KG6Ht5yOeRq+awn5M0NhFIgc+ur97w=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I am trying to figure out how to set up exclusive port mappings, e.g. so 
that port 1025 on the gateway is mapped to 192.168.1.2:1200 and port 
2025 is mapped to 192.168.1.3:2300, each in both directions, and nothing 
else can get those external ports. For example:

iptables -t nat -A PREROUTING -i eth0 -p udp -d 128.66.0.1 --dport 1025 
-j DNAT --to-destination 192.168.1.2:1200
iptables -t nat -A POSTROUTING -o eth0 -p udp -s 192.168.1.2 --sport 
1200 -j SNAT --to-source 128.66.0.1:1025
iptables -t nat -A PREROUTING -i eth0 -p udp -d 128.66.0.1 --dport 2025 
-j DNAT --to-destination 192.168.1.3:2300
iptables -t nat -A POSTROUTING -o eth0 -p udp -s 192.168.1.3 --sport 
2300 -j SNAT --to-source 128.66.0.1:2025
iptables -t nat -A POSTROUTING -o eth0 -p udp -j SNAT --to-source 
128.66.0.1:49152-65535

The problem is that is translating all the other ports on all the other 
clients to 49152-65535 and I want to avoid unnecessary port translation. 
The ideal thing would be to make the last line something like this:

iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 
128.66.0.1:1-1024,1026-2024,2026-65535

But apparently that isn't supported. You get 98% of the way there with this:

iptables -t nat -A POSTROUTING -o eth0 -p udp ! -s 192.168.1.2 --sport 
1025 -j SNAT --to-source 128.66.0.1:49152-65535
iptables -t nat -A POSTROUTING -o eth0 -p udp ! -s 192.168.1.3 --sport 
2025 -j SNAT --to-source 128.66.0.1:49152-65535
iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 128.66.0.1

The problem then is if there is a conflict between clients using any 
source port, the second client will get port 1024 and the third will get 
port 1025 which should not be allowed. (This is obviously not going to 
be common but it complicates things if it can happen at all and 
adversarial clients could do it on purpose.)

Another possibility would be to do this:

iptables -t nat -A POSTROUTING -o eth0 -p udp --sport 1-1024 -j SNAT 
--to-source 128.66.0.1:1-1024
iptables -t nat -A POSTROUTING -o eth0 -p udp --sport 1025-2024 -j SNAT 
--to-source 128.66.0.1:1026-2024
iptables -t nat -A POSTROUTING -o eth0 -p udp --sport 2025-65535 -j SNAT 
--to-source 128.66.0.1:2026-65535

That works as long as the mapped ports are far apart, but it's quite 
ugly and if any of the port ranges are very small then all the ports 
could get used up and cause conflicting sessions to be dropped on the 
floor even though there are many other free ports.

Is there any good way to exclude arbitrarily many specific ports from SNAT?
