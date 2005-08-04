From: Dave Johnson <davejohnson_hifi@yahoo.com>
Subject: RE: Help needed for a box with 4 Ethernet Interfaces
Date: Thu, 4 Aug 2005 12:47:04 -0700 (PDT)
Message-ID: <20050804194704.53722.qmail@web30109.mail.mud.yahoo.com>
References: <E656E2CC1C5AEB42ACB00EB83122C7741FCA52@farmer.vikus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <E656E2CC1C5AEB42ACB00EB83122C7741FCA52@farmer.vikus.com>
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
Content-Type: text/plain; charset="us-ascii"
To: Derick Anderson <danderson@vikus.com>, netfilter@lists.netfilter.org


Derick:
As I mentioned earlier, box A and C have 2 interfaces. One of them has 192.168.0.x based address
and the other one is connected to Box B via Eth1.
Here is how it looks like: 
                                                                         ------------
                                            -----------------------------|  Box D   |
                              172.16.6.10   |                            |          |
         Mgmt Port<---------------------|   |                            ------------
                                        |   | 192.168.0.1                 192.168.0.2
                                   Eth0 |   | Eth1 (for internal network)
 ------------                        ------------                          ------------
 |  Box A   |10.1.1.1--------10.1.1.2|  Box B   |21.21.21.2 -----21.21.21.1|  Box C   |
 |          |Eth1                Eth2|          | Eth3                 Eth1|          |
 ------------     10.1.1.0/24        ------------       21.21.21.9/24      ------------
  192.168.0.1(eth0)                   192.168.0.3                          192.168.0.2 (eth0)


Eth2 and Eth3 on Box B are data interfaces, Eth1 is for internal use, and Eth0 is mgmt port. 

Purpose of this configuration is to isolate interfaces on Box B into 2 groups so data traffic can 
only flow among Eth0, Eth2 and Eth3. Currently, data packets destined for dest addr 192.168.0.1
are handled by Box B and are not forwrded to Eth2 for Box A. 

Thanks

Dave.


--- Derick Anderson <danderson@vikus.com> wrote:

> OK, let me see if I understand: Boxes A and C have 2 interfaces, Box D
> has one, and Box B has 4. What are the other two interfaces doing on A
> and C? Each pair of interfaces that connect physically *must* be on the
> same subnet, period. You can have two boxes with the same IP in the same
> subnet, but there must be a different subnet between them (requiring not
> one but two routers) or the routes will *never* work. An example of this
> would be a client on a private network connecting to a server on a
> private network via the Internet (the (x)'s are routers, like your box
> B):
> 
> Client [192.168.0.2] > (x) > Internet > (x) > Server [192.168.0.2]
> 
> You simply cannot do this:
> 
> Client [192.168.0.2] > (x) > Client [192.168.0.2]
> 
> whether traffic is allowed through or not. The router can't do it. If
> each box is in it's own subnet, then you'll be fine. If you want two
> boxes in the same subnet, put them both on a hub or switch. Without
> knowing the purpose of this configuration I'm not sure I can help out
> much more than that.
> 
> Derick Anderson
> 
> -----Original Message-----
> From: Dave Johnson [mailto:davejohnson_hifi@yahoo.com] 
> Sent: Thursday, August 04, 2005 1:25 PM
> To: Derick Anderson; netfilter@lists.netfilter.org
> Subject: RE: Help needed for a box with 4 Ethernet Interfaces
> 
> 
> Derick:
> 
> Thanks very much for your response. However as I mentioned in my
> previous email, box A and C have
> 2 interfaces. 
> Issue here is that any packet coming in on Eth2/Eth3 for 192.168.0.x
> needs to be routed to
> Eth2/Eth3 only, not to Eth1 (which is local interface). For example, if
> Box C pings Box A on 192.168.0.1, Box B intercepts that becuase it has
> 192.168.0.1 as its local interface and starts to respond back to Box C.
> 
> Thanks
> 
> Dave
> 
> 
> 
> --- Derick Anderson <danderson@vikus.com> wrote:
> 
> > If the drawing is messed up I apologize - Outlook doesn't seem to like
> 
> > plain-text stuff.
> > 
> > -----Original Message-----
> > From: netfilter-bounces@lists.netfilter.org
> > [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Derick 
> > Anderson
> > Sent: Thursday, August 04, 2005 1:01 PM
> > To: netfilter@lists.netfilter.org
> > Subject: RE: Help needed for a box with 4 Ethernet Interfaces
> > 
> > Wow. First, let's give some names to each box so we both know which 
> > one I'm referring to. The box (box "B" in your diagram) with 4 
> > interfaces is your router. Boxes A, C, and D will be called as 
> > "internal boxes" as a group.
> > 
> > You must realize that you can't set up interfaces on your router with 
> > the same IP address. If you want Box A to connect to Box B, /through/ 
> > the router (rather than say, through a hub), then you must either 
> > separate the subnets or bridge the two interfaces.
> > 
> > Secondly, each of your internal boxes must use the same subnet as the 
> > interface they connect to. For example, according to your diagram, Box
> 
> > C has an address of 192.168.0.2, and is attempting to connect to 
> > 21.21.21.9. Unless your netmask (usually 255.255.255.0) is 0.0.0.0, 
> > Box C will not be connecting to your router by design.
> > 
> > Third, a loopback interface is not a physical interface, it is a 
> > virtual one and is set to 127.0.0.1 (as I recall the entire 
> > 127.0.0.0/8 network is reserved for it). Your box cannot function as a
> "loopback interface."
> > 
> > Now as to your goals - can I ask what exactly you are trying to do? In
> 
> > order to separate each of these boxes, I'll redo your diagram for you:
> > 
> >  
> > ------------
> >  
> > -----------------------------|  Box D   |
> >                               172.16.6.10   |      192.168.0.1/24
> > |          |
> >          Mgmt Port<---------------------|   |
> > ------------
> >                                         |   | 192.168.0.1
> > 192.168.0.2
> >                                    Eth0 |   | Eth1 (for internal
> > network)
> >  ------------                        ------------
> > ------------
> >  |  Box A   |________________________|  Box B
> > |________________________|  Box C   |
> >  |          |                    Eth2|          | Eth3
> > |          |
> >  ------------     10.1.1.0/24        ------------       21.21.21.0/24
> > ------------             
> >   10.1.1.1                       10.1.1.1     21.21.21.1
> > 21.21.21.2
> > 
> > This will allow your boxes (given the correct routing tables on your
> > router) to actually communicate with the router. You can then use 
> > iptables to decide which packets can go where. For (a partial)
> example:
> > 
> > $IPT -P FORWARD DROP
> > $IPT -A FORWARD -i eth2 -o eth3 -j ACCEPT $IPT -A FORWARD -i eth3 -o
> > eth2 -j ACCEPT $IPT -A FORWARD -i eth0 -j ACCEPT $IPT -A FORWARD -o 
> > eth0 -j ACCEPT
> > 
> > So what you are doing here is accepting packets that are coming [i]nto
> > eth2 and going [o]ut eth3, into eth3 and out eth2, and anything 
> > destined to go in or out eth0 (determined by your routing tables) will
> 
> > be allowed.
> > 
> > You could (and should) use iptables to ensure that the appropriate IPs
> 
> > are going out the appropriate interfaces, in addition to the proper 
> > ports, but there's a bunch of neat guides on www.netfilter.org you 
> > should look at before doing too much on your own. You should also 
> > consider learning a lot more about networking.
> > 
> > Hope that helps, and if I missed anything here someone will point it 
> > out (that's my money-back guarantee).
> > 
> > Derick Anderson
> > 
> > 
> > -----Original Message-----
> > From: netfilter-bounces@lists.netfilter.org
> > [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Dave 
> > Johnson
> > Sent: Thursday, August 04, 2005 12:12 PM
> > To: netfilter@lists.netfilter.org
> > Subject: Help needed for a box with 4 Ethernet Interfaces
> > 
> > Hi All:
> > I need help to setup my box with some complicated configuration.
> > 
> > I have a box with 4 Ethernet Interfaces:
> > 
> > Eth0: 172.16.6.10
> > Eth1: 192.168.0.1/24
> > Eth2: 10.1.1.0/24      ------> Connected to a box A with an IP address
> > of 192.168.0.2
> > Eth2: 21.21.21.9/24    ------> Connected to a box C with an IP address
> > of 192.168.0.1 (which is
> > same as IP address of Eth1)
> > 
> > Loopback Interface: 192.168.0.3
> >  
> > ------------
> >  
> > -----------------------------|  Box D   |
> >                               172.16.6.10   |
> > |          |
> >          Mgmt Port<---------------------|   |
> > ------------
> >                                         |   | 192.168.0.1
> > 192.168.0.2
> >                                    Eth0 |   | Eth1 (for internal
> > network)
> >  ------------                        ------------
> > ------------
> >  |  Box A   |________________________|  Box B
> > |________________________|  Box C   |
> >  |          |                    Eth2|          | Eth3
> > |          |
> >  ------------     10.1.1.0/24        ------------       21.21.21.9/24
> > ------------             
> >   192.168.0.1                         192.168.0.3
> > 192.168.0.2
> > 
> > Here is what I want to do:
> > Packets from Eth2 should only go to Eth3 except the ones detined to 
> > Eth0's IP.
> > Packets from Eth3 should only go to Eth2 except the ones detined to 
> > Eth0's IP.
> > Local packets destined for Eth1's ip and its subnet should be 
> > forwarded via Eth1 only.
> > Packets from Eth1 can only be directed to Eth0. 
> > 
> > This will allow me to ping Box A (192.168.0.1) from Box C 
> > (192.168.0.2) without getting a response from Box B who has local 
> > interface with address 192.168.0.1.
> > 
> > Basically I want to isolate interfaces in 2 groups:
> > One with Eth0, Eth2 and Eth3
> > Second with Eth0 and Eth1.
> 
=== message truncated ===


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

