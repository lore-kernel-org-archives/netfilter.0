From: sinkyh@onid.orst.edu
Subject: pinging and routing tables
Date: Mon, 30 Nov 2009 17:53:24 -0800
Message-ID: <20091130175324.71602i65gacqf30g@webmail.oregonstate.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="flowed"
To: netfilter@vger.kernel.org

Hello all,

I have, I hope, a simple question. From my understanding, by default  
ping looks up up the IP address in the Linux kernel routing tables.  
What happens if the IP is not in the routing table? Is the ping packet  
simply dropped?

The reason I ask this is that I have a few wireless devices for  
testing purposes and I am using iptables to mimic a particular  
topology. Mainly forcing the presence of only two possible routes from  
a source to a destination over a series of hops. These devices have  
their own routing protocol and basically routes are added/ deleted  
from the Linux kernel routing tables based on metric measurements bla  
bla bla. That is just fine and normal.

However, since the devices are all in range of each other (due to  
space restriction), if lets say the destination node IP is temporarily  
lost from the source's routing table, for some reason the source is  
still able to ping the destination directly. I assumed that if an IP  
is not in the source's routing table that the outgoing ping would be  
dropped/ ignored until the IP reappears. Not continue on ignoring  
routing tables....

Can anyone shed some light on this?

Thanks for your help and suggestions.
