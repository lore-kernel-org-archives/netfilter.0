From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: How can I ask IPTABLES to drop a packet based upon its content
Date: Wed, 6 Aug 2003 14:01:04 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200308061401.04219.Alistair@nerdnet.ca>
References: <88116A11E9DFD411870900508BEC3831803C2B@CPQ01> <20030806125324.GA6378@china.patternbook.com>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030806125324.GA6378@china.patternbook.com>
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
To: Whit Blauvelt <whit@transpect.com>, Deshwal Chand <CDD@kampsax.co.in>
Cc: "Netfilter (E-mail)" <netfilter@lists.netfilter.org>

On August 6, 2003 08:53 am, Whit Blauvelt wrote:
> You might find it much easier, although still a lot of work, to install a
> relaying mail server on the firewall that uses SpamAssassin and Razor
> called from the MIMEDefang milter in sendmail. I've also seen a Webpage
> somewhere on doing this using Qmail and SpamAssassin (you might google for
> it). This is all free software - the only investment is your time.
>
> Asking iptables to do it is putting the load in the wrong place, and
> failing to take advantage of the work already done in using mail daemons
> for this task.
>
> Whit
>
> On Wed, Aug 06, 2003 at 03:07:31PM +0530, Deshwal Chand wrote:
> > Hi,
> >
> > I am running IPTABLES on Redhat 7.2 box. We are running a mail server
> > behind this firewall. We receive lot of spam e-mails. Instead of
> > investing into the anti-spam s/w, I want to configure the IPTABLES to
> > read the contents on the packets and drop them based upon the filter
> > defined.
> >
> > Any help ......
> >
> >
> > Regards,
> >
> > Chand

	Although it was a LOT of work and fair trial for me, (not being a sendmail or 
QMail guru) I've got Qmail and spamassasin working using the spamassassin 
filtering for spam and an antivirus scanner working as well... this requires 
some serious CPU horsepower under load, but in many small business cases 	
can be done with your average desktop class power.

	I haven't pushed the application yet, but I did grab about 350 mixed test 
mails and throw them at it once to see how long it would take to process.

	It loaded the box, and took about 8 minutes to process the works on an 
AMD 1500 cpu, 756Mb ram, IDE disks and about 75% of that was the time for the
AV scanner to process several large zip files, which actually contained virus 
triggers (not real viruses, but code that should trigger virus scanners)

	The above has a $0 cost in terms of software code, but can be supported for a 
nominal fee if required. (and b-t-w it beat the daylights outta the MS 
implementation that work has.)
	
	I REALLY don't recommend using IPTABLES with string matching to try and 
replace spam filtering.
     You MIGHT consider using IPTABLES, and RTBH to filter based on ip 
addresses of known spammers, but I'm not sure that someone has come up with 
an effective manner of combining these tools yet.
-- 

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

