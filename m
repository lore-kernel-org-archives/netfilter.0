From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: HELP! Transparent Proxy using bridging 2.6.9 and REDIRECT on
 different subnet
Date: Thu, 24 Mar 2005 00:25:14 -0600
Message-ID: <42425D4A.20301@riverviewtech.net>
References: <2F413D5F33545D4A8465BBEE900238CC3FA777@cymmail.cymphonix.com>
Reply-To: gtaylor@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <2F413D5F33545D4A8465BBEE900238CC3FA777@cymmail.cymphonix.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Trevor Paskett <tpaskett@cymphonix.com>
Cc: coreteam@netfilter.org, netfilter@lists.netfilter.org

The more that I think about this the more that I think it is possible to do, though not as you might think.

For the sake of arguing let's restate / layout the network as it will be in production:

[ Test  System(s) ] <---> [Linux 2.6.9 System] <---> [ INet   Router ]
 (192.168.255.152)                                    (192.168.255.1)
                            (192.168.12.165)          (192.168.12.1 )

Again the firewall rule that you propose:

iptables -t nat -A PREROUTING -i br0 -p tcp --dport 80 -j REDIRECT --to-port 3128

At first glance this seems as if it would work.  Indeed the traffic will make it from the "Test System(s)" to the "Linux 2.6.9 System" and in to Squid.  The problem is that when the traffic comes in to "Linux 2.6.9 System" running Squid it will be seen as from a "Test System's" IP address of 192.168.255.152 thus when the "Linux 2.6.9 System" running Squid replies it will have to do so from it's NIC on 192.168.12.165 to 192.168.255.152.  (We will assume that the "Linux 2.6.9 System" has a route to the 192.168.255.x/24 network via the "INet Router".)  Seeing as how the "Test System" would have sent the traffic out of it's NIC from 192.168.255.152 to 12.34.56.78 it would not like the response that it believes it should get appearing to come from 192.168.12.165 and thus drop the packet as part of the normal TCP/IP stack operation.  Thus we have to get the traffic to enter the "Linux 2.6.9" s
 ystem in such a way as it can subsequently leave it from the address that the "Test System
" is expecting a response from, i.e. 12.34.56.78.  Rather than using REDIRECT I propose something more along the lines of what I had to do on my Transparent Prosy earlier today.

iptables -t nat -A PREROUTING -i br0 -p tcp --dport 80 -j DNAT --to-destination 127.0.0.1:3128
iptables -t nat -A POSTROUTING -o lo -p tcp --dport 3128 -j SNAT --to-source --to-source 127.0.0.1:3128

This should allow all traffic that is passing through br0 (presumably originating from systems behind the "Linux 2.6.9 System" away from the "INet Router") to be DNATed to the localhost.  The DNAT code will / should maintain the original destination IP address to unDNAT when it comes back through in reverse direction (black magic here).  To alleviate the problem of Squid replying directly to the "Test System(s)" directly we need to SNAT the traffic as it is on it's way out (first step in the process to reach Squid) the lo interface.  Thus Squid will see all traffic as coming from the "Linux 2.6.9 System" lo interface and reply to it there vs the "Test System(s)" directly.  As such when Squid replies to the traffic it will pass back through the lo interface and be unSNATed back to the original source of the "Test System(s)" and subsequently unDNATed back to the original destination of the
  original packets.  Here in lies the rub, seeing as how the "Linux 2.6.9 System" does not 
have a directly attached interface to the 192.168.255.x/24 subnet it will send the traffic to it's default gateway (or any gateway that is established as a route to the 192.168.255.x/24 subnet).  So the "INet Router" will have to be configured to allow traffic that appears to be coming in to it from it's internal interface with a globally routeable (internet) IP and back out to the destination IP address on the same interface.

With this type of configuration the traffic will pass from the "Test System(s)" in to the "Linux 2.6.9 System" br0 interface and then be redirected, DNATed, SNATed, in to Squid on lo and then out of Squid, unSNATed, unDNATed, and then to the "INet Router", out of the "INet Router" in to the "Linux 2.6.9 System" br0 interface (with a source, not destination port of 80 (thus bypassing the rule that started this charade)), out the "Linux 2.6.9 System" br0 interface and back in to the "Test System(s)" ethernet interface appearing as if the traffic did come from the world back in.  Thus your packets will have a VERY convoluted path to and from the supposed internet site.  You will also have to be able to control and / or allow some VERY weird inbound IPs on the internal side of the "INet Router".  Unfortunately I don't know of another way to get the "Linux 2.6.9" system to send traffic back t
 o the 192.168.255.x/24 subnet.  I'll keep thinking / digging on it.

Also know that this is untested as of yet so I don't know if it will work for sure or not with the Squid process on the same interface as where the SNATing is going on.  I will be testing this on a system I have at my house with SSH to see if I can get this to work or not.  If I am correct and this works I should be able to make it appear as if I'm SSHed in to my system from 127.0.0.1.  Wish me luck!



Grant. . . .

Trevor Paskett wrote:
> Thanks for your reply. Our product is a Linux based product that uses
> netfilter. We have Squid and a filtering engine on our box. We are
> strong supporters of netfilter. Our customers have many subnets behind
> our box because of where it is placed in their network. Bringing up
> alias's on br0 for each of their subnets that are not even on that
> broadcast domain is a big band aid :). I think this is somehow a bug in
> ip_nat_core.c and will investigate that further and have cc'd
> coreteam@netfilter.org and hopefully that will get to Rusty who wrote
> it.
> 
> As for the SNAT I think Jason Opperisano's response is correct.
> Everything works great, except somewhere in ip_nat_core.c the src port
> is getting changed to 1 from 80. I have attached an ethereal dump to
> show this happening and a dump when it does what it is supposed to.
> Everything between the 2 is the same, except after I captured the
> no_work.cap, I did
> 
> ifconfig br0:0 192.168.255.165
> 
> So it had an IP on the test machine's subnet. Of course it worked fine
> and that capture is work.cap
> 
> Thanks for all your help.
> 
> Trevor Paskett
> Cymphonix Programmer - CCNA, CWNA
> P: 801-938-1500 F: 801-938-1501

