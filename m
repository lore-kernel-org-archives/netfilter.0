From: Bart <b-m@pandora.be>
Subject: Re: question about NAT
Date: Sun, 22 Dec 2002 13:40:40 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E05B2C8.3000707@myland.org>
References: <3E008B78.2000900@emtex.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org



Bill Dossett wrote:

> Hi,
>
> I'm trying to get a firewall working with iptables.
>
> My internal network uses real IP numbers, not private
> address ranges.  I need to do this as I need to allow
> another network access to multiple machines, all ports,
> on my network at times.
>
> I am using Firestarter.. or at least started off with
> it and I am modifying the rules and using firestarter
> for a monitor.
>
> My problem is... and I was somewhat surprised by it...
>
> Enabling NAT with firestarter works ok, but, because
> I am using real IP numbers and have a smart router,
> machines on the Internet side of my firewall could still
> ping, etc, machines on internal side of the firewall as they
> have real IP addresses... which sort of makes sense as
> ip_forward is enabled... though I thought I would need
> a static route to actually forward things... not sure
> I'm using Redhat 8.0 .. .my older system uses Redhat
> 6.2 and it doesn't do this.
>
> So.. after poking around and trying to stop this, I finally
> seem to have found the place to stop this happening,
> in the PREROUTING chain, I have done a
>
> iptables -t nat -I PREROUTING -d 193.243.232.0/26 -j LOG
> iptables -t nat -I PREROUTING -d 193.243.232.0/26 -j DROP 


If you use -I(insert) then the second rule will be put before the first 
one,
so everything will be dropped and that's it.  DROP ends  the chain,
log doesn't.

Try this instead:

iptables -t nat -I PREROUTING -d 193.243.232.0/26 -j DROP
iptables -t nat -I PREROUTING -d 193.243.232.0/26 -j LOG

Issue iptables -t nat -L PREROUTING and you will see that logging
appears before dropping.

Bart
HTH
grz

>
>
> the first bit works... but the second bit doesn't... machines
> on the Internet side of the firewall can't see internal network
> machines, however, if you do try and ping one of them, nothing
> goes in the logs. I've read the NAT howto and a few other docs,
> but I can't see any reason why this would be, I would like to
> monitor this for scans and stuff.  Can anyone enlighten, or
> point me to docs that would?  And as usual, if I am doing this
> complete wrong, I'm certainly open to any comments on how it
> should be done.
>
> Thanks
>
> Bill
>
>
>



