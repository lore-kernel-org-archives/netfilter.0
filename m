From: Brad Chapman <kakadu_croc@yahoo.com>
Subject: Re: NAT only - No connection tracking
Date: Mon, 11 Nov 2002 11:21:03 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021111192103.14755.qmail@web40910.mail.yahoo.com>
References: <200211111303.gABD39e28156@vulcan.rissington.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200211111303.gABD39e28156@vulcan.rissington.net>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.netfilter.org

Mr. Antony,

--- Antony Stone <Antony@Soft-Solutions.co.uk> wrote:
> On Monday 11 November 2002 11:34 am, Brad Chapman wrote:
> 
> > > How can I make my iptable to do just NAT, no connection tracking?
> > >
> > > Basically, I want to make my iptable to become a NAT device without
> > > stateful inspection.
> > > It this possible?
> >
> > No.
> 
> Hi Brad - long time no hear...

When you don't have all day to bathe your retina in EM radiation, then your presence
sometimes decreases ;)

> 
> Why do you think this is not possible ?

Sorry for being so short, I was busy.

Basically, if this person wants to do NAT, he has to do connection tracking as well.
LYSB, he doesn't have to run ctrack without NAT, but without ctrack the current
implementation of NAT in netfilter won't work. If there are other stateless NAT
kernel implementations available that attach to netfilter, then I am currently
unaware of them.

> 
> Antony.

Brad

> 
> -- 
> 
> What is this talk of software 'release' ?
> Our software evolves and matures until it becomes capable of escape,
> leaving a bloody trail of designers and quality assurance people in its wake.
> 


=====
Brad Chapman

Permanent e-mail: kakadu_croc@yahoo.com

__________________________________________________
Do you Yahoo!?
U2 on LAUNCH - Exclusive greatest hits videos
http://launch.yahoo.com/u2

