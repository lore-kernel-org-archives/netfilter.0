From: Jason Opperisano <opie@817west.com>
Subject: Re: Question about limited primary addresses
Date: Mon, 20 Sep 2004 09:43:07 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095687787.1898.20.camel@wolfpack.ljm.dom>
References: <414E5004.1060009@rocksteady.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <414E5004.1060009@rocksteady.com>
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

On Sun, 2004-09-19 at 23:35, Patrick Turley wrote:
> I am trying to configure a Linux box with all possible VLANs (4094 of 
> them), and a subnet on each VLAN. Creating the VLANs isn't a problem. 
> But, when I try to use "ip addr add ..." commands to assign an IP 
> address to each VLAN interface, I get to do about 280 of them before all 
> the interfaces on the box become unresponsive. I've also tried to assign 
> the same IP addresses all to eth0, and I get the same result.
> 
> The problem seems to hinge on the distinction between primary and 
> secondary addresses.
> 
> If you're reading the LARTC list, then you've probably had the need 
> (e.g., load testing) to assign thousands of IP addresses to a single 
> interface. However, it's usually the case that one is assigning multiple 
> addresses that all belong to the same subnet. In that case, the first 
> such IP address is "primary" and all the additional addresses that 
> belong to the same subnet are "secondary". My investigations tell me 
> that "secondary" addresses are much lighter-weight. On the other hand, I 
> don't seem to be able to assign more than about 280 "primary" addresses 
> in the entire system before all the interfaces become unresponsive.
> 
> For additional information about "primary" vs. "secondary" addresses, 
> take a look at:
> 
> http://www.linux-ip.net/html/linux-ip.html#tools-ip-address-add
> http://www.linux-ip.net/gl/ip-cref/node33.html
> 
> Does anyone know why there appears to be a limit on the number of 
> networks? Does anyone know where in the code this limit arises? Does 
> anyone know a way to get around this limit?

i'm not aware of any limit.  i believe 2.0/2.2 had an alias limit of 256
per interface, but i could be way off base...  there's probably
something going on with you particular machine (i.e. memory problem).

my test to prove there's not a limit at 4096:

$ uname -a
Linux wolfpack 2.4.22-1.2199.nptl.ipsec.pom #2 Wed Aug 11 13:55:37 EDT
2004 i686 i686 i386 GNU/Linux

$ sudo ip addr add 220.1.1.1/24 dev eth0

$ ip -o -4 addr sh eth0
2: eth0    inet 220.1.1.1/24 scope global eth0

$ bash test	# see the contents of "test" below

$ ip -4 addr sh eth0 | wc -l
   4354

box is still responsive on random sampling of IP's (17.247.1.1,
16.212.1.1, 10.218.1.1, etc)...

contents of "test" are:

----
i=1
function addIP() {
  j=0
  while [ $j -le 255 ]; do
    sudo ip addr add $1.$j.1.1/24 dev eth0
    let "j = $j + 1"
  done
}

while [ $i -le 17 ]; do
   addIP $i
   let "i = $i + 1"
done
----

essentially--this script is adding IP's of 1.[0-255].1.1/24,
2.[0-255].1.1/24...up to 17.[0-255].1.1/24...for a total of 256*17 =
4352 IP's, all on different networks, all on eth0.

this is on my laptop i'm using to write this email (P4 2.2 GHz, 768 MB
RAM, FC1)

if this is not a valid reproduction of what you're trying to do, let me
know.

-j

-- 
Jason Opperisano <opie@817west.com>


