From: Roland Kaeser <roli8200@yahoo.de>
Subject: Re: ipt_string and Kernel 2.6 !!URGENT!!
Date: Wed, 12 Jan 2005 16:48:37 +0100 (CET)
Message-ID: <20050112154837.83850.qmail@web26102.mail.ukl.yahoo.com>
References: <20050112152437.GA17646@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050112152437.GA17646@bender.817west.com>
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

Hallo

> yeah--yelling is a great way to inspire the folks that have already given
> you all this great code for free to accept that their efforts thus far
> have been insufficient to satisfy you.  to borrow a quote from the folks
> on openbsd-misc:
> "shut up and hack."

Yeah, but I'm the only systems administrator here and I have a quite small time
window to get this up and running, and by all gratefulness I don't have the time to
spend days in try and error for getting things like snort-inline running. If
something doesn't work the first time I cannot use it because the work is pile up on
my desk so I really don't have the time for this. Please understand. I would like to
extend my experiences on this if I would have a lot of freetime but I don't have it
so i depending on "quick" solutions.

Roland


 --- Jason Opperisano <opie@817west.com> schrieb: 
> On Wed, Jan 12, 2005 at 04:11:42PM +0100, Roland Kaeser wrote:
> > Hi
> > 
> > I got a look at the proposals You made. I tried it to compile but all I got was
> > frustration, frustration and more. On the bottom-line snort-inline is a crap
> because
> > it depends on very old software (libnet, which has itself a lot of bugs) and
> trying
> > to compile it on a halfway actual system brings to to the mental hospital.  This
> > makes it more frustrating becaus of the string match isn't our primary security
> part
> > it should only prevent the servers from most common attacks to bring the load
> down.
> > All traffic goes through reverse (or "normal") proxies which enables the
> application
> > level firewall.
> 
> any proxy worth a "crap" can do more than the string match, so i fail
> to see your point.  maybe your proxy is "crap."  maybe the skill set of
> your proxy administrator is "crap."
> 
> > I JUST WANT TO RUN THE IPT_STRING ON A KERNEL 2.6.
> 
> yeah--yelling is a great way to inspire the folks that have already given
> you all this great code for free to accept that their efforts thus far
> have been insufficient to satisfy you.  to borrow a quote from the folks
> on openbsd-misc:
> 
> "shut up and hack."
> 
> -j
> 
> --
> "Another day, another box of stolen pens."
>         --The Simpsons
> 
>  


	
		
___________________________________________________________ 
Gesendet von Yahoo! Mail - Jetzt mit 250MB Speicher kostenlos - Hier anmelden: http://mail.yahoo.de

