From: Nik Trevallyn-Jones <nik@exmosys.com>
Subject: Re: Automatic forwarding to own interfaces
Date: Tue, 23 Sep 2003 23:47:53 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <03092323475304.01185@slinky.exmosys.com>
References: <20030923131404.11418.97793.Mailman@netfilter-sponsored-by.noris.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030923131404.11418.97793.Mailman@netfilter-sponsored-by.noris.net>
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
To: netfilter@lists.netfilter.org

On Tue, 23 Sep 2003 23:14, you wrote:
> Subject: Re: Automatic forwarding to own interfaces
>
> >That's a "normal" Linux behaviour. Linux answers packets destined to any
> >of its own IPs own any interface, as long as your INPUT filtering rules
> >allows it. You can set something like :
> >
> >	iptables -A INPUT -d 192.168.1.5 -i ! eth1 -j DROP
> >	iptables -A OUTPUT -s 192.168.1.5 -o ! eth1 -j DROP
>
> Hmm... I was afraid this was the case.
>
> So in the common small scale setup with one box acting as router, firewall
> and internal web and smtp server, this is an absolute must. Or your
> "internal" web and smtp services will in fact be open to anyone.

Well, as far as I can tell, it's not *quite* that bad. For anyone to get this 
behaviour, they would have to define your external address as their gateway, 
and then address their packets correctly to your internal interface 
address(es). I don't know enough about IP routing to know if they could do 
this assuming that the machine they are sending from probably already has a 
gateway configured to enable their packet to get *out* from their network in 
the first place.

> So what is the point in configuring daemons to listen only on specific
> addresses?

I use this to implement virtual servers.

> This is probably a surprise to some, as it is to me. Quite a few firewall
> packages and setups miss this point.

It is a big surprise to me. The firewall setup that I originally copied, and 
have happily enhanced over time already had rules to DROP packets that 
didn't belong on a particular interface, with comments such as "stuffed 
routing", "spoofed address", etc, so I already had this protection, although 
I was unaware of the issue.

Cheers!
Nik

