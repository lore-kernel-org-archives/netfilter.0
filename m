From: <jwexler@mail.usa.com>
Subject: Bidirectionally Route all traffic to an ip to another ip
Date: Mon, 26 Jul 2010 18:23:39 +0900
Message-ID: <00bf01cb2ca4$3d6af6f0$b840e4d0$@usa.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: ja
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Greetings,

I need to be able to do the following:

Physical Router located at 192.168.40.1

On Ubuntu 10.04 Lucid machine:
eth0 with static ip 192.168.40.2
eth1 with static ip 192.168.40.3
eth2 with static ip 192.168.40.4

Associate a virtual address to eth1 with an entirely different network
address such as 192.168.50.1
Do the same (virtual address) for eth2 -- e.g. 192.168.60.1

In the application:
register phone number A at 192.168.40.1 (The application will automatically
use eth0 for this)
register phone number B at 192.168.50.1
register phone number C at 192.168.60.1

Somehow forward all traffic (including the register request) sent to
192.168.50.1 to 192.168.40.1 as if the register had been made directly to
192.168.40.1. In other words, the app "sends" registration and traffic to
192.168.50.1 but then Ubuntu forwards it to 192.168.40.1 (but the app does
not know that).

Similarly, forward all traffic sent to 192.168.60.1 to the router at
192.168.40.1.

Do the same for the reverse, forward all traffic that the router sends back
to 192.168.40.3 (eth1) to 192.168.50.1 (within the Ubuntu machine) so that
the app knows it is for phone B.
Similarly forward all traffic that the router sends back to 192.168.40.4
(eth2) to 192.168.60.1 so that the app knows it is for phone C.

Thus, the application believes that it is registering at 3 completely
separate routers on 3 completely separate networks via 3 separate network
interfaces but in fact is really registering all three to the same router
(but does not know that).

Similarly, the router believes that it is receiving 3 separate registrations
because it receives each registration request and traffic from 3 separate
interfaces and thus 3 separate mac addresses (i.e., of eth0, eth1, and
eth2).

Traffic sent to and from the router for each of the 3 phone numbers (via
eth0, eth1, and eth2) are not mixed because the translation happens in both
directions.

I have been searching via google and looking into iptables specifically but
am lost. Apparently this is possible via iptables.

For example, I tried the following but it did not work:

iptables -t nat -A PREROUTING -d 192.168.50.1 -p all -j DNAT
--to-destination 192.168.40.1 
iptables -t nat -A POSTROUTING -o eth5 -d 192.168.40.1 -j SNAT --to-source
192.168.50.1
iptables -t nat -A PREROUTING -d 192.168.40.3 -p all -j DNAT
--to-destination 192.168.50.1
iptables -t nat -A POSTROUTING -o eth5 -d 192.168.50.1 -j SNAT --to-source
192.168.40.3

eth5 inet addr:192.168.40.3 broadcast:192.168.40.3 mask:255.255.255.255
eth5:1 Link encap: ethernet inet addr:192.168.50.1 broadcast:192.168.50.255
mask:255.255.255.255

I would greatly appreciate it if folks could tell me what the iptables
commands are to enable this.
 
I am just trying to get my 3 phone numbers in Asterisk to register with my
router which due to limitations of Asterisk and the router requirement to do
the above configuration.

Thanks
JW

