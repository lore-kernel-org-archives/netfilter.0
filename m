From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: make a DNAT requesting source
Date: Mon, 24 Oct 2005 11:11:31 -0500
Message-ID: <200510241111.31724.rob0@gmx.co.uk>
References: <20051024122513.7yxniro62fdkwsgw@webmail.cvignolo.cl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051024122513.7yxniro62fdkwsgw@webmail.cvignolo.cl>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Monday 2005-October-24 10:25, Felipe Alcacibar wrote:
> Hi to all, i have the next problem.

Um, no, I think I was scheduled to have the next problem. Yours is the 
previous one. ;)

> I have 2 machines, one, listen from port 80 of ip alias 192.168.0.220
> and another ip alias 10.0.0.5, and the other machine have listen a
> webserver in the port 8001 with a ip alias 10.0.0.1, y succesfully
> make a connection from the 192.168.0.0/24 to 10.0.0.1 thought the
> first machine, but the packages don't go back, because 10.0.0.1 does
> not route the packages to 10.0.0.5, and i can't do it, because the

I think (if I understand this) that source routing is your answer.

echo -e '10\tten' >> /etc/iproute2/rt_tables # names are friendlier to
# use than numbers. Both can be what you want, 10 and ten are examples.
# This just makes a routing table name you can use. It's optional; you
# can use the number in place of the table name.

ip rule add from 10.0.0.1 table ten
# Says that if the source IP is 10.0.0.1, to use the "ten" routing
# table.

ip route add default via 10.0.0.5 table ten
# The "ten" table has 10.0.0.5 as its default gateway.

ip route flush cache

> idea is listen 3 webservers listen on different ports with the same
> case, how i can do a DNAT, queryng the source of the package, because
> i need in the machine 2, the packages outgoing from 10.0.0.1 from
> port 8001 go to 10.0.0.5 an this route the package with masqued

You might have to use mangle -j MARK and an ip rule command to put that 
"fwmark" in the "ten" table.

There might also be a pure netfilter solution with the -j ROUTE target. 
I have not done any of this, but I hope it points you in the right 
direction.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

