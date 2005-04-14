From: Adrian Turcu <adrian.turcu@gmvinteractive.com>
Subject: Re: I need help with "CONNMARK --set-mark"
Date: Thu, 14 Apr 2005 14:10:26 +0100
Message-ID: <200504141410.29155.adrian.turcu@gmvinteractive.com>
References: <200504111134.26674.adrian.turcu@gmvinteractive.com>
	<200504141332.41565.adrian.turcu@gmvinteractive.com>
	<20050414124539.GA1297@bender.817west.com>
Reply-To: adrian.turcu@gmvinteractive.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050414124539.GA1297@bender.817west.com>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

Thanks for your prompt answer Jason.

On Thu 14 Apr 2005 13:45, Jason Opperisano wrote:
> On Thu, Apr 14, 2005 at 01:32:33PM +0100, Adrian Turcu wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > I'm just trying to revive this as there was no answer till now. Maybe I'm
> > lucky this time :)
>
> i didn't respond because i couldn't really decipher what your actual
> question was.  if your question is:

It seems that I have to remember to switch off the message signing - company 
policy: signed messages only - not to interfere with sendig to the list.

I apologise to you all.

>
> why does "-j MARK --set-mark" seem to work while "-j CONNMARK
> --set-mark" seem to not work?  the best explanation i've seen posted
> here was:
>
>   http://marc.theaimsgroup.com/?l=netfilter&m=110894240806358&w=2
>
> if that's not your question--well that would explain why i didn't
> respond the first time.
>
> -j
>

Well, bottom line, that was my question, kind of, and that link you sent, it 
gives a very good explanation to the matter. I could not see this documented  
anywhere, I mean how CONNMARK behaves with its various options, maybe I did 
not read the right stuff. But anyway, great job! I have to stick with both of 
them, CONNMARK and the good old MARK.

Thanks again,
Adrian

