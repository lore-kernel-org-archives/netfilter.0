From: Marc Williams <marcw@onlymooo.com>
Subject: RE: h.323 compatibility
Date: Tue, 18 Nov 2003 20:48:48 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1069210128.9755.93.camel@fred.williams.etc>
References: <09B04A55822EFF4DA48D2E0BB2941D4A28AD21@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <09B04A55822EFF4DA48D2E0BB2941D4A28AD21@wardrive.citadelcomputer.com.au>
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
To: George Vieira <georgev@citadelcomputer.com.au>
Cc: netfilter list <netfilter@lists.netfilter.org>

On Tue, 2003-11-18 at 20:21, George Vieira wrote:
> >And if you're banning my ISP - Comcast - you've just banned the majority of broadband users in the US.
> Hoah!!  How cool.. :)
> 

:-)


> I have no problems with H323 and using NetMeeting behind a 2.4.19 kernel firewall. The only thing that was needed to get 2 people who are both behind linux firewalls was that 1 had to Host a Meeting for someone outside to connect. I found that part weird..
> 
> Have you tried this patch at all yet. Just remember there's 2 modules neededing to be loaded a I forgot one the first time around.
> 

The issue isn't with Netmeeting.  Rather it's with two other apps I run
that use openh323 - Gnomemeeting and GNUgk both running behind an
iptables FW.  I am indeed having problems, particularly with the
gatekeeper.  Thus my question about compatibility.



> > -----Original Message-----
> > From: Marc Williams [mailto:marcw@onlymooo.com]
> > Sent: Wednesday, 19 November 2003 1:13 PM
> > To: netfilter list
> > Subject: h.323 compatibility
> > 
> > 
> > Even though I'm new to this list, I think that this should probably be
> > addressed by Jozsef Kadlecsik.
> > 
> > Jozsef, I've read a couple of your posts on this list that seem to
> > indicate that there is a known incompatibility between your h323
> > conntrack module and the openh323 libraries.
> > 
> > Is this accurate?  If so, are there any plans to address this
> > incompatibility?  I've been unable to get the GNU gatekeeper 
> > functioning
> > correctly behind an iptables firewall for possibly this reason.
> > 
> > Thanks!
> > 
> > 
> > p.s.
> > Btw, I tried emailing you about this but it was bounced 
> > saying that your
> > MTA rejected my email saying my site was banned because of unsolicited
> > email.  I can assure you that there has never been one single spam
> > emanating from my site ever.  And if you're banning my ISP - Comcast -
> > you've just banned the majority of broadband users in the US.
> > 
> > 
> > 
> 
> 


