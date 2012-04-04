From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Iptables "-m time" option doesn't update when the clock changes
Date: Wed, 4 Apr 2012 08:14:51 -0500
Message-ID: <20120404131451.GI3502@harrier.slackbuilds.org>
References: <4F7426FA.2060902@open-t.co.uk>
 <alpine.LNX.2.01.1203291111080.27349@frira.zrqbmnf.qr>
 <4F742BAD.20002@open-t.co.uk>
 <alpine.LNX.2.01.1203291157170.3606@frira.zrqbmnf.qr>
 <4F7437C3.5060306@open-t.co.uk>
 <20120329134557.GK4603@harrier.slackbuilds.org>
 <4F7A04A8.8020901@open-t.co.uk>
 <20120402220757.GC3502@harrier.slackbuilds.org>
 <4F7ADFA2.9040507@open-t.co.uk>
 <4F7C15E5.3010506@oracle.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4F7C15E5.3010506@oracle.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Wed, Apr 04, 2012 at 10:35:33AM +0100, John Haxby wrote:
> On 03/04/12 12:31, Sebastian Arcus wrote:
> >>> Thanks for the suggestion. However, restarting the firewall (which
> >>> flushes and re-writes the rules) makes absolutely no difference. I
> >>
> >> Did you substitute the changed time? I don't see how using different
> >> times in your rules would make no difference. Indeed, if not changing
> >> times, reloading the same rules would make no difference.
> >
> > Sorry - you are right - I didn't substitute the times in the firewall
> > rules. On the other hand - a script which would restart the machine is
> > easier (in this particular case) - than one which would amend the
> > firewall rules and reload them. 
> 
> Not sure if this is relevant, but getting a local time in UTC in a 
> shell script isn't hard:

No, it's not hard, and the workaround is not really the point here, 
or at least it should not be. The real issue is how to inform the 
kernel of the timezone.

http://lkml.indiana.edu/hypermail/linux/kernel/0702.2/1182.html :
"setsystz" seems to be one answer. In my limited testing it works 
with -m time rules using --localtz (the default.) When changing the 
kernel's timezone while a --timestart/--timestop was in effect, to 
make the rule no longer applicable, it did stop matching.

The author posted that in early 2007, saying that most/all distros 
get this wrong. Is that still the case?

What I'm still not sure about is the way the distros should handle 
this. The Slackware timeconfig script (which is run during setup) 
asks the user if the hardware clock is in UTC, and based on that 
information, the rc.S script runs either of these:
	/sbin/hwclock $CLOCK_OPT --utc --hctosys
	/sbin/hwclock $CLOCK_OPT --localtime --hctosys
depending on that choice.

Seems like the proper thing to do might be
	/sbin/hwclock $CLOCK_OPT --utc --systz
but I don't know if that should be in addition to, or in place of, 
the --hctosys command. (And I think this only matters for the UTC 
users; having the hwclock in localtime is broken anyway.) I'm also 
unsure if that will handle the DST changes. If not, setsystz looks 
like the best solution, run as a cron or at job.
-- 
  http://rob0.nodns4.us/ -- system administration and consulting
  Offlist GMX mail is seen only if "/dev/rob0" is in the Subject:
