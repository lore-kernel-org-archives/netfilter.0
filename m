From: tobi <tobster@brain-force.ch>
Subject: Re: Run a userspace script upon rule matching?
Date: Thu, 08 Mar 2012 22:47:09 +0100
Message-ID: <4F5928DD.4040206@brain-force.ch>
References: <4F58AA04.4010805@brain-force.ch> <1331227169.30413.432.camel@andrew-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=brain-force.ch;
	s=2011; t=1331243236;
	bh=HFSGxSrDh4lDGiuI4WB5S+ghjMBfuh7nCy41FYE04xA=;
	h=Date:From:MIME-Version:To:Subject:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	b=V3tmDBhvfifFEQG8Yup2FqCHh03qp7NXhQB+nqOZpndzhP5R3wWdk+rzePUj/tbCA
	 0T00/bSYdmvGFrBsFFGu+3iHjzYLVen0uL32MVxj54phOlizWmGZg74+ca18nb7KTS
	 8gAyXHD/qdDhYWXoZP/jymMmBas17fwGwGeqcFHc=
In-Reply-To: <1331227169.30413.432.camel@andrew-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Am 08.03.2012 18:19, schrieb Andrew Beverley:
> On Thu, 2012-03-08 at 13:45 +0100, tobi wrote:
>> As mentioned in subject I want to run an external script upon matching
>> of a certain rule.
> I'm not aware of any way to do that. What exactly do you want to
> achieve? It may be that there is another way of doing what you want.
>
> Andy
>
>
okay more details about my intention: I got a script that checks some 
logs and acts upon violation by adding IPs to a sperate chain via 
iptables -A OFFENDERS -s IP -j DROP. So such IPs get blocked. Now I 
thought about how could I find out if IPs from OFFENDERS come again. So 
I put another chain to iptables (before the OFFENDERS), put the IPs from 
OFFENDERS and set the log target for each rule. But then I need a script 
that reads the logs and searches for IPs from OFFENDERS. Too complex for 
me :-)
So I thought it should somehow be possible to achieve that quite easy IF 
I could add a script to be executed when a rule (that now goes to log 
target) matches. Thats were I stand now :-)
All I "need" would be a way to excute a simple mailx command with the 
offending IP and send a mail to myself

Thanks for any input and ideas

tobi
