From: jeroen <jer@chess.nl>
Subject: port forwarding fails
Date: Wed, 11 Aug 2004 13:51:47 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <411A0853.7010204@chess.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

Hi,

I new to this list and probably making a stupid mistake but after trying 
(and reading the docs) for 2 days I'm desparate to get this working.

This is what I want :
                                                
|--------------|                                           
|------------------|
|---------|  192.168.0.33          |embedded     | 
10.x.x.x                10.x.x.x. |host                     |
|webcam |----------------------|router            
|-----------------------------|                           |
|---------|           192.168.0.13 |                     |ppp0         
gprs                    |                           |
                                          eth0| 
-------------|                                            
|------------------|

I want to 'transparent' reach the webcam through the grps connection 
from the host, on the embedded box I use the rules :
iptables -t nat -A PREROUTING -i ppp0 -p tcp -d <ppp0 ip> --dport 80 -j 
DNAT --to 192.168.0.33:80
iptables -A FORWARD -i ppp0 -o eth0 -p tcp -d 192.168.0.33 --dport 80 -j 
ACCEPT

With this setup I can see traffic, by led indication on the webcam, if I 
request http://<ppp0 ip> from the host. Unfortunatly packets aren't 
coming back. I tried MASQUERADING rules and SNAT but no suc6 either.

my embedded box settings :
root@openembedded:~# route
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use 
Iface
127.0.0.1       *               255.255.255.255 UH    0      0        0 lo
192.168.0.0     *               255.255.255.0   U     0      0        0 eth0
10.0.0.0        *               255.0.0.0       U     0      0        0 ppp0
default         10.7.20.6       0.0.0.0         UG    0      0        0 ppp0

root@openembedded:~# ifconfig
eth0      Link encap:Ethernet  HWaddr 00:11:22:56:42:AB
          inet addr:192.168.0.13  Bcast:192.168.0.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:794 errors:1 dropped:1 overruns:0 frame:0
          TX packets:8 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:65934 (64.3 KiB)  TX bytes:508 (508.0 B)
          Interrupt:7 Base address:0x300

lo        Link encap:Local Loopback
          inet addr:127.0.0.1  Mask:255.0.0.0
          UP LOOPBACK RUNNING  MTU:16436  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

ppp0      Link encap:Point-Point Protocol
          inet addr:10.7.20.6  P-t-P:10.6.0.1  Mask:255.255.255.255
          UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1500  Metric:1
          RX packets:51 errors:0 dropped:0 overruns:0 frame:0
          TX packets:48 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:3
          RX bytes:3786 (3.6 KiB)  TX bytes:3642 (3.5 KiB)

and finally :

root@openembedded:~# iptables -L
Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination
ACCEPT     tcp  --  anywhere             192.168.0.33        tcp dpt:www

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
root@openembedded:~# iptables -L -t nat
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
DNAT       tcp  --  anywhere             10.7.20.6           tcp dpt:www 
to:192.
168.0.33

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination


Please let me know if this setup should work, I'm starting to doubt 
everything including my own sanity...

thanks,

Jeroen


