From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: email through firewall
Date: Tue, 9 Sep 2003 23:35:00 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200309092335.00773.Alistair@nerdnet.ca>
References: <09B04A55822EFF4DA48D2E0BB2941D4A15C276@wardrive.citadelcomputer.com.au> <008a01c376c2$06199a20$49caa8c0@caris.priv>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <008a01c376c2$06199a20$49caa8c0@caris.priv>
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
To: Peter Marshall <peter.marshall@caris.com>, George Vieira <georgev@citadelcomputer.com.au>, netfilter@lists.netfilter.org

On September 9, 2003 07:03 am, Peter Marshall wrote:
> That is a good suggestion as well .... but the mail worked before I
> installed the firewall. ....
> I am coming up at a bit of a loss ...
>
> I checked the logs last night.  When I try to send or receive mail I get an
> error saying can't connect to the pop or smtp servers, but there is no
> entry in the firewall log for the error ( and as far as I can tell .. I am
> logging everything ..).

	If you are "logging everything": can you see the mail client attempting to 
	resolve the hostnames of the pop and smtp servers?

	Do you run a DNS? --> yes you can surf thus the XP box *should* be 
	resolving names correctly --- but if you are running a DNS of your own, 
	does it forward first to your ISP's DNS? --- some isp's use names that 
	are only resolvable within their own IPspace for mail servers... 

	
	You say "can't connect" -- or "can't find" === thats why I ask.

	There are further issues after that which are dependent on your ISP's
	methodologies .... but I'd suspect that first...


>
> ----- Original Message -----
> From: "George Vieira" <georgev@citadelcomputer.com.au>
> To: "Peter Marshall" <peter.marshall@caris.com>
> Sent: Monday, September 08, 2003 7:50 PM
> Subject: RE: email through firewall
>
> > Try changing the MTU of the firewalls outgoing packets. You will probably
>
> find that the firewall has no problem with mail but your workstations do..
> this is because the MTU is too large for your ISP.. drop it and try again..
>
> > search google.com for +MTU +iptables
> >
> > -----Original Message-----
> > From: Peter Marshall [mailto:peter.marshall@caris.com]
> > Sent: Tuesday, September 09, 2003 1:31 AM
> > To: netfilter@lists.netfilter.org
> > Subject: email through firewall
> >
> >
> > Has anyone had problems receiving email from there ISP through their
> > firewall ?
> >
> > I have a pretty basic firewall with 2 nic cards.  On the inside of my
> > network I have a windows xp machine with outlook 2k.
> > All of my firewall rules seem to be working and I can browse the net /
> > telnet from inside the firewall to the internet.
> >
> > For some reason when I try to receive mail, the mail client ( outlook 2k)
> > can not find the pop or smtp servers.
> >
> > Any suggestions would be appreciated.
> >
> > Thanks
> > Peter

-- 

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

