From: Filip Sneppe <filip.sneppe@cronos.be>
Subject: Re: different DMZs which is better?
Date: 13 Jan 2003 17:05:33 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1042473933.491.76.camel@xbox>
References: <001e01c2bb10$05d79300$9865fea9@win2k.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001e01c2bb10$05d79300$9865fea9@win2k.com>
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
To: Mike <mikeeo@msn.com>
Cc: netfilter@lists.netfilter.org

On Mon, 2003-01-13 at 15:28, Mike wrote:
> Hey guys Im deciding how I want to implement a DMZ for my company can anyone
> tell me the pros and cons of my DMZs below? should I got with a routable
> hosts in my DMZ and just filter out any port I don't want open or just port
> forward over certain ports and use IP alias?
>
Hi Mike,

Using NAT in your setup is usually a good way to save IP 
addresses. If you add one or more static routes to the
Cisco router, you don't even have to add aliases to eth0
on the Linux firewall. It'll also save you from fiddling
around with things like proxy arp and subnetting your
IP address range, which could get pretty hairy.

Performance-wise, you shouldn't notice any difference when
NAT'ing IP addresses in all but the most serious setups
(how many hosts are we talking about ? I am assuming
anything between 1 to 32 DMZ hosts. And what bandwidth
do you have available).

One thing to watch out for with NAT is that certain protocols
are difficult to firewall/NAT. The really important ones
are fully covered in the kernel (FTP, IRC), and there are
a bunch of additional nat/conntrack helpers in patch-o-matic
to cover most protocols, but if you want to run some
weird protocol behind a NAT box, you may encounter some
difficulties. Again, things like HTTP, FTP, IRC, DNS,
POP3, IMAP, etc. will work just fine with iptables+NAT.

One possible disadvantage of NAT is that it may render
your network topology a bit less clear/intuitive for some
people...

Hope this helps... 
 
Regards,
Filip


