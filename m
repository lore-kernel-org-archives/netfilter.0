From: Nandan Bhat <nlbhat@gmail.com>
Subject: Newbie request
Date: Tue, 12 Dec 2006 13:04:49 +0530
Message-ID: <457E5B99.7050005@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Hi,

I am trying to setup an old machine having two NICs with Fedora Core 5.
I have two Class C networks (I hope I got that right).
eth0 is assigned 192.168.1.6/255.255.255.0 .
eth1 is set to DHCP and is part of 192.168.0.0/24 .

I need some machines on 192.168.1.0/24 network to be able to get/send 
mail using 192.168.0.10 . Mail is limited to these networks and does not 
go to the outside world.

I have gone through the Linux-IP-Masquerade HOWTO and feel that I don't 
need a very liberal ruleset. Only smtp,pop functionality, especially 
connecting with 192.168.0.10 is sufficient.

My question is: Do I need a SNAT rule or should I try something with 
nat+FORWARD? I just went through iptables manual and am somewhat able to 
understand the rules in the HOWTO - stronger firewall example.

Thanks in advance,

Nandan Bhat

