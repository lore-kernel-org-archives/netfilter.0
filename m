From: Andrew Beverley <andy@andybev.com>
Subject: Re: Run a userspace script upon rule matching?
Date: Thu, 08 Mar 2012 22:02:08 +0000
Message-ID: <1331244128.30413.442.camel@andrew-desktop>
References: <4F58AA04.4010805@brain-force.ch>
	 <1331227169.30413.432.camel@andrew-desktop>
	 <4F5928DD.4040206@brain-force.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4F5928DD.4040206@brain-force.ch>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1331244131;
	bh=X1uwjcWVw7cL/+hhrCkvsk/VpARqbXSmUI6eNyfdL/Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:Mime-Version;
	b=NnNqlAhgCR9B7mYEJFo/aBzcdDkK/HYHnd3P0Q60RL/D5do9Wom89CfvjJQTTDbid
	 AaI/hdFK0IDyNFN0u/9OvXRG6pN2D3fiR6PBw3uNiuK5ILF+ahr6i9UAbMM73d4G8X
	 Ps81om+kfk1y7SH0v7iMAVWOBlCTo8Yb0IfhGNKU=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: tobi <tobster@brain-force.ch>
Cc: netfilter@vger.kernel.org

On Thu, 2012-03-08 at 22:47 +0100, tobi wrote:
> okay more details about my intention: I got a script that checks some 
> logs and acts upon violation by adding IPs to a sperate chain via 
> iptables -A OFFENDERS -s IP -j DROP. So such IPs get blocked. Now I 
> thought about how could I find out if IPs from OFFENDERS come again. So 
> I put another chain to iptables (before the OFFENDERS), put the IPs from 
> OFFENDERS and set the log target for each rule. But then I need a script 
> that reads the logs and searches for IPs from OFFENDERS. Too complex for 
> me :-)
> So I thought it should somehow be possible to achieve that quite easy IF 
> I could add a script to be executed when a rule (that now goes to log 
> target) matches. Thats were I stand now :-)
> All I "need" would be a way to excute a simple mailx command with the 
> offending IP and send a mail to myself

Okay, a few ideas then:

1. Log the packets with a specific prefix, and use rsyslog with the Mail
Output Module and relevant configuration to alert you to such logs:

http://www.rsyslog.com/doc/ommail.html

2. Use ULOGD. Never really used it myself, but you might be able to
create some sort of userspace program that alerts you.

3. Log the IP addresses to an IPSET, and use a cron job to check the
list of IP addresses in the set.

Just thoughts, but hopefully one of the above will work.

Andy


