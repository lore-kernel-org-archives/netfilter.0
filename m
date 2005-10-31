From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: what's the problem of DNAT
Date: Mon, 31 Oct 2005 14:25:12 +0100 (CET)
Message-ID: <Pine.LNX.4.61.0510311423190.13641@filer.marasystems.com>
References: <43a0cdcb0510301931p3f97ff66p@mail.gmail.com> 
	<Pine.LNX.4.61.0510310758150.11251@filer.marasystems.com> 
	<43a0cdcb0510302358y10f854ffg@mail.gmail.com> 
	<54583.193.173.147.3.1130746205.squirrel@webmail.sterenborg.info>
	<43a0cdcb0510310026t66d553f2v@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43a0cdcb0510310026t66d553f2v@mail.gmail.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Buddy wu <ejournal4me@gmail.com>
Cc: Rob Sterenborg <rob@sterenborg.info>, netfilter@lists.netfilter.org

On Mon, 31 Oct 2005, Buddy wu wrote:

> And there is another Interest thing (I'm pained with the "interesting thing")
> where I use 'sbin/iptables -t nat -A PREROUTING -d Inet2 -p tcp
> --dport 8087 -j DNAT --to 192.168.16.100:8087' rule, I can access
> http://Inet2:8087 in the LAN, but I can't access http://Inet2:8087
> through Internet(I have a machine direct access to internet)

Please verify the routing on 192.168.16.100. To me the data you have 
indicates 192.168.16.100 does not have correct routing for the Internet. 
From what I have seen the iptables rules is correct, but all your rules 
with NAT to 192.168.16.100 is failing.

Quite likely the NAT and firewall rules as such is working just fine, but 
192.168.16.100 does not know what to do with the return traffic.

Regards
Henrik

