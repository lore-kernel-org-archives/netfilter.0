From: Jason Opperisano <opie@817west.com>
Subject: Re: assigning alias ip address
Date: Fri, 10 Sep 2004 07:46:52 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094816812.1900.16.camel@wolfpack.ljm.dom>
References: <003c01c496e3$b6416c60$f82ffea9@black>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <003c01c496e3$b6416c60$f82ffea9@black>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Thu, 2004-09-09 at 23:10, John Black wrote:
> How does assigning alias IP address work?
> 
> I have one network jack coming into my server room. 
> eth0  10.10.10.10
> 
> I have two servers with public IP address.
> this assigns them, right?
> ifconfig eth0:10 192.168.1.10 netmask 255.255.255.0
> ifconfig eth0:11 192.168.2.11 netmask 255.255.255.0

the "preferred" method for this (by me) is to use the ip utility from
iproute2:

        ip addr add 192.168.1.10 dev eth0
        ip addr add 192.168.1.11 dev eth0
        
but yeah--the ifconfig method works too...

> iptables -t nat -A PREROUTING -d 192.168.1.10 -i eth0 \
>                 -j DNAT --to-destination 10.10.10.11
> iptables -t nat -A PREROUTING -d 192.168.2.11 -i eth0 \
>                 -j DNAT --to-destination 10.10.10.12
> 
> When a mail or web request is made from the internet.  
> How does it know where the servers are?

routing.  the "one-arm" router scenario can be made to work, as long as
you understand the traffic flow and the routing quirks that can arise. 
the $25,000 question is:  what is the default gateway of 10.10.10.11 and
.12?

is there a particular reason why your netfilter box can't have 2 NICs in
it, with the servers placed behind it?

-j

-- 
Jason Opperisano <opie@817west.com>


