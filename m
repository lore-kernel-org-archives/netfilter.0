From: Jens Neu <jens@zeeroos.de>
Subject: NAT46 best practice?
Date: Mon, 24 Mar 2014 11:18:53 +0100
Message-ID: <5330068D.5070708@zeeroos.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Dear list,

I'm in the situation that I want to offer an openvpn server on IPv6 as 
well as on IPv4. Currently I do this by having openvpn listen on udp6 
and forward the udp(v4) traffic to the IPv6 port via socat. Even though 
this works in principal (reads: as long as socat does not crash), I 
would not consider this a rock solid setup.

What would you suggest as best practice for such a task?

Desired is a linux only setup (Centos 6, Debian 7 or similar), if needed 
with custom kernel/patches but obvioulsy not an F5 or Brocade 
loadbalancer appliance.

best regards
Jens
