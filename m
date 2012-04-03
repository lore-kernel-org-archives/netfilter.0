From: Sebastian Arcus <shop@open-t.co.uk>
Subject: Re: Iptables "-m time" option doesn't update when the clock changes
Date: Tue, 03 Apr 2012 12:31:46 +0100
Message-ID: <4F7ADFA2.9040507@open-t.co.uk>
References: <4F7426FA.2060902@open-t.co.uk> <alpine.LNX.2.01.1203291111080.27349@frira.zrqbmnf.qr> <4F742BAD.20002@open-t.co.uk> <alpine.LNX.2.01.1203291157170.3606@frira.zrqbmnf.qr> <4F7437C3.5060306@open-t.co.uk> <20120329134557.GK4603@harrier.slackbuilds.org> <4F7A04A8.8020901@open-t.co.uk> <20120402220757.GC3502@harrier.slackbuilds.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20120402220757.GC3502@harrier.slackbuilds.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org
Cc: /dev/rob0 <rob0@gmx.co.uk>

On 02/04/12 23:07, /dev/rob0 wrote:
> On Mon, Apr 02, 2012 at 08:57:28PM +0100, Sebastian Arcus wrote:
>> On 29/03/12 14:45, /dev/rob0 wrote:
>>> On Thu, Mar 29, 2012 at 11:21:55AM +0100, Sebastian Arcus wrote:
>>>> On 29/03/12 11:00, Jan Engelhardt wrote:
>>>> </snip>
>>>>>   The  caveat  with  the  kernel timezone is that Linux distributions may
>>>>>   ignore to set the kernel timezone, and  instead  only  set  the  system
>>>>>   time.  Even if a particular distribution does set the timezone at boot,
>>>>>   it is usually does not keep the kernel timezone offset - which is  what
>>>>>   changes  on DST - up to date.  ntpd will not touch the kernel timezone,
>>>>>   so running it will not resolve the issue. As such, one may encounter  a
>>>>>   timezone that is always +0000, or one that is wrong half of the time of
>>>>>   the year. As such, using --kerneltz is highly discouraged.
>>>>>
>>>> Thanks for taking the time to give a detailed reply. Just to
>>>> make sure I understand correctly - would this mean that there is
>>>> no reliable way to run time based iptables rules and have them
>>>> keep up with DST changes correctly and automatically - without
>>>> restarting the machine when the DST kicks in or out?
>>>
>>> Restarting the machine? Blasphemy!
>>>
>>> Why not simply reload the firewall rules?
>>>
>>> A simple at(1) job on the DST-to-standard and standard-to-DST
>>> dates to reload the rules, either using your distro's firewall
>>> management tools, or pipe iptables-save to iptables-restore
>>> (substituting for the changed times), ought to do the job just
>      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>> fine.
>>
>> Thanks for the suggestion. However, restarting the firewall (which
>> flushes and re-writes the rules) makes absolutely no difference. I
>
> Did you substitute the changed time? I don't see how using different
> times in your rules would make no difference. Indeed, if not changing
> times, reloading the same rules would make no difference.

Sorry - you are right - I didn't substitute the times in the firewall 
rules. On the other hand - a script which would restart the machine is 
easier (in this particular case) - than one which would amend the 
firewall rules and reload them.

I'm happy to run any other tests on Slackware if somebody can figure out 
what needs testing.
