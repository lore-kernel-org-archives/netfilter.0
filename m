From: "ISC Jorge Ceron Galvan" <jorgec@acerlandslp.com.mx>
Subject: Re: Source NAT
Date: Sat, 03 Sep 2005 14:28:26 -0500
Message-ID: <WorldClient-F200509031428.AA28260029@acerlandslp.com.mx>
References: <58867.212.100.225.55.1125487119.squirrel@webmail.*>
	<200508310637.33322.rob0@gmx.co.uk>
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200508310637.33322.rob0@gmx.co.uk>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: /dev/rob0 <rob0@gmx.co.uk>, netfilter@lists.netfilter.org


-----Original Message-----
From: /dev/rob0 <rob0@gmx.co.uk>
To: netfilter@lists.netfilter.org
Date: Wed, 31 Aug 2005 06:37:33 -0500
Subject: Re: Source NAT

> On Wednesday 2005-August-31 06:18, Jimmy wrote:
> > I currently have a situation that I am hoping iptables can resolve.
> > The issue is that I need to NAT the source address based on the
> > destination address. Is that possible with IPTables ?
> 
> Trivial.
> 
> > if dst = 1.1.1.1 src = 10.1.1.1
> 
> iptables -vt nat -A POSTROUTING -d 1.1.1.1 -j SNAT -to 10.1.1.1


why -vt?  

this rule confused me, I'm a begginer;  

what about

iptables -t nat -A POSTROUTING -s 10.1.1.1/24 -j SNAT --to 1.1.1.1

or

iptables -t nat -A POSTROUTING -o eth0 -s 10.1.1.1/24 -j SNAT --to 1.1.1.1


> 
> > Can anyone give me any advice on completing that?
> 
> "man iptables"
> 
> Order matters. If you have a catchall SNAT rule before the specific 
> destination ones, the catchall is the one used.
> 
> NAT != routing. If your SNAT'ed IP addresses need to go out different
> interfaces, this won't work. See the LARTC HOWTO.
> -- 
>     mail to this address is discarded unless "/dev/rob0"
>     or "not-spam" is in Subject: header


