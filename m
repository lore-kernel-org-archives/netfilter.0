From: Robin Wood <robin@digininja.org>
Subject: transparent proxy and iptables failing
Date: Wed, 7 Oct 2009 12:44:18 +0100
Message-ID: <7de411230910070444u50e7c638m968350c6da1ce6e1@mail.gmail.com>
References: <7de411230910070245s23552d36v66496187db666440@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <7de411230910070245s23552d36v66496187db666440@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi
I'm trying to setup a transparent proxy so I've got a linux device
with two NICs which are bridged using brctl. Traffic flows happily
across the bridge so I know it is working fine.

Now when I try to setup the iptables rules they are being ignored. The
rule I want to use is:

iptables -t nat -A PREROUTING -i br-lan -p tcp --dport 80 -j REDIRECT
--to-port 3128

but nothing gets redirected. I've also tried changing 3128 to a port
that is closed to see what would happen, nothing, the packets kept
flowing.

I've also tried clearing the list and then adding

iptables -t nat -A PREROUTING -i br-lan -p tcp --dport 80 -j DROP

which should kill all web traffic but it doesn't. As a last resort I tried

iptables -t nat -A PREROUTING -i br-lan -p tcp -j DROP

which should kill all TCP traffic but again, nothing.

What am I doing wrong?

Robin
