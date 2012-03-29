From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Iptables "-m time" option doesn't update when the clock changes
Date: Thu, 29 Mar 2012 08:45:57 -0500
Message-ID: <20120329134557.GK4603@harrier.slackbuilds.org>
References: <4F7426FA.2060902@open-t.co.uk>
 <alpine.LNX.2.01.1203291111080.27349@frira.zrqbmnf.qr>
 <4F742BAD.20002@open-t.co.uk>
 <alpine.LNX.2.01.1203291157170.3606@frira.zrqbmnf.qr>
 <4F7437C3.5060306@open-t.co.uk>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4F7437C3.5060306@open-t.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Thu, Mar 29, 2012 at 11:21:55AM +0100, Sebastian Arcus wrote:
> On 29/03/12 11:00, Jan Engelhardt wrote:
> </snip>
> >  The  caveat  with  the  kernel timezone is that Linux distributions may
> >  ignore to set the kernel timezone, and  instead  only  set  the  system
> >  time.  Even if a particular distribution does set the timezone at boot,
> >  it is usually does not keep the kernel timezone offset - which is  what
> >  changes  on DST - up to date.  ntpd will not touch the kernel timezone,
> >  so running it will not resolve the issue. As such, one may encounter  a
> >  timezone that is always +0000, or one that is wrong half of the time of
> >  the year. As such, using --kerneltz is highly discouraged.
> >
> Thanks for taking the time to give a detailed reply. Just to make 
> sure I understand correctly - would this mean that there is no 
> reliable way to run time based iptables rules and have them keep up 
> with DST changes correctly and automatically - without restarting 
> the machine when the DST kicks in or out?

Restarting the machine? Blasphemy!

Why not simply reload the firewall rules?

A simple at(1) job on the DST-to-standard and standard-to-DST dates 
to reload the rules, either using your distro's firewall management 
tools, or pipe iptables-save to iptables-restore (substituting for
the changed times), ought to do the job just fine.

If you don't want to go to the trouble of looking up the DST change 
dates, you can brute force it with a cron job running every Sunday 
morning. (Either way involves some effort, pick that which you find 
less of a burden.)

rob0@harrier:~$ date
Thu Mar 29 13:43:59 UTC 2012
rob0@harrier:~$ TZ=Europe/London date
Thu Mar 29 14:44:10 BST 2012
rob0@harrier:~$ TZ=Europe/London date -d 'now - 1 month'
Wed Feb 29 13:44:19 GMT 2012

# bash-specific code:
Now=($(date))
[[ ${Now[4]} = BST ]] && load_BST_rules
[[ ${Now[4]} = GMT ]] && load_GMT_rules
# leaving it to you to write the load_*_rules functions
-- 
  http://rob0.nodns4.us/ -- system administration and consulting
  Offlist GMX mail is seen only if "/dev/rob0" is in the Subject:
