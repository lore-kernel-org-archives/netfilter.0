From: "Paulo Jorge O. C. Matos" <pocm@mega.ist.utl.pt>
Subject: Re: Command not working  in latest version
Date: Mon, 17 Feb 2003 23:37:21 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302172337.21158.pocm@mega.ist.utl.pt>
References: <01CEA3A5B8B2D511890F0002A5870AEC5FB5E9@EXCHANGE> <002901c2d616$c41d6300$0100a8c0@nikita> <1045467010.681.100.camel@tux.rsn.bth.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1045467010.681.100.camel@tux.rsn.bth.se>
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
To: Martin Josefsson <gandalf@wlug.westbo.se>
Cc: Khanh Tran <khanh@slc.edu>, Netfilter <netfilter@lists.netfilter.org>


Hi Martin,

I've lost your mail before reading it... Now I got it... I'll try to 
recompile the kernel with userspace iptables, thx.

Best regards,
Paulo

On Monday 17 February 2003 07:30, Martin Josefsson wrote:
> On Mon, 2003-02-17 at 00:54, Paulo J. Matos wrote:
> > Hi Khanh,
> >
> > I've compiled the kernel specifically like they said in your
> > reference except those new options of 2.4.20 but still I get
> > 'Invalid Arguments' from iptables 1.2.7a. What's Full NAT in kernel
> > config, is that useful for iptables?
> >
> > I've run the line:
> > # iptables -v -t nat -A POSTROUTING -o eth1 -j SNAT --to
> > 217.129.146.56 SNAT all opt -- in * out eth1 0.0.0.0/0 -> 0.0.0.0/0
> > to:217.129.146.56 iptables: Invalid Argument
> >
> > This is indeed strange. Do you have any idea of what could I do
> > now?
> >
> > Is there any other iptables command line with the same outcome?
>
> I just have to put an end to this thread :)
>
> The solution is simple, recompile userspace iptables against your new
> kernel.
> A major NAT patch was included in 2.4.20 that breaks compability so
> you have to recompile userspace iptables against the new
> kernelheaders to get NAT working again (same for the owner match).


