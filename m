From: "Glover George" <dime@gulfsales.com>
Subject: RE: msn voice chat
Date: Tue, 31 Dec 2002 15:10:28 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000801c2b111$0e4aaad0$6c00a8c0@blue>
References: <20021231205047.35668.qmail@web40304.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021231205047.35668.qmail@web40304.mail.yahoo.com>
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
To: 'Kevin McConnell' <kevymac@yahoo.com>, 'Roy Sigurd Karlsbakk' <roy@karlsbakk.net>
Cc: cuigl@ilion.bio.sunysb.edu, netfilter@lists.netfilter.org

Forgot to post this.  I point you to what Harold recommended back when I
first started.

http://lists.netfilter.org/pipermail/netfilter-devel/2002-April/007420.h
tml 

And other than google, it's been a while.  How would I search for this?
I tried google and came up with nothing.  I'd like to look at this
patch, although this would only solve the SIP problem right?  Is RTP in
there as well?  Even if this did fix the problem it only fixes it for
SIP programs, which may be all you care about.  But like I said, the
overhead of this on something like a 386 to do all that translation,
especially when the ip address is never in the same place, that's a lot
of text matching to do for something like a high speed video and voice
conversation while running a remote assistance, or something of the
like.  

UPnP is just another solution to the problem, that happens to solve a
lot of other problems with clients that are UPnP aware at the same time.
(And being a sysadmin myself, I must say a lot easier to set up than
recompiling your kernel with these experimental helpers).  But then I'm
thinking of the users and myself on that one ;-)

Cheers.

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Kevin
McConnell
Sent: Tuesday, December 31, 2002 2:51 PM
To: Roy Sigurd Karlsbakk; Glover George
Cc: cuigl@ilion.bio.sunysb.edu; netfilter@lists.netfilter.org
Subject: Re: msn voice chat


--- Roy Sigurd Karlsbakk <roy@karlsbakk.net> wrote:
> As far as I'm concerned, MSN telephony, and voice
> chat, uses SIP, not 
> h.323, and SIP also needs a helper module the same
> way as pptp, ftp, 
> irc etc

I am fairly sure that cronos has written a helper
module that can be downloaded and tested if one was
curious. Check out the listman's history for a link to
the patch he designed.


=====
Kevin C. McConnell --RHCE-- <Red Hat Certified Engineer>

__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com




