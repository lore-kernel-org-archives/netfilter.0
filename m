From: JOSE FELIX HERNANDEZ BARRIO <jose.hernandez@isthari.com>
Subject: Fwd: iptables redirect inbound traffic to tun
Date: Fri, 15 Apr 2011 18:51:32 +0200
Message-ID: <BANLkTinzSaZbJSWEfW7+Hn4RDgsh-RYJ2w@mail.gmail.com>
References: <BANLkTim2+_Q967uPAU1HA-VO939OMk6GPg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BANLkTim2+_Q967uPAU1HA-VO939OMk6GPg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

hi,

i've configured a gateway between two network that uses tun:
A - > B <--> C --> D

A is a normal desktop computer B and C are the routers and D are web
server on the other network
A send traffic to D, so it arrives at B is redirected to tun0 device
for processing (custom security) and then send to D through C
When the packet come back from D it enter in B is redirected to tun1
for processing and delivered to A.
Every thing works fine.

My problem is when traffic source is B when the packet come back to B
its destination ip matches local IP so it's not redirected to tun1
ands it's not processed. Incoming packets on local ip are not
processed by prerouting chain.

what i use to redirect its:
iptables -A PREROUTING -t mangle -i eth0 -t tcp -j MARK --set-mark 1
iptables -A PREROUTING -t mangle -i eth0 -j ACCEPT

ip rule add fwmark 1 table 100
ip route add default dev tun0 table 100


someone suggested to use iptables -j ROUTE to force routing even in
this case. But there's no way to use this patch on recent kernel.

any other tip?


thank you in advance
