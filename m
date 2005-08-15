From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: iptables + ebtables + snat question
Date: Mon, 15 Aug 2005 01:14:49 -0500
Message-ID: <430032D9.3080903@riverviewtech.net>
References: <51418F95-52AF-4FF8-8F57-BE214D9A04D9@decipher.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <51418F95-52AF-4FF8-8F57-BE214D9A04D9@decipher.com>
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
To: netfilter@lists.netfilter.org

Scott, do you have any control over the router?  Is the router running Linux?  The reason that I ask is that you *might* be able to do some things with it to allow you to put the internal IP of the router on your bridge box.

One really odd idea that I do have would be to sort of hijack one of the IPs of one of the boxen in your DMZ.  What I mean by this is if you have a system in your DMZ that you could ""barrow the IP from and get away with it go for it.  Let's say you have a system that is just a web server and send out traffic from 80 and 443 and that is about it.  There is no reason why you could not barrow it's IP and use ports above 30,000 for your LAN use.  You could do this by having your bridge direct any traffic that was destined to the DMZ server with a port 30,000 or higher in to the LAN and your DMZ server should be none the wizer.  You are just doing some psuedo Port Address Translation.  The idea behind this is that you would be able to safely hijack the IP of your DMZ server in cases where you knew that the traffic comming (back) in would not be destined to the real DMZ server.  If the traffi
 c destined to the DMZ server is below port 30,000 you would know to pass it on to the real
 DMZ server.

I would try to do something like the following with my bridging router:

1)  Add if0 to br0.
2)  Do something to prevent erroneous ARP replies for the borrowed DMZ IP.  This could possibly be done with EBTables or ARPTables on the if0 interface.  I'll have to do some more thinking on this one.
3)  Run this rule "ebtables -t broute -A BROUTING -m ip --ip-source-port 30000:65535 -j dnat --to-destination <mac of if0>"



Grant. . . .

Scott Phelps wrote:
> I have the following setup:
> 
>           LAN
>            |
>            |
>           if0       ________
> DMZ---if1     if2---|ROUTER|---INTERNET
>          \   /      --------
>           br0
> 
> LAN_NET = 10.0.0.1
> PUBLIC_NET = 77.25.33.0/28
> (14 hosts - broadcast = .15)
> 
> I am doing transparent bridging between
> if1 and if2
> 
> My ROUTER ethernet iface has IP 77.25.33.1
> 
> my DMZ hosts will have public IPs ranging
> 77.25.33.2-14
> 
> My question is can Masquerade (SNAT) my LAN
> IPs and use the ROUTER ethernet IP
> as a --to-source target?
> 
> Or do I have to assign a IP to my br0 interface?
> I am in deign mode so I was trying to figure out
> if this is possible.
> 
> The rule would look like this:
> $IPTABLES -t nat -A POSTROUTING \
> -o $BR0 -j SNAT --to-source $ROUTER_IP
> 
> Can this work?

