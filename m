From: Todd L <00todd@gmail.com>
Subject: Public IP Confusion
Date: Wed, 17 Nov 2004 16:52:24 -0500
Message-ID: <cbbdce6c04111713523d175e8f@mail.gmail.com>
Reply-To: Todd L <00todd@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi everyone,

This is my first post to this list. 

I am fairly new to netfilter and iptables and I wanted to do the
following setup to protect a class C network from the occasional IP
Fragment, SYN and similar DDOS attacks.

My ISP has a router which is .1 on the network and my gateway for the
machines on the class C. The ISP gives me an ethernet handoff which
goes into my switch and my server are plugged into that switch with
gateway of 1 and netmask of 255.255.255.0.

 I would like to place a linux box using iptables in between the
switch and the ISP ethernet handoff to block attackers IP addresses.

What I though I could do is have ISP ethernet to  Eth0 on linux box.
Eth1 on linux box to switch and then somehow make the linux box
transparent to the network. From what I have read it almost seems like
I need a mix of SNAT and NAT but I am unsure on how to proceed. I have
read a lot of the documentation and HOWTOs  and I have not found any
examples of this type of a scenario.

Any Advice?

Thank you,

Todd

