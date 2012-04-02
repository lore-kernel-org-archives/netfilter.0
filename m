From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Iptables "-m time" option doesn't update when the clock changes
Date: Mon, 2 Apr 2012 17:07:57 -0500
Message-ID: <20120402220757.GC3502@harrier.slackbuilds.org>
References: <4F7426FA.2060902@open-t.co.uk>
 <alpine.LNX.2.01.1203291111080.27349@frira.zrqbmnf.qr>
 <4F742BAD.20002@open-t.co.uk>
 <alpine.LNX.2.01.1203291157170.3606@frira.zrqbmnf.qr>
 <4F7437C3.5060306@open-t.co.uk>
 <20120329134557.GK4603@harrier.slackbuilds.org>
 <4F7A04A8.8020901@open-t.co.uk>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4F7A04A8.8020901@open-t.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Mon, Apr 02, 2012 at 08:57:28PM +0100, Sebastian Arcus wrote:
> On 29/03/12 14:45, /dev/rob0 wrote:
> >On Thu, Mar 29, 2012 at 11:21:55AM +0100, Sebastian Arcus wrote:
> >>On 29/03/12 11:00, Jan Engelhardt wrote:
> >></snip>
> >>>  The  caveat  with  the  kernel timezone is that Linux distributions may
> >>>  ignore to set the kernel timezone, and  instead  only  set  the  system
> >>>  time.  Even if a particular distribution does set the timezone at boot,
> >>>  it is usually does not keep the kernel timezone offset - which is  what
> >>>  changes  on DST - up to date.  ntpd will not touch the kernel timezone,
> >>>  so running it will not resolve the issue. As such, one may encounter  a
> >>>  timezone that is always +0000, or one that is wrong half of the time of
> >>>  the year. As such, using --kerneltz is highly discouraged.
> >>>
> >>Thanks for taking the time to give a detailed reply. Just to
> >>make sure I understand correctly - would this mean that there is
> >>no reliable way to run time based iptables rules and have them
> >>keep up with DST changes correctly and automatically - without 
> >>restarting the machine when the DST kicks in or out?
> >
> >Restarting the machine? Blasphemy!
> >
> >Why not simply reload the firewall rules?
> >
> >A simple at(1) job on the DST-to-standard and standard-to-DST 
> >dates to reload the rules, either using your distro's firewall 
> >management tools, or pipe iptables-save to iptables-restore 
> >(substituting for the changed times), ought to do the job just
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >fine.
> 
> Thanks for the suggestion. However, restarting the firewall (which
> flushes and re-writes the rules) makes absolutely no difference. I

Did you substitute the changed time? I don't see how using different 
times in your rules would make no difference. Indeed, if not changing 
times, reloading the same rules would make no difference.

> have to actually restart the machine for the rules to behave 
> according to the correct time. Maybe there is something wrong with 
> the way Slackware updates the kernel TZ - as per Jan's post. I've 
> posted to the Slackware list on linuxquestions.org to see if 
> anybody knows more.

If we can figure out what needs to be done on the Slackware side, 
this probably will be fixed. I think maybe "hwclock --utc --systz" 
would do it in a weekly cron job. (Of course also reading the value 
set in /etc/hardwareclock and not running for those misguided souls 
who use --localtime for their hwclock.)

I'm not sure that this is the fix, however; hwclock(8) isn't clear 
(to me) about setting the kernel's TZ.

> PS I agree with your position on restarting servers :-) but I don't
> seem to get any choice in this matter
-- 
  http://rob0.nodns4.us/ -- system administration and consulting
  Offlist GMX mail is seen only if "/dev/rob0" is in the Subject:
