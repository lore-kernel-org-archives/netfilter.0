From: manish <manishsoft@yahoo.com>
Subject: Help...
Date: Wed, 18 Dec 2002 07:00:47 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021218150047.61968.qmail@web13709.mail.yahoo.com>
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
To: netfilter@lists.netfilter.org

Hello 
Can any one look up to my problem. The problem is:
I have set up a small lan with both wired and wireless
clients, here i am describing only wired lan.

I am giving you the details, which will help you to
understand my problem.

    A----------B----------C
               |
               |
               |
               D

Here A is my windows client with IP address
        192.168.101.1 Mask 255.255.0.0
Here B is my Linux7.3 Server with IP address
        192.168.0.1 Mask 255.255.0.0
      B is also connected to Internet with Generic
        Serial Modem (ppp0).
Here C is my windows client with IP address
        192.168.101.3 Mask 255.255.0.0
Here D is my Linux client with IP address
        192.168.80.1 Mask 255.255.0.0.
I am sharing internet to all my client i.e A, C and D.
using this command.
>iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
# Turn on the IP forwarding
>echo 1 > /proc/sys/net/ipv4/ip_forward

Upto this everything works fine all clients (A, C, D)
share internets.
Now if i wanted to start any chat services i.e Yahoo
Messenger or vat tool the person who has logged on
from A not able to talk to person logged on from C or
D. or even a person who is also online from out of
this network (Somewhere from internet)also not able
to call or do voice chat.
# I had use this command after that
>iptables -t nat -A PREROUTING -i ppp0 -j DNAT
 --to-destination 192.168.101.3

This time i am able to call people from outside from
machine C (192.168.101.3)and also able to do voice
conversation in vat. But another side A and D are not
able to talk to that person outside the network. Also
the above command will not work for other hosts A and
D. At a time only one machine is able to make a vat
connection from B.

1) What should i do so A, C, and D all together can
  use to call outside and able to do voice
conversation
  in vat or vive-versa?
2) what should i do so A can talk to B in yahoo or vat
 voice chat?

please let me know that is there any solution for my
problem? Mostly i wanted to run vat?
Thanks
Manish.


__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com

