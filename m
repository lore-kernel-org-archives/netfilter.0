From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: ipv4 and ipv6 tables
Date: Fri, 27 Aug 2004 18:30:34 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200408271830.34871.Alistair@nerdnet.ca>
References: <412FB0D4.8080303@pbl.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <412FB0D4.8080303@pbl.ca>
Content-Disposition: inline
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

On August 27, 2004 06:08 pm, Aleksandar Milivojevic wrote:
> Ok, if I have good old ipv4 packet, or good new ipv6 packet they will go
> through respective chains in respective tables (either for ipv4 or
> ipv6).  But how about ipv6-in-ipv4 packets?  How is this handled when
> packet is forwarded (especially by ipv6 enabled host)?  How does the
> packet traverse tables and chains once it reach destination and is
> unwrapped from its ipv4 wrapper (does it go through both ipv4 and ipv6
> tables and chains)?  Any other special cases to watch for to prevent
> packets that should be blocked to go through ipv6 back door?

	When the IPV6 packet is wrapped up in IPV4 it becomes an
	ipv4 protocol 41 packet.

	You need to allow protocol 41 through the ipv4 rules to let the ipv6-in-ipv4 
stuff through.

	in my case 

	iptables -I INPUT 3 -p 41 -s {ipaddress of tunnel server} -d {my external 
ipv4 address} -j ACCEPT
	iptables -I OUTPUT 7 -p 41 -s {my external ipv4 address} -d {ipaddress of 
tunnel server} -j ACCEPT

	you would likely want the rules in different locations in INPUT and OUTPUT 


	Alistair Tonner
	
	(after bouncing head on desk for days trying to get mine working, I'll make 
yer life a little easier)

