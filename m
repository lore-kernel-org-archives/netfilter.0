From: Matthew Schumacher <schu@design-pt.com>
Subject: Re: question about pptp connection tracking
Date: Fri, 19 Dec 2003 10:38:39 -0900
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FE353BF.30902@design-pt.com>
References: <3FE235CA.5050306@design-pt.com> <3FE24EB8.4080604@design-pt.com> <20031219082252.GB2794@obroa-skai.de.gnumonks.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031219082252.GB2794@obroa-skai.de.gnumonks.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Harald Welte <laforge@netfilter.org>
Cc: Netfilter Mailinglist <netfilter@lists.netfilter.org>

Sorry to make you repeat this... I was mostly just wondering if this 
should work or not.

To answer your questions, it's a plain 2.4.23 from kernel.org.  The only 
patches are the bsd-mppe patches from pptpd and pptp-conntrack-nat from 
pom 20030912.

I'll give the CVS stuff a whirl.

Thanks,
schu

Harald Welte wrote:
> On Thu, Dec 18, 2003 at 04:04:56PM -0900, Matthew Schumacher wrote:
> 
>>Confirmed, compiling the pptp-conntrack-nat patch as modules and not 
>>loading them causes my pptpd server to work again, loading them causes 
>>it to break.  Since iptables doesn't seem to be dropping packets I'm 
>>assuming that either (1) I have not configured iptables correctly, (2) I 
>>have found a bug, or (3) this module isn't supposed to work that way.
> 
> 
> *sigh*.  How often do I have to state this on the mailinglist:
> 
> a) which exact kernel version are you running? Plain source from
> kernel.org, vendor sources?
> b) which patches [apart from pptp] from what version_ of patch-o-matic
> did you apply?
> 
> Do you have any idea how much changes there are in pom and the kernel
> over time?  How can I guess whcih particular combination you are
> running, and which potential bugs have been solved since then?
> 
> 
>>>I'm using pptp-conntrack-nat from pom 20030912.
> 
> 
> that's most likely the problem.   please try using a more recent version
> (latest cvs snapshot or even CVS).
> 
> 


