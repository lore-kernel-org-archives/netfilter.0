From: "Javier A Toledano" <jatoledano@gmail.com>
Subject: Forwarding Problem
Date: Tue, 12 Dec 2006 09:53:45 -0300
Message-ID: <b06b831a0612120453r8e1169fg8cad7f88d4c5c7d0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Routing Problem


	
   Internet
         |
         |
 DSL Router with NAT Enabled
         192.168.93.2/24
                                  |
		  |	 		
   		  |
		  |
	192.168.93.1/24 (eth1)
		  |				
Linux Multihomed Router -- 10.0.0.25/8 (eth0) ------------------10.0.0.1 (host)
		  |		  |
		  192.168.10.2/24 (eth2)
		  |
		  |
		  |
		  |
		192.168.10.49 (host)

				


The linux is running Centos 4.2. I have 3 ethernet cards, eth1
(davicom Semiconductor, Inc 21x4x DEC -Tulip Compatible), eth0 (VIA
Technologies, Ic VT6105 Rhine III)
Eth2 (intel Corporation 82547Gi Gigabit Ethernet Controller)


I don't have any rules of iptables applied to the kernel.


the content of sysctl.conf is below:

# Kernel sysctl configuration file for Red Hat Linux
#
# For binary values, 0 is disabled, 1 is enabled.  See sysctl(8) and
# sysctl.conf(5) for more details.

# Controls IP packet forwarding
net.ipv4.ip_forward = 1

# Controls source route verification
net.ipv4.conf.default.rp_filter = 0

# Do not accept source routing
net.ipv4.conf.default.accept_source_route = 0

# Controls the System Request debugging functionality of the kernel
kernel.sysrq = 0

# Controls whether core dumps will append the PID to the core filename.
# Useful for debugging multi-threaded applications.
kernel.core_uses_pid = 1


The problem is that forwarding is enabled but when I try to probe
connectivity from a host in the 10.0.0.0 net , eg 10.0.0.1 making an
echo request
to a host in 192.168.10.0 net , eg 192.168.10.49 the icmp packets
arrive to the linux box (interface eth0) but don't traverset it.
After I iniate an echo request from 192.168.10.49 to 10.0.0.1, the
packets iniatated in 10.0.0.0 net starts to traverse the router
magically.
It seems that It needs a packet from the 192.168.10.0 to start working.

I would appreciate any idea.
Thanks in advance.

Javier Toledano

