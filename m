From: George Alexandru Dragoi <waruiinu@gmail.com>
Subject: Re: Wierd problem with irqs
Date: Wed, 14 Jul 2004 06:57:49 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3063e5040713205720cd6fbf@mail.gmail.com>
References: <017901c468e1$2c7aeb80$3b7819c4@PHAKE>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <017901c468e1$2c7aeb80$3b7819c4@PHAKE>
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
To: tanuki <phake@sadomain.co.za>
Cc: netfilter@lists.netfilter.org

I think it is hardware related(well, DOH), which is causing large
packets dropping. You could try sending ping of different packets
size, and see when they begin to get dropped


----- Original Message -----
From: tanuki <phake@sadomain.co.za>
Date: Tue, 13 Jul 2004 15:56:19 +0200
Subject: Wierd problem with irqs
To: netfilter@lists.netfilter.org









Hi all

 

 

had an interresting problem the other day, just 
thought i'd share it with you all and see if 

any body else had a similar experience. 


 

 

I set up a small nat/firewall box for a client of 
ours. we had 5 interfaces and they were as follows 

 

eth0   192.168.10.1 netmask 
255.255.255.255 pointopoint 192.168.10.2   <--- adsl modem 
 doing nat 

eth1   192.168.0.1 netmask 
255.255.255.0 

eth2   192.168.1.1 netmask 
255.255.255.0

eth3   192.168.2.1 netmask 
255.255.255.0

eth4    192.168.3.1 netmask 
255.255.255.255 pointopoint 192.168.3.2 <-- some upstairs router 


 

and the routing table looked like you would expect 
it to, with 

 

route add default gw 192.168.10.1 dev eth0 


 

also we had 

 

echo "1" > /proc/sys/net/ipv4/ip_forward 


 

for simplicity , iptables rules were as follows 


 

iptables -t nat --append POSTROUTING -o eth0 --jump 
MASQUERADE 

 

so, now all traffic using 192.168.0.1 , 1.1, 2.1 
and 3.1 as a gateway should be able to reach the 

internet via the modem on 192.168.10.2 , right ? 


 

well, all icmp worked, perfectly 

 

but everything else , ie , udp, tcp didn't 


 

say for example http : packets get sent to tcp 80, 
tcp replies get recieved, but no data gets back to 

the user on 192.168.whatever

 

strange huh ? 

 

so i thought my mtu was befuqed, so i do 


 

iptables --append FORWARD --proto tcp --tcp-flags 
SYN,RST SYN --jump TCPMSS --clamp-mss-to-pmtu 

 

no luck though. 

 

tried a plethora of other stuff too , but didn't 
work, so i'll leave that there 

 

obviously the nat works, becuase all my icmp's are 
natted. 

mmm

 

so i go into the boxes bios set up and tell it to 
assign irq's to all pci devices automatically 

 

boot up into linux and do 

 

ifconfig eth4 up 

 

eth4: error fetching interface information: Device 
not found


eh ? wtf ? so i do 
ifconfig eth0 up 

 

and the device gets brought up 

 

then i do ifconfig eth4 up 

 

and it brings it up . Strange huh ? 

 

so now i see that all my cards are swopped arround. 
that which used to be eth0 is now eth4 and so 

on and so on. 

 

anyway, plug in the appropiate network cables to 
the relevant nics and run the script 

 

to a ping to google.com ... everything works fine. 


right, so far so good. right back were i 
started

 

now, do a HTTP-GET http://www.google.com and guess what 


i get a lovely html page. 

 

strange that changing the device irg assignment in 
the bios solved my problem ? 

 

any ideas what could have caused this ? 


 

thanks a lot for bearing with my idiotic ramblings 
so far 

 

----------------

 

tanuki

