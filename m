From: Ivan Hernandez <ihernandez@kiusys.com>
Subject: Port Forwarding Problem
Date: Thu, 24 Apr 2008 16:17:13 -0300
Message-ID: <4810DCB9.8070208@kiusys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I have a problem that seems difficult to resolve.

On a LAN a set of computers in the range 192.168.1.x that have already 
assigned a default gw 192.168.1.1 run an application that must connect 
to an internet server 234.56.78.9 to the tcp port 4444 much like a 
telnet app.

The 192.168.1.1 gw does no serves internet  in any way so the 
192.168.1.x network is isolated except for 1 computer, that has 2 nic's 
and is the computer running linux that i need to configure.

That machine has eth0 with 192.168.1.2 and an eth1 with an internet 
address 200.100.23.4.

Now, i can't touch routing on the clients, and clients only can see 
192.168.1.2. I used simpleproxy this way:
simpleproxy -L 4444 -R 234.56.78.9:4444
to solve the problem, but there is any chance to solve it with iptables???

As clients don't have 192.168.1.2 as router, it seems difficult to use 
DNAT because packets are sent to internet, but as 192.168.1.x -> 
234.56.78.9 so they never come back.

Ideally it should receive packets on eth0 like 192.168.1.x -> 
192.168.1.2:4444, and send them to eth1 as 200.100.23.4 -> 
234.56.78.9:4444 and manage the responses to send back the packets 
234.56.78.9:4444 -> 200.100.23.4 from eth1 to 192.168.1.2:4444 -> 
192.168.1.x on eth0

i hope i have found a way to explain the problem!!!
Thanks a lot

Ivan Hernandez
Kiu System Solutions

