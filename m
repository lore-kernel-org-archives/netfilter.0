From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: PPTP+NAT+MASQ anyone?
Date: 09 Dec 2002 16:17:27 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1039447047.25961.47.camel@tux>
References: <200212091226.23888.roy@karlsbakk.net>
	<200212091512.10109.roy@karlsbakk.net> <1039444945.28074.43.camel@tux> 
	<200212091558.22457.roy@karlsbakk.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200212091558.22457.roy@karlsbakk.net>
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

On Mon, 2002-12-09 at 15:58, Roy Sigurd Karlsbakk wrote:

> > You said "the only one I've managed to patch-o-matic" which means the
> > only one you've managed to patch. What you are saying now is that you
> > indeed did manage to patch your kernel. Please use more accurate wording
> > in reports like these.
> 
> the only one I have been able to patch up with the patch-o-matic pptp patch, 
> was 2.4.18.
> 
> > And you are NOT using patch-o-matic from cvs, I know this because these
> > problems were fixed some time ago (and doublechecking the files I see
> > that they were indeed fixed). The error you are seeing is _impossible_
> > with patch-o-matic from cvs (the #error lines doesn't even exist)
> 
> I've tried all the ones I can find.
> When trying to apply the pptp-conntrack-nat.patch, I get errors applying it. 
> Do I need to hand patch this thing? I've tried with 2.4.{18,19,20}

Did you run './runme pending' first like the documentation tells you?

-- 
/Martin

Never argue with an idiot. They drag you down to their level, then beat
you with experience.

