From: SBlaze <dagent.geo@yahoo.com>
Subject: Re: Need help have some questions...
Date: Mon, 25 Aug 2003 13:05:07 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030825200507.25987.qmail@web40207.mail.yahoo.com>
References: <20030825032403.GA26945@cannon.eng.us.uu.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030825032403.GA26945@cannon.eng.us.uu.net>
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
To: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Cc: nf <netfilter@lists.netfilter.org>


--- Ramin Dousti <ramin@cannon.eng.us.uu.net> wrote:
> On Sat, Aug 23, 2003 at 01:51:58PM -0700, SBlaze wrote:
> 
> > A question to Ralf about the second lawyer of a firewall. Is a circut relay
> > also known as a bridge?
> 
> In general:
> 
> layer 1 -> repeater
> layer 2 -> bridge
> layer 3 -> router
> 
> Now, what does the circuit relay do? Does it just amplify the signal? Or does
> it terminate, reconstruct and forward the information?
> 
Ralf seems to disagree that the second layer is a bridge... I never though of a
bridge as a dumb proxy...but thats essentially what it is right?? Anyway this
isn't really the focus of what I want to know... 
> > 
> > Also a question to Ramin. You make note in that last post of basically
> dealing
> > with the HTTP protocol on the HTTP application level.... are you referreing
> to
> > web server(apache) ?
> 
> No. What I said is: Filtering based on the specifics of an application is
> best
> done by a specialized module which knows enough about that particular
> protocol.
> 
> Ramin

So if I understand what Ramen is saying. It is possible to do this with a
module  that could be loaded into iptables. Aside from the CPU argument is
there any other reason why this isn't being done? It seems to come up time and
time again.

> > 
> > Thanks to all who are helping out. I see a soloution coming about. With a
> > little more help I and some others I know may get there.
> > 
> > Thanks
> > SBlaze

Again no one really shed any light on what I'm supposed to do here. What proxy
am I supposed to use? Everyone is saying use a proxy but no one is giving any
specifics as to what kind or what software?.

Thanks
SBlaze


=====
"Winky is not knowing how sir, winky is not knowing how?" -=Winky / Harry Potter and the Goblet of Fire=-"

__________________________________
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software
http://sitebuilder.yahoo.com

