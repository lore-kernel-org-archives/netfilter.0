From: manish <manishsoft@yahoo.com>
Subject: Help...
Date: Wed, 11 Dec 2002 09:45:05 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021211174505.57421.qmail@web13704.mail.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

Hello 
Its really nice to see a detail information about NAT
in Linux 2.4 NAT HOWTO.It works well but i have a
small problem, i m not able to connect to voice from
my internal LAN to the internet. I am giving you the
details, which will help you to understand my problem.

   A----------B----------C
   	      |
	      |
	      |
	      D
  
Here A is my windows client with IP address
192.168.101.1 Mask 255.255.0.0
Here B is my Linux7.3 Server with IP address
192.168.0.1 Mask 255.255.0.0
B is also connected to Internet with Generic Serial
Modem (ppp0).
Here C is my windows client with IP address
192.168.101.3 Mask 255.255.0.0
Here D is my Linux client with IP address 192.168.80.1
Mask 255.255.0.0.
I am sharing internet to all my client i.e A, C and D.
using this command.

> iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
# Turn on the IP forwarding
  echo 1 > /proc/sys/net/ipv4/ip_forward

Upto this everything works fine all clients (A, C, D)
share internets.
Now if i wanted to start any chat services i.e Yahoo
Messenger or vat tool the person who has logged on
from A not able to use audio chat to person
logged on from C or D.
or even a person who is also online from out of this
network also not able to call or do voice chat.
# I had use this command after that
> iptables -t nat -A PREROUTING -i ppp0 -j DNAT
--to-destination 192.168.101.3
This time i am able to call people from outside from
machine C (192.168.101.3) and also able to do voice
conversation in vat. But another side A and D are not
able to talk to that person outside the network. Also
the above command will not for other hosts A and D. At
a time only one machine is able to make a vat
connection from B.

1) What should i do so A, C, and D all together can
use to call outside and able to do voice conversation
in vat?
2) what should i do so A can talk to B in yahoo or vat
voice chat?

please let me know that is there any solution for my
problem?
Thanks
Regards.

Manish.

__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com

