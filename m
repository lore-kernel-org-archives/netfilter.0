From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: a sort of n00b question here but I'ld like to know.
Date: Tue, 21 Oct 2003 00:46:16 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200310210046.16324.Alistair@nerdnet.ca>
References: <20031021024924.98794.qmail@web40207.mail.yahoo.com>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031021024924.98794.qmail@web40207.mail.yahoo.com>
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
To: SBlaze <dagent.geo@yahoo.com>, Simon Garner <sgarner@expio.co.nz>, netfilter@lists.netfilter.org

On October 20, 2003 10:49 pm, SBlaze wrote:
> --- Simon Garner <sgarner@expio.co.nz> wrote:
<SNIP>
> > >
> > > You be the judge. I start my firewall when the box boots up. Pay
> > > special attention to the UDP rule. Note that in the 11 day up time we
> > > have 16 Million droppped UDP NEW/Invalid packets. Is this enough to
> > > choke down a Dual Pentium Pro 200mhz box?
> traffic has gotton worse.
>
No. Period
I have a dual pp 100 with only 48Mb ram ..and it handles far more than this... 
Admittedly on PCI nics ... not ISA


<MORE SNIPPAGE>
> I was considering using ntop to gather more detailed information so I
> posted to a site where I know some Charter techs and people who use Charter
> are. If your curiosity gets the better of you please check it out. The
> following link should take you to the thread. Whats really interesting is
> that I have brought up what you mentioned about having the ISP actually
> FILTER for me. If you read.. note the reaction from the people who post up.
> It's sad. :{{
>
> http://www.dslreports.com/forum/remark,8236731~root=charter~mode=flat
>
> SBlaze
>
>

	I agree the response is indeed sad, but I believe that's typical for that 
sort of forum.  Watching the traffic coming in to your router and charting it 
is NOT any sort of violation of any *rational* AUP.  Going farther than that 
might well be.  The average user of cable internet access has little idea of 
what goes on beyond the screen.  I've noted that DSL reports has a few decent 
posters and occaisionaly has good advise, but frequently is populated by 
*twinks*.   Considering that you are supposed to be 2Mbs down... I'd doubt 
that the garbage is that substantial an issue.  I've takn to REJECT with tcp 
reset for anything targetting the windows filesharing ports off my segment.  
It seems to slow the constant scans, but may be bad policy.  I do know that 
the ISP i'm with has a 'no filtering ' policy, and thats one reason I'm with 
them.  But there are days (immediately after a new worm comes out like?) when 
I wish......

   In your case its possible that traffic from other folks on your segment is 
causing the slow connection.  However keep in mind that you get decent TCP 
ping times and poor pings in the game.  Perhaps the problem exists with the 
*game* servers being slow to respoind to udp traffic due to their load.


>
>
> =====
> In the absence of order there will be chaos.
>
> __________________________________
> Do you Yahoo!?
> The New Yahoo! Shopping - with improved product search
> http://shopping.yahoo.com

-- 

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

