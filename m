From: John Haxby <john.haxby@oracle.com>
Subject: Re: Iptables "-m time" option doesn't update when the clock changes
Date: Wed, 04 Apr 2012 10:35:33 +0100
Message-ID: <4F7C15E5.3010506@oracle.com>
References: <4F7426FA.2060902@open-t.co.uk> <alpine.LNX.2.01.1203291111080.27349@frira.zrqbmnf.qr> <4F742BAD.20002@open-t.co.uk> <alpine.LNX.2.01.1203291157170.3606@frira.zrqbmnf.qr> <4F7437C3.5060306@open-t.co.uk> <20120329134557.GK4603@harrier.slackbuilds.org> <4F7A04A8.8020901@open-t.co.uk> <20120402220757.GC3502@harrier.slackbuilds.org> <4F7ADFA2.9040507@open-t.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4F7ADFA2.9040507@open-t.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sebastian Arcus <shop@open-t.co.uk>
Cc: netfilter@vger.kernel.org, /dev/rob0 <rob0@gmx.co.uk>

On 03/04/12 12:31, Sebastian Arcus wrote:
>>> Thanks for the suggestion. However, restarting the firewall (which
>>> flushes and re-writes the rules) makes absolutely no difference. I
>>
>> Did you substitute the changed time? I don't see how using different
>> times in your rules would make no difference. Indeed, if not changing
>> times, reloading the same rules would make no difference.
>
> Sorry - you are right - I didn't substitute the times in the firewall
> rules. On the other hand - a script which would restart the machine is
> easier (in this particular case) - than one which would amend the
> firewall rules and reload them. 

Not sure if this is relevant, but getting a local time in UTC in a shell
script isn't hard:

date --utc -d "$(date "+%H:%M:%S +%z" -d 09:00:00)" +%H:%M:%S

In California right now that gives 16:00:00 and in the UK 08:00:00

You could use that to reload your firewall rules on a daily basis (after
the time the clocks change) or just for the date that the clocks change
(last Sunday in March and October respectively in the UK).

jch
