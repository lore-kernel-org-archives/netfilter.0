From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: IPtables FORWARD syntax question/error
Date: Sat, 10 Jul 2004 22:21:36 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407102221.36619.Alistair@nerdnet.ca>
References: <40EEC3F6.7050306@mail.co.gilchrist.fl.us> <200407100940.50171.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407100940.50171.Antony@Soft-Solutions.co.uk>
Content-Disposition: inline
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

On July 10, 2004 04:40 am, Antony Stone wrote:
> On Friday 09 July 2004 5:12 pm, Eric Ellis wrote:
> > I have a webcache/external proxy on the network that I want to route all
> > web traffic from Squid to.  I assumed the following to work:
> >
> > iptables -t nat -A OUTPUT -p tcp --dport 80 -j DNAT --to-destination
> > xx.xx.xx.xx:8080
> >
> > the thing is that it gives me the error "invalid argument".  Here's what
> > else I've tried, with errors:
> >
> > root@firewall:/etc# iptables -t nat -A POSTROUTING -p tcp --dport 80 -j
> > DNAT --to-destination xx.xx.xx.xx:8080
> > iptables: Invalid argument
>
> DNAT is not valid in the POSTROUTING chain, only PREROUTING and OUTPUT.
>
> > root@firewall:/etc# iptables -t nat -A OUTPUT -p tcp --dport 80 -j DNAT
> > --to-destination xx.xx.xx.xx:8080
> > iptables: Invalid argument
>
> That looks like a valid rule to me (but see below).

	Umm ... could we have TWO copies of iptables involved here?? or a 
	recompiled kernel without a recompile of iptables userspace code????

	
	Alistair Tonner.

	
> Regards,
>
> Antony.

