From: =?iso-8859-1?q?Stephen=20Bylo?= <stephenbylo@yahoo.com.sg>
Subject: Re: DNAT/SNAT & existing connections
Date: Fri, 18 Jul 2003 09:09:31 +0800 (CST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030718010931.55307.qmail@web13101.mail.yahoo.com>
References: <20030717122907.GA30482@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030717122907.GA30482@cannon.eng.us.uu.net>
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
To: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Cc: netfilter@lists.netfilter.org

Hi!

I have now found what I'm looking for!
 eg.:  http://mosquitonet.stanford.edu/mip/
Mobile IP creates a tunnel from R through A to (2).
That's what I need.  I don't really need a NAT.

Thanx for the help,
Steve

 --- Ramin Dousti <ramin@cannon.eng.us.uu.net> wrote:
> On Thu, Jul 17, 2003 at 10:14:43AM +0800, Stephen
> Bylo wrote:
> 
> > If I want *existing* UDP connections to be
> diverted, I
> > need to change both the NAT table *and* the
> connection
> > tracking table, is this right? Can somebody tell
> me if
> > this can be done with iptables?  Do I have to hack
> the
> > code? I may do so if need be. Is there another NAT
> > sollution out there that can do what I need?
> > Is using a NAT to divert existing UDP streams
> > technically possible?
> 
> I think one way of doing this is to reduce the
> conntrack timeout for
> UDP to almost nihil so that you see the effect of
> adding 2 to the nat
> immidiately. But in that case UDP returns would not
> benefit from the
> implicit conntrack structure and you need to allow
> the return traffic
> explicitly.
> 
> Ramin
> 
> > 
> > Thanx for your help.
> > Steve 

__________________________________________________
Do You Yahoo!?
Send free SMS from your PC!
http://sg.sms.yahoo.com

