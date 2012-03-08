From: tobi <tobster@brain-force.ch>
Subject: Re: Run a userspace script upon rule matching?
Date: Thu, 08 Mar 2012 23:43:45 +0100
Message-ID: <4F593621.3050202@brain-force.ch>
References: <4F58AA04.4010805@brain-force.ch>  <1331227169.30413.432.camel@andrew-desktop>  <4F5928DD.4040206@brain-force.ch> <1331244128.30413.442.camel@andrew-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=brain-force.ch;
	s=2011; t=1331246627;
	bh=Sm5C0sHgpcQrUjg6/syT175rs6e6PngSMQItoc9veBU=;
	h=Date:From:MIME-Version:To:Subject:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	b=AqDPI+a8Vygr40AZHsAwFzwG97QiNu4Nx5ZbZBKVmis7p0N27veLPnWRcpkBSlGS6
	 KYG2AK0tytAX3M6Amk9V6DF9yA0LGSJDHMi2fZaSUfgq2i1huub9O+aMZn9S54Sp1i
	 tWV/AR959+W6nwM/2nNC5avVwfBFKZT82u016Ob8=
In-Reply-To: <1331244128.30413.442.camel@andrew-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Am 08.03.2012 23:02, schrieb Andrew Beverley:
> On Thu, 2012-03-08 at 22:47 +0100, tobi wrote:
>> okay more details about my intention: I got a script that checks some
>> logs and acts upon violation by adding IPs to a sperate chain via
>> iptables -A OFFENDERS -s IP -j DROP. So such IPs get blocked. Now I
>> thought about how could I find out if IPs from OFFENDERS come again. So
>> I put another chain to iptables (before the OFFENDERS), put the IPs from
>> OFFENDERS and set the log target for each rule. But then I need a script
>> that reads the logs and searches for IPs from OFFENDERS. Too complex for
>> me :-)
>> So I thought it should somehow be possible to achieve that quite easy IF
>> I could add a script to be executed when a rule (that now goes to log
>> target) matches. Thats were I stand now :-)
>> All I "need" would be a way to excute a simple mailx command with the
>> offending IP and send a mail to myself
> Okay, a few ideas then:
>
> 1. Log the packets with a specific prefix, and use rsyslog with the Mail
> Output Module and relevant configuration to alert you to such logs:
That's how I actually do it: Log it with a prefix, I just use syslog-ng
>
> http://www.rsyslog.com/doc/ommail.html
>
> 2. Use ULOGD. Never really used it myself, but you might be able to
> create some sort of userspace program that alerts you.
I tried to find information whether ULOGD can really execute external 
commands. For me sounds more like loggin to databases. But while 
googling for ULOGD I found spectre, which seems to have an built-in 
plugin EXEC which can run commands. I will give spectre the first chance 
and if it's not working I try with ULOGD
> 3. Log the IP addresses to an IPSET, and use a cron job to check the
> list of IP addresses in the set.
>
> Just thoughts, but hopefully one of the above will work.
>
> Andy
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
Thanks a lot for your ideas. I think I can somehow achieve it. Although 
I do not know for sure which way to take. First try spectre

Cheers

tobi
