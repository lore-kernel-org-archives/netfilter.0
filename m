From: Edwin van den Oosterkamp <edwin@vandenoosterkamp.com>
Subject: IGMP packet matching and multicast routing
Date: Wed, 23 Nov 2011 11:01:30 +0100
Message-ID: <72ba20c051031719ef72675378e86951@edders.homeip.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello All,

The requirement I have is bit unusual and unfortunately I have not 
found any answers searching the archives and the Internet in general. I 
hope that if it is actually possible this knowledge will be with this 
list. I'm a programmer with quite a bit of experience on Linux kernel 
based systems, but fairly new to netfilter specifics.

My system has a VLAN interface and a standard network interface. The 
standard interface will need to receive one multicast stream (always the 
same multicast address and port) and to send one multicast stream (same 
multicast address as it is receiving for but different port). All other 
multicast traffic (in as well as out) should go over the VLAN.

The "all other multicast traffic" I have already sorted through the 
main routing table and if I could mark the IGMP packets for the other 
two streams then the routing tables I've setup should take care of those 
going out of the other interface. Unfortunately I've not yet found how 
to mark only the IGMP related to those connections while leaving the 
rest of the IGMP packets unmarked.

On the net I have seen examples using an implicit match like "-p igmp" 
but unfortunately I have not been able to find the documentation for 
these igmp matches. The examples usually only DROP all igmp and give no 
insight into the possible matches provided by "-p igmp". As such I do 
not know if dropping as actually all that you can do, or if there is 
more to this protocol match.

Could someone please point me to the documentation for the igmp match, 
or let me know a different way to solve this issue if I'm currently 
trying to solve this the wrong way?

I hope that I have been clear, if not then please let me know and will 
be more than happy to elaborate.

Best regards,

Edwin.


