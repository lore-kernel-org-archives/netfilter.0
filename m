From: "Julio A. Romero" <julioarr@fisica.uh.cu>
Subject: Please help me with a doubt about options '-i' and '-o'
Date: Fri, 19 Aug 2011 21:43:28 -0400
Message-ID: <6DEA16417ACA45DF9BB7F9BD28454269@poweredge1800>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@vger.kernel.org

I have a BOX with two interfaces (eth1 and eth2) between two different 
networks (Net1 and Net2). Something like that:



[Net1]<->[eth1 BOX eth2]<->[Net2]



Net1:192.168.1.0/24

eth1:192.168.1.1

Net2:192.168.2.0/24

eth2:192.168.2.1



When I do a ping from 192.168.2.200 to 192.168.1.1, this classifies as INPUT 
and the answer as OUTPUT, or not?



In this case, what interface (eth1 or eth2) could be referring with the 
options '-i' and '-o'?



iptables -A INPUT -p icmp -m icmp --icmp-type echo-request -i eth? -s 
192.168.2.200 -d 192.168.1.1 -j ACCEPT


iptables -A OUTPUT -p icmp -m icmp --icmp-type echo-reply -o eth? -s 
192.168.1.1 -d 192.168.2.200 -j ACCEPT






man page say:



       [!] -i, --in-interface name
              Name of an interface via which a packet was received (only for 
packets entering the
              INPUT, FORWARD and PREROUTING chains).  When the "!" argument 
is  used  before  the
              interface  name,  the sense is inverted.  If the interface 
name ends in a "+", then
              any interface which begins with this name will match.  If this 
option  is  omitted,
              any interface name will match.

       [!] -o, --out-interface name
              Name  of  an interface via which a packet is going to be sent 
(for packets entering
              the FORWARD, OUTPUT and POSTROUTING chains).  When the "!" 
argument is used  before
              the  interface  name,  the sense is inverted.  If the 
interface name ends in a "+",
              then any interface which begins with this name will match.  If 
this option is omit-
              ted, any interface name will match.



 but...?



Thanks,

Julio

