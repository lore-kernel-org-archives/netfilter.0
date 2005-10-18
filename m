From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: logging port 25
Date: Tue, 18 Oct 2005 10:59:34 -0500
Message-ID: <200510181059.34916.rob0@gmx.co.uk>
References: <435514F5.9000201@mail.bloomfield.k12.mo.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <435514F5.9000201@mail.bloomfield.k12.mo.us>
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

On Tuesday 2005-October-18 10:29, Scott Mayo wrote:
> the outside.  What rules do I need to set in my firewall, so that any
> mail that is destined for my mail server through port 25 is alright,
> but any mail that is destined for port 25 that is not going to my
> mail server, gets logged and dropeed.
>
> I am trying to do this in case I get a virus that uses its own smtp
> to send out mail.

Good idea. You probably already have some.

> What would I need to put in for my rules?  I thought that I had it

Tell us what you tried and I will tell you why it was wrong. My crystal 
ball thinks you put the rules in INPUT. Was it right?

> down correctly, but I am not getting anything in the log.  It does
> log this to /var/log/messages doesn't it?

It logs according to the configuration of your system syslogd. It might 
also log to different places depending upon --log-level if specified in 
the rule[s] which you did not post. IINM the default syslog facility 
and priority is kern.info, but /proc settings can change the priority 
too.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

