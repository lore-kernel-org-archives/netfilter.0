From: CJ East <bec365195104@geckomail.org>
Subject: RE:  Multiple routes by uid-owner
Date: 14 Jul 2003 15:11:20 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1058159480.621.5.camel@broken>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


> -----Original Message-----
> From: " George Vieira " (via GeckoMail)
> [mailto:return-bec365195104-georgev-.-citadelcomputer.com.au@g
> eckomail.o
> rg]
> Sent: Monday, 14 July 2003 7:54 AM
> Subject: RE: Multiple routes by uid-owner
> 
> 
> --------------------------------------------------------------
> ------------
> This mail was received via GeckoMail.org alias 
> bec365195104@geckomail.org
> --------------------------------------------------------------
> ------------
> 
> Can you LOG all dropped packets, are you setting DROP as the 
> default for INPUT?

INPUT's policy is ACCEPT. 
Adding a LOG target to this chain does not shed any light- incoming
packets visible to tcpdump on the ppp interface *do not* enter the INPUT
chain. 

But it was a good thing to check, so thanks :D 

Yeah, owner id info is only available on the machine itself; but that's
all i need (I'm not forwarding packets or anything) 

The problem still stands-- why are correctly addressed incoming packets
visible to tcpdump but not to netfilter?  




> 
> Thanks,
> ____________________________________________
> George Vieira
> Systems Manager
> georgev@citadelcomputer.com.au
> 
> Citadel Computer Systems Pty Ltd
> http://www.citadelcomputer.com.au
> 
> Phone   : +61 2 9955 2644
> HelpDesk: +61 2 9955 2698
>  
> 
> -----Original Message-----
> From: CJ East [mailto:bec365195104@geckomail.org]
> Sent: Thursday, July 10, 2003 5:45 PM
> To: netfilter@lists.netfilter.org
> Subject: Multiple routes by uid-owner
> 
> 
> Hi, 
> 
> I'm currently trying to test several independent internet links. 
> 
> To do this, I instantiate two or more interfaces, which I aim to allow
> to route packets as though two separate machines were each 
> independently
> connected to the internet, and independently downloading some 
> file using
> http. 
> 
> - I run wget http://www.google.com with uid=500
> - I run wget http://www.google.com with uid=501 
> 
> - I set up using iptables; 
> chain OUTPUT
>  MARK all -- anywhere    anywhere  OWNER UID match 500 MARK set 0x1
>  MARK all -- anywhere    anywhere  OWNER UID match 501 MARK set 0x2
> 
> 
> - I set up using ip; 
> 
> ip rule add fwmark 1 table link1
> ip rule add fwmark 2 table link2 
> ip route add default dev ppp0 table link1
> ip route add default dev ppp1 table link2
> 
> - This all works more-or-less correctly.  
> Now, running wget and tcpdump reveals a DNS lookup going out on the
> correct interface, depending of course which userid is running. 
> 
> Notably, the SOURCE address isn't that of the PPP interface, it's of
> another (ethernet) interface in the machine.  Now, for profiling the
> connection, this is clearly unacceptable (Packets need to come back on
> the interface they were sent!)  Now, IIUC, an application can bind to
> any given source address-- but this is a bad idea in my case, since it
> requires each application be aware of its environment-- fine 
> if my test
> is ALWAYS wget (since I have the source), but bad generally. 
> 
> So, I've turned to SNAT, which I'm abusing to switch the source IP
> address to that of the ppp interface on the way out.  
> 
> A la, 
> 
> iptables -t nat -A POSTROUTING -o ppp0 -j SNAT --to-source x.x.x.x 
> 
> This certainly fixes the issue of errant source address, but now, a
> totally different problem..... Packets coming IN off the ppp interface
> (now bearing the correct address) don't appear to make it to the
> application! :( 
> 
> I had no idea what was going on, but suffice to say started messing
> around with the PREROUTING table enough to notice that these returning
> packets don't seem to traverse that hook either; they must be dropped
> somewhere in the kernel, however I'm not sure where or why.  
> I had been
> thinking that a corresponding DNAT rule (as crude as it must sound)
> would be a quick-and-dirty solution, but since the packets don't enter
> that chain.. Well, it's a non-starter :( 
> 
> Why are the packets dropped?   The requests are sent out over the same
> interface on which they are received (Which is a noted caveat for
> netfilter).  
> 
> 
> 
> 
> 
> 
> 
> 
> 


