From: waltdnes@waltdnes.org
Subject: Re: [Q]: Filtering based on reverse DNS
Date: Sun, 13 Apr 2003 11:46:06 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030413154606.GA23914@m1800>
References: <NCBBIBNHAKHDGJGMPLPJCEKBKPAA.netfilter@codeworks.gen.nz>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <NCBBIBNHAKHDGJGMPLPJCEKBKPAA.netfilter@codeworks.gen.nz>
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
Content-Transfer-Encoding: 7bit
To: Netfilter list <netfilter@lists.samba.org>

On Sat, Apr 12, 2003 at 07:24:42PM +1200, Wayne McDougall wrote

> My questions are:
> 1. Is there anything already like this (or could be adapted)?
>
> 2. Are there reasons why I shouldn't be doing this at all. I
> appreciate that there would be a performance hit , and obviously
> I only want reverse DNS lookups when connections are initiated -
> I don't mind latency at that point, and obviously I should use a
> local caching nameserver. But is it all a real mess and I shouldn't
> go there? Why not?
>
> 3. If there is nothing out there, where should I attack this problem
> if I was going to try and roll my own? A netfilter module, right?

  You might want to take a look at countries.nerd.dk for a resource.
It's normally used for spam-blocking (Nigeria, Korea, China, Taiwan,
etc).  But other uses are possible.  The zone nz.countries.nerd.dk
returns 127.0.0.2 for IP addresses in New Zealand.  This works better
than rDNS, because it doesn't care whether the TLD is .nz, or .net, or
org, etc.; it just cares whether the IP address is in NZ.

> [m1800//home/waltdnes]host 210.55.103.160
> 160.103.55.210.in-addr.arpa domain name pointer pop2-port160.jetstart.maxnet.co.nz.

> [m1800//home/waltdnes]host 160.103.55.210.nz.countries.nerd.dk
> 160.103.55.210.nz.countries.nerd.dk has address 127.0.0.2

  Note the swapped order of the 4 octets.  There is also the
zz.countries.nerd.dk "superzone".  For any IP address, it returns
127.0.X.Y where (256 * X) + Y == the numeric ISO country code.

> [m1800//home/waltdnes]host 160.103.55.210.zz.countries.nerd.dk
> 160.103.55.210.zz.countries.nerd.dk has address 127.0.2.42

  Again, note the byte-swapped order.

  countries.nerd.dk is a free effort, so there's no financial guarantee,
but they're a good start.  If you're going to be hitting it hard, you
might consider asking for occasional zone transfers.

-- 
Walter Dnes <waltdnes@waltdnes.org>
An infinite number of monkeys pounding away on keyboards will
eventually produce a report showing that Windows is more secure,
and has a lower TCO, than linux.

