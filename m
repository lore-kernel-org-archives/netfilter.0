From: "Linux" <linux@usermail.com>
Subject: Re: Fighting back
Date: Fri, 17 Jan 2003 16:27:08 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002501c2be7f$fad767a0$6301a8c0@VAIO>
References: <20030117192237.66443.qmail@web40206.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

That's a very good point.

Hmmm... More thinking needed.

Linux_303


----- Original Message -----
From: "SBlaze" <dagent.geo@yahoo.com>
To: "Linux" <linux@usermail.com>
Sent: Friday, January 17, 2003 12:22 PM
Subject: Re: Fighting back


> I think its safe to say we would all like to give a little back to those
who
> repeatedly bombard us with useless scans... What you want to do can
> "theoretically" be done with the MIRROR jump. Should it be done? Probably
not.
>
> Once an attacker learns they are in a sence scaning themselves.... they
can
> easily go about some sort of spoofing method in which the SRC IP is a
target as
> opposed to himself. You could easily find yourself a man in the middle of
a DOS
> attack against someone.
>
> I wouldn't do this... but hey it's up to you
>
> SBlaze
>
>
> --- Linux <linux@usermail.com> wrote:
> > Hello all,
> >
> > I feel that rpc and netbois scans to my network from the outside are an
> > obvious attempt to see what I have open, and I'm sure all of you would
agree.
> >  Because I run NFS only via my internal network, there are no machines
that
> > would connect via my external interface.  I am going to institute a rule
that
> > will cause a person scanning on ports 32770:32789 and 137 to redirect
and
> > scan the ports on the src IP address.  In essence, anyone scanning me,
will
> > be basically scanning themselves.
> >
> > All I am asking is for some input to this and whether it is a good idea
or
> > not.
> >
> > Thank you,
> >
> > Linux_303
> >
>
>
> =====
> "No touchy NO TOUCHY! Emperor Kuzko -=Emperor's New Groove=-"
>
> __________________________________________________
> Do you Yahoo!?
> Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
> http://mailplus.yahoo.com
>


