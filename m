From: Jason Opperisano <opie@817west.com>
Subject: Re: ipt_string and Kernel 2.6 !!URGENT!!
Date: Wed, 12 Jan 2005 10:24:37 -0500
Message-ID: <20050112152437.GA17646@bender.817west.com>
References: <1105537635.3751.22.camel@hubcap.ljm.dom>
	<20050112151142.79460.qmail@web26102.mail.ukl.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20050112151142.79460.qmail@web26102.mail.ukl.yahoo.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Wed, Jan 12, 2005 at 04:11:42PM +0100, Roland Kaeser wrote:
> Hi
> 
> I got a look at the proposals You made. I tried it to compile but all I got was
> frustration, frustration and more. On the bottom-line snort-inline is a crap because
> it depends on very old software (libnet, which has itself a lot of bugs) and trying
> to compile it on a halfway actual system brings to to the mental hospital.  This
> makes it more frustrating becaus of the string match isn't our primary security part
> it should only prevent the servers from most common attacks to bring the load down.
> All traffic goes through reverse (or "normal") proxies which enables the application
> level firewall.

any proxy worth a "crap" can do more than the string match, so i fail
to see your point.  maybe your proxy is "crap."  maybe the skill set of
your proxy administrator is "crap."

> I JUST WANT TO RUN THE IPT_STRING ON A KERNEL 2.6.

yeah--yelling is a great way to inspire the folks that have already given
you all this great code for free to accept that their efforts thus far
have been insufficient to satisfy you.  to borrow a quote from the folks
on openbsd-misc:

"shut up and hack."

-j

--
"Another day, another box of stolen pens."
        --The Simpsons

