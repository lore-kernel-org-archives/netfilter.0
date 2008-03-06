From: "Daniel" <daniel@poligraph.com.br>
Subject: wan links routing failover sheme
Date: Wed, 5 Mar 2008 23:37:04 -0300
Message-ID: <003501c87f32$f6d5d3c0$56f5edc8@softplan.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: iptables-netfilter list <netfilter@vger.kernel.org>

I need a routing failover scheme to address a vpn site-to-site scenario 
where branches offices have 2 wan links and a linux box with 2 ethernet 
ifaces, each one reaching one wan router. Wan links should working in 
active/passive failover mode. Considering start vpn tunnels from branches to 
headquarter, the problem is:
At each branch, I need to choose one of the 2 wan routers as the linux box 
default gateway. For failover work, I need some mechanism to monitor the 
active/master link, like icmp/ping, and change the gateway to the 
passive/backup link when the active/master link fails, and change back when 
the active/master link becomes up again. If I address this with a routing 
scheme, the vpn on demand tunnel from branch to headquarter work transparent 
above it.

On headquarter and on each branch I will use a linux box. I thinking in use 
openvpn as vpn server and client (I have low know hall of openvpn), but 
other vpn solutions, like ipsec, can be suggested! On branches, a fast and 
cheap DSL link (should be the active/master link) and a realiable and slower 
128kbps PPP link (should be the passive/backup link). Tunnels can be started 
from any side, from headquarter or from branches, but I will consider start 
tunnels from branches to headquarter for this scenario, I can change this 
view, no problem.

Should iproute2 address such solution?
I ask about it in openvpn-users list, one people answer that he use linux 
eql driver driver to form a logical connection and a little bit of scripting 
to continuously monitor the tunnels and add or remove them from the bundle 
if needed.

As a comparision, as logn I know, Cisco solution use IPSLA as the monitoring 
scheme and on the start vpn tunnel box a list of 2 vpn servers to reach (one 
master and one backup), to address such failover environment.

I will appreciate ny sugestions!


Regards,
Daniel.


