From: "a.m.rasat" <a.m.rasat@palangkaraya.speed.net.id>
Subject: Preserving source IP
Date: Thu, 03 Apr 2003 21:28:57 +0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030403142857.1400.qmail@palangkaraya.speed.net.id>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: netfilter@lists.netfilter.org

Dear all, 

I'm trying to setup a DMZ style firewall. The Linux box has 3 interface, one 
to Internet, one to internal network (trusted) and one to DMZ network. 
Unlike many example script I found, this DMZ interface has legal Internet IP 
address, similar to hosts connected to it, also uses legal Internet IP.
NAT IP address also similar to DMZ interface IP address. To simplify it : 

eth0 IP address : aaa.bbb.ccc.ddd
eth1 IP address : ddd.ccc.bbb.aaa
eth2 IP address : ddd.ccc.bbb.aaa 

IP ddd.ccc.bbb.aaa is a legal Internet IP address. 

Up till now, I'm using Linux 2.4.20's proxy arp 
(/proc/sys/net/ipv4/{eth}/proxy_arp) and /proc/sys/net/ipv4/ip_nonlocal_bind 
to let hosts connected to that DMZ interface can be seen from Internet. It 
leaves me a problem : DMZ hosts can only see DMZ interface IP address as 
source IP address, no matter it really came from trusted network or 
Internet. 

Is it possible to preserve source IP address even though still using 
proxy_arp and ip_nonlocal_bind? I know this is more likely kernel question 
but right now I need every idea I can use. 

Regards, 

Anthony M. Rasat.-

