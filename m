From: Art Reisman <astormchaser2002@yahoo.com>
Subject: Re: tcpdump behavior not getting all packets in promisc mode
Date: Mon, 3 Jun 2002 18:14:17 -0700 (PDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020604011417.39761.qmail@web10408.mail.yahoo.com>
References: <200206040050.g540oqA02000@Networker.rockstone.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206040050.g540oqA02000@Networker.rockstone.co.uk>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.samba.org


--- Antony Stone <Antony@Soft-Solutions.co.uk> wrote:
> On Tuesday 04 June 2002 1:43 am, Art Reisman wrote:
> 
> > > > Here is my topology
> >
> >  T1----->Gateway---->Hub-------Wireless----->PC1
> >                      
> |------>eth0---->PC2--->TCPDUMP
> > > >
> 
> 1. What sort of network card is eth0 ?

The plug and play reports an intel pro 100, but that
is likely just the chip that reports the board
manufacturer is long forgotten by me. I thought it
rather interesting that Linux never asked for any sort
of driver for this card during set up? I bought
another lan card last night (SMC) and plugged it in
,but do not have it configured yet
> 
> 2. Do you have another machine you can plug into the
> hub to:
Yes but only one machine is now running linux, does
microsoft provide a tcpdump type utility? I think I'll
dump the suse linux and load redhat first?

> 2a. Run Tcpdump and check if *it* can see what you
> expect ?

Good idea
> 2b. Create traffic and check if PC2 can see it ?
> 
> 
> Antony.
> 

__________________________________________________
Do You Yahoo!?
Yahoo! - Official partner of 2002 FIFA World Cup
http://fifaworldcup.yahoo.com

