From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: SNAT
Date: Tue, 09 Oct 2007 14:47:16 -0500
Message-ID: <470BDAC4.9020206@riverviewtech.net>
References: <470BCCC7.2070007@corp.web.com>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <470BCCC7.2070007@corp.web.com>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 10/09/07 13:47, Chad Eldridge wrote:
> I have a situation where I have packets coming into a server (we'll 
> call it RTR) and getting routed to other servers depending on the ip 
> address the packet is coming from. This part works great. The problem 
> I am having is when the server (call it Responder) answers back to 
> the original client (not going back through RTR), the client sees the 
> traffic coming from an address it did not originally try to open a 
> connection to and therefore rejects the packets and the connection is 
> never established. I thought I could fix this by using SNAT to change 
> the source ip on Responder.
> 
> iptables -t nat -A POSTROUTING -p tcp -m tcp --sport $PORT -j SNAT 
> --to $RTR-IP

Ah, you are falling victim to what I consider a communications triangle. 
  You are describing exactly what happens.  A connects to B, B redirects 
to C, C responds to A, and A is rather distraught that B is ignoring him 
/ her while this yahoo C is not using proper protocol / grammar to start 
a conversation.

> This however, seems to do nothing. The Responder still sends replies 
> to the client, they make it to the client and show up as coming from 
> the ip address of Responder.

Where did you try to SNAT?  Were you trying to SNAT on RTR to make the 
Responder think the traffic came from RTR or were you trying to SNAT on 
the Responder to make the traffic to the client look like it came from 
RTR?  I'm guessing the second method seeing as how the first should have 
worked (and has for me).  I suppose that if you could get the source IP 
of the traffic from Responder to really be that of RTR things would work 
too, but I'm not sure what type of reverse path issues you will have / 
need to over come.

> It was suggested to me that I would need to turn off rp_filter (echo 
> 0 /proc/sys/net/ipv4/conf/all/rp_filter; echo 0 
> /proc/sys/net/ipv4/conf/eth0/rp_filter) since the ip address I am 
> trying to change the source to does not actually exist on the server. 
> I tried that but it did not seem to help. Further more it was 
> suggested that I could setup the $RTR-IP on a loopback and arptables 
> it off and then it should work. This did not work either. If it is 
> because iptables is trying to prevent spoofing I'm guessing it is 
> stopping it because it's trying to send it out an interface that does 
> not have the ip on it. Then again, all of this guessing could be 
> wrong.

Well to start with, you do not want to use the loop back interface 
because the kernel will protect it at all costs.  In short, the only 
thing that can communicate with the loop back device is the loop back 
device its self.  Any and all attempts that I'm aware of to over come 
this short of an application layer proxy that binds to loop back and 
other interfaces will most likely fail with out some kernel patching.

I feel like I just answered a similar question with in the last week or 
so.  I think that question had to do with pseudo load balancing though. 
  However the answer to that question fits here too.

> Is this even possible with iptables? If so, how can I accomplish it? 
> Everything I have seen that seems like it should work has so far 
> failed.

I'm not sure if IPTables can solve this its self or not.  You may need 
some help from bridging and EBTables.

I have to ask, are the responders hidden behind the router?  I'm 
guessing now because it sounds like the responder is talking directly 
back to the client.  Thus are the router and responders in the same 
subnet / broadcast domain?  For the sake of conversation I'm going to 
presume the latter.  So let's have some ASCII art to help explain this.

                  +------------+
                  | Default GW |
                  +-----+------+
                        |
     +------------+-----+------+------------+
     |            |            |            |
+---+----+   +---+----+   +---+----+   +---+----+
| Router |   | Host A |   | Host B |   | Host C |
+--------+   +--------+   +--------+   +--------+

Let's presume for the sake of conversation that a client connects in to 
Router from the internet.  Router decides to redirect the traffic to 
Host A based on the source IP address.  At the same time a different 
client connects in to Router from the internet.  However this second 
client is from a different IP address and as such Router decides to 
redirect the traffic to Host C.

Router and Hosts A, B, and C, all need to have the same IP bound to an 
interface that will allow non localhost communications to them (read: 
not loop back).  Hosts A, B, and C need to NOT respond to ARPs from 
Default GW to find the IP in question so that you can be sure that 
Router will respond and be found.  Thus Default GW will send the packets 
destined to the target IP to Router.  Router will then need to redirect 
the packets over to Host A or B or C as it sees fit.  Hosts A, B, and C 
will then receive the packet and process the request and respond in kind 
back out Default GW.  This way, the original client will see the correct 
source IP on the reply traffic.

Using EBTables Router can alter the destination MAC address the packets 
coming in based on the source IP.  Thus you can use EBTables to redirect 
some traffic to Host and some to Host B and some to Host C as you see fit.

You may need to have multiple IP addresses bound to the network 
interfaces of Hosts A, B, and C so that they respond from the correct 
source IP while using Default GW on a different subnet so that Default 
GW does not update it's ARP cache with the new MAC addresses of Host A 
or B or C.

At least as I understand it, this is how one mode of LVS operates.  This 
will also work for what you are wanting to do.

> iptables v1.2.8
> Redhat ES3
> (Final box will probably be running ES4)

As long as you include EBTables and / or LVS in the mix I don't think 
the difference between ES3 and ES4 will matter.

> Thanks,

*nod*

Good luck.



Grant. . . .
