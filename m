From: Josh Nerius <jnerius@gmail.com>
Subject: Re: nat:REDIRECT on localhost not working in Kernel 2.6
Date: Fri, 19 Nov 2004 11:55:21 -0600
Message-ID: <4f3930a704111909551b7e4d85@mail.gmail.com>
References: <200411191836.07261.su@su2.info>
	<20041119174100.GA20905@bender.817west.com>
Reply-To: Josh Nerius <jnerius@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041119174100.GA20905@bender.817west.com>
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
To: Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org

I'll second what Jason said here.

I've had the same issue in the past and resolved it by enabling option
Jason mentioned.

This can also be found in menuconfig here:

Device Drivers >> Networking Support >> Networking Options >> Network
packet filtering >> IP: Netfilter Configuration >> [   ] Nat of local
connections.

Josh Nerius


On Fri, 19 Nov 2004 12:41:00 -0500, Jason Opperisano <opie@817west.com> wrote:
> On Fri, Nov 19, 2004 at 06:36:02PM +0100, Stephan Uhlmann wrote:
> 
> 
> > Hello netfilter friends,
> >
> > I want to redirect all connections going to port 80 of a host to port 8080 of
> > the same host. Of course I do it with the REDIRECT target:
> >
> > iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 8080
> > iptables -t nat -A OUTPUT -p tcp --dport 80 -j REDIRECT --to-ports 8080
> >
> > The redirection of externally incoming connections via PREROUTING  works
> > perfectly fine.
> >
> > But I have the problem that locally generated connections are not redirected
> > on machines with Linux Kernel 2.6 but on machines with Linux Kernel 2.4.
> >
> > I tested:
> > SuSE Linux 9.0 (Kernel 2.4.21, iptables v1.2.8)  - works
> > SuSE Linux 9.1 (Kernel 2.6.5,  iptables v1.2.9)  - does not work
> > SuSE Linux 9.2 (Kernel 2.6.8,  iptables v1.2.11) - does not work
> > Gentoo Linux   (Kernel 2.6.9,  iptables v1.2.11) - does not work
> >
> > "iptables -t nat -L -v" shows that no packet at all was catched by the OUTPUT
> > chain. Instead it seems to go to the POSTROUTING chain. But the REDIRECT
> > target can't be used in the POSTROUTING chain.
> >
> > Is this a bug? Is this a feature? Did something change between Kernel 2.4 and
> > 2.6 in this regard?
> >
> > I looked through the ChangeLogs and other docs but didn't find any hint.
> 
> are all kernels in question compiled with:  IP_NF_NAT_LOCAL
> 
> -j
> 
> --
> "Man, you go through life, you try to be nice to people, you struggle
>  to resist the urge to punch 'em in the face, and for what?"
>         --The Simpsons
> 
> 


-- 
Math problems? Call 1-800-[(10x)(13i)^2]-[sin(xy)/2.362x]

