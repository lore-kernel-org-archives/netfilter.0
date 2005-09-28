From: Piotr Holubniak <piotr.holubniak@neostrada.pl>
Subject: iptables spof address problem
Date: Wed, 28 Sep 2005 22:49:45 +0200
Message-ID: <433B01E9.6050700@neostrada.pl>
Reply-To: piotr.holubniak@neostrada.pl
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

Hello everyone

I have simple question.

Lets assume that we have Linux with IP=10.0.0.2 with iptables and it is 
logging all incomming ssh connection. Log file contains both IP and MAC 
addresses of the computers which bind to this service.
Lets assume that we have another PC connected into LAN with IP=10.0.0.100.

Attacker with IP  = 10.0.0.200 runs:
hping2  -S --spoof  10.0.0.100 -p 22 --faster 10.0.0.2  - which will 
cause DoS of SSH service on 10.0.0.2

Netfilter logs all incomming on 22 port traffic. It shows that 
connections come from IP 10.0.0.100 and it shows real MAC address of 
this computer (10.0.0.100) instead of MAC address of attackers computer 
(IP 10.0.0.200).

So result is that we think that real attacker is computer with IP 10.0.0.100

Moreover.

Lest assume that spoofed  address is IP which is not assignet in the 
local network. Netfilter logs incomming traffic but it shows MAC address 
unknown or completely unpredictable (Windows shows all 0-ros, Linux 12 
bytes long MAC address).

Result is that we completely don't know who is the attacker, cannot 
track him down even we have registered MAC addresses of all computers in 
local network.  

It works like this with FC4, also have this problem on RedHat 3.0.

How can I make netfilter to log MAC address of the attackers computer, 
not this one which is resolved by TCP/IP stack ? Is it possible?

Regards

PiotrH
 


