From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: PPTP+NAT+MASQ anyone?
Date: 11 Dec 2002 15:03:46 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1039615426.20573.80.camel@tux>
References: <200212091226.23888.roy@karlsbakk.net>
	<200212091558.22457.roy@karlsbakk.net> <1039447047.25961.47.camel@tux> 
	<200212111249.53924.roy@karlsbakk.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200212111249.53924.roy@karlsbakk.net>
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
To: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Cc: Netfilter mailinglist <netfilter@lists.netfilter.org>

On Wed, 2002-12-11 at 12:49, Roy Sigurd Karlsbakk wrote:
> > > I've tried all the ones I can find.
> > > When trying to apply the pptp-conntrack-nat.patch, I get errors applying
> > > it. Do I need to hand patch this thing? I've tried with 2.4.{18,19,20}
> >
> > Did you run './runme pending' first like the documentation tells you?
> 
> yes. I get this error message when trying to patch 2.4.{19|20}. 

2.4.19 + all the pending stuff

Testing patch extra/pptp-conntrack-nat.patch...
   Placed new Config.in line
   Placed new Configure.help entry
   Placed new Makefile line
   Placed new Makefile line
   Placed new ip_conntrack.h line
   Placed new ip_conntrack.h line
   Placed new ip_conntrack.h line
   Placed new ip_conntrack.h line
   Placed new ip_conntrack.h line
   Placed new ip_conntrack.h line
   Placed new ip_conntrack.h line
   Placed new ip_conntrack.h line
   Patch extra/pptp-conntrack-nat.patch applied cleanly.

works fine.

IIRC the pptp patch doesn't apply if you've applied tcp-windowtracking
patch, that patch is quite invasive.

I just tried applying _all_ patches that come before the pptp patch in
p-o-m to 2.4.19 and then applying the pptp patch, no problem, worked
fine.


-- 
/Martin

Never argue with an idiot. They drag you down to their level, then beat
you with experience.

