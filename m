From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: Logging MAC
Date: Sat, 22 May 2004 08:09:47 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405220809.47858.Alistair@nerdnet.ca>
References: <5390820828.20040521103958@alternativa.com.br> <200405212147.00410.Alistair@nerdnet.ca> <200405221006.14904.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405221006.14904.Antony@Soft-Solutions.co.uk>
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

On May 22, 2004 05:06 am, Antony Stone wrote:
> On Saturday 22 May 2004 2:47 am, Alistair Tonner wrote:
> > 	I note that iptables doesn't log mac addresses it cannot see (i.e. not
> > directly connected) ... in 1.2.9x (as I and Antony are running) you still
> > see the MAC= element.  Perhaps in CVS the logging function drops this
> > entry if MAC="" ??
>
> Surely there will *always* be two MAC addresses involved in a communication
> - that's how two machines find each other across the local subnet (ie: via
> a switch / hub / access point etc)?

	*Thwack*'s self in head.  Of course, so long as "Ethernet" is involved.  Not 
being 100% on the ball at that moment, I was looking at lines from my ppp 
connection which is pppoe in reality. -- There is no 'ethernet' frame 
involved on that link, thus there are no 'MAC' addresses, or at least there 
aren't MAC addresses in the ppp packets, the MAC address is in the wrapping 
ethernet frame which is going through a dfferent device, which is either 
before or after the ppp device, depending on direction.

>
> I agree that in a multi-hop connection between systems, at least one of the
> MAC addresses seen by netfilter will definitely not be an endpoint (it will
> be an interface on a local router), however unless you are running an
> access point *as* a router (the standard way to run them is as a bridge)
> then you should still see the MAC address of whatever machine is talking to
> the firewall?
  
	Ummm .. I don't think so:	
	in ipt_LOG.c MAC address logging is ONLY done in INPUT.  So ..if the
	packet is NOT destined for the machine, you wont see MAC.

>
> > -- that would indicate that someone on the wireless is being
> > hijacked as a proxy?? *ugh*
>
> In which case you would see the MAC address of the hijacked poxy machine...
	
>
> Regards,
>
> Antony.

