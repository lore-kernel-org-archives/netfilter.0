From: Stewart Thompson <stewart.thompson@shaw.ca>
Subject: RE: iptables: exe
Date: Sat, 21 Sep 2002 18:57:51 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FLEKIPPLAEDMJMOOBBDPOEHBCPAA.stewart.thompson@shaw.ca>
References: <20020922013651.76933.qmail@web20301.mail.yahoo.com>
Reply-To: stewart.thompson@shaw.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <20020922013651.76933.qmail@web20301.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Tasha Smith <natasha3641@yahoo.com>, netfilter@lists.netfilter.org

Hi Tasha:

	That looks like it started ok. Your rule is in the
Postrouting Chain as it should be. Have a look at
http://www.linuxguruz.org/iptables/
for some sample scripts that you can get some ideas.
From. They have a number of different ones for different
 situations. There is also lots of good information at.
http://www.netfilter.org/documentation/index.html
Hope that helps.

Stu.......


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Tasha Smith
Sent: September 21, 2002 6:37 PM
To: netfilter@lists.netfilter.org
Subject: iptables: exe

Alrightyyyy.. here is my script soooo  far:
#!/bin/bash

# Remove any existing rules from all chains.
iptables --flush
iptables -t nat --flush

# Unlimited access on the loopback interface
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUPUT -o lo -j ACCPET

# Set the fefault policy to Drop
iptables --policy INPUT DROP
iptables --policy FORWARD DROP

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
######################################################'
Here is my output for iptables -vL -t nat

Chain PREROUTING (policy Accept 67 packets, 8497 bytes)
pkts bytes target prt opt in out source destination

CHain POSTROUTING(policy ACCEPT 5 packets, 394 bytes)
pkts bytes target prt opt in out source destination
0 0 MASQUERADE all -- any eth0 anwywhere anwhere

Chain OUPUT (policy ACCEPT 5 packetts, 394bytes)
pkts bytes target prt opt in out source destination
---------------------------------------------------------
Soo does it look like they started ???


P.S.>By they way if anyone can gimme a few more rules for my box i could add
i
would really appreciate it just to make it a bit more secure beofore i plug
it
in ....  I have 2 INTERFACES and it is acting as FIREWALL/ROUTER




__________________________________________________
Do you Yahoo!?
New DSL Internet Access from SBC & Yahoo!
http://sbc.yahoo.com


