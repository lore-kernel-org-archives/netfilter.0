From: "Martin Leduc" <marled3@hotmail.com>
Subject: Re: Problem behind my DMZ
Date: Fri, 09 Jan 2004 02:19:54 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Law9-F44y5JrmDLaA4J00011e46@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: ramin@cannon.eng.us.uu.net, Antony@Soft-Solutions.co.uk
Cc: netfilter@lists.netfilter.org

Good evening folks,

Sorry to answer you so late, and thank you for your informations.  I'm so 
exited, I have make test and, basicly, it's working.  Tomorow is the 
official test.  I keep you informed.

The only thing I can't figure out is the /32 netmask address for an address 
having a /28.  Why dont put the /28?

Of course I try it but the route program have reject this entries.  Can you 
explain to me?

Other thing.  It is possible than I can't reach other machine placed before 
the firewall BOX having address IP in the same range than my firewall box 
after having put the /32 host in my route table?

Example:
192.168.1.1  ISP GAteway
192.168.1.2  Server (Any kind)
192.168.1.3  Firewall BOX (Eth0)
192.168.1.3  Firewall BOX (eth1)
192.168.1.4  Server Behind Firewall BOX

Ping Test result
---------------------------
192.168.1.4 can reach 192.168.1.3
192.168.1.4 can reach 192.168.1.1
192.168.1.4 can't reach 192.168.1.2

In the same test

192.168.1.2 can reach 192.168.1.1
But not 1.3 and 1.4

I ask that because if I check my DSL route table, I see the same 
configuration like

Destination     Gateway         Genmask         Flags Metric Ref    Use 
Iface
67.68.140.1     0.0.0.0         255.255.255.255 UH    0      0        0 ppp0
192.168.1.1   0.0.0.0         255.255.255.0   U     0      0        0 eth0
127.0.0.0       0.0.0.0         255.0.0.0       U     0      0        0 lo
0.0.0.0         67.68.140.1     0.0.0.0         UG    0      0        0 ppp0

I can ping 67.68.140.1, .2, .3, .4, .5, etc....

Can you explain?


Now the configuration :D

This is the prompt command I have and will do, for other who using Slackware 
(and for me is a test to see if I understand correctly ;) ):

We asume my ISP router is 20.0.0.14/28

On the Firewall BOX

1- Connect your ISP gateway RJ-45 cable to your eth0 NIC
2- Connect your Server Switch in your eth1 NIC

On the Firewall shell

#Clean your interface and the route table
ifconfig eth0 down
ifconfig eth1 down

#Configure the both NIC using your public address you choose
ifconfig eth0 20.0.0.1 netmask 255.255.255.240 broadcast 20.0.0.15
ifconfig eth1 20.0.0.1 netmask 255.255.255.240 broadcast 20.0.0.15

#Change your route setting
route del -net 20.0.0.0/28 eth0
route add -host 20.0.0.14/32 eth0

#Set your firewall your ISP default Gateway
route add default gw 20.0.0.14

#Test
ping 20.0.0.14

(Should Work)

#On your server shell

#Clean your interface and the route table
ifconfig eth0 down

#Configure with your other public ip address
ifconfig eth0 20.0.0.2 netmask 255.255.255.240 broadcast 20.0.0.15

#Configure the default route
route add defaut gw 20.0.0.1

#Test
ping 20.0.0.14

(Should Work)

I'll tell you tomorow if it's work!, it's work on public address 
(192.168.0.1).  I dont think that will not work.

All the rest is done by the FORWARD filter rule, use the state rules to 
allow on each machine only what you want.

Martin

_________________________________________________________________
MSN Messenger : discutez en direct avec vos amis !  
http://messenger.fr.msn.ca/


