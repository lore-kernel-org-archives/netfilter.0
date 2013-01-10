From: Born Without <blackhole@airpost.net>
Subject: Re: Wrapper script for ipset listing
Date: Thu, 10 Jan 2013 13:53:48 +0100
Message-ID: <50EEB9DC.7070902@airpost.net>
References: <50E84F5E.8060704@airpost.net> <alpine.LNX.2.01.1301051809460.23031@nerf07.vanv.qr> <50E8F495.40307@airpost.net> <alpine.LNX.2.01.1301062030320.14070@nerf07.vanv.qr> <alpine.DEB.2.00.1301070852290.591@blackhole.kfki.hu> <50ED13BC.6010005@airpost.net> <20130109115232.GA19321@1984>
Reply-To: blackhole@airpost.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=airpost.net; h=
	message-id:date:from:reply-to:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	 s=mesmtp; bh=PALnlKcVjfmn9PccXXX/5hupfto=; b=TzNuKw0XZ30TYc9/yL
	+HJM7C3okVtlnPEWH+uAqGYWOb1SCkqhdeIZ1cpWZwaSzLpDGir9lmwN2kuHhyzM
	fnXdXlSLJVGMR0MOD3wW5+Fx0PbJgHc2egZd5bNhHBRFLZgOIBoLlvUXl1PwdSVn
	I98h7Atg4PWbrXnBdPnORsJn4=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:date:from:reply-to
	:mime-version:to:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding; s=smtpout; bh=PALnlKcVjfmn9PccXXX/5h
	upfto=; b=mAmCPIdezQ9fH3q1deMCFTRVYC31uQIlXz1N1kgXofQwvkrB5za95O
	nX4mIahgJgMFJ6hLBrI2fPkkzhluXIHH6Rm2GgA4SLYxlAsMHMEnEJvFp1yFtt6L
	VqFMj+WXp+AEH0giO9445OyH5/cfkXda3mzgDFZDGhpQr6ZZGDG8Y=
In-Reply-To: <20130109115232.GA19321@1984>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, Jan Engelhardt <jengelh@inai.de>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 09.01.2013 12:52, Pablo Neira Ayuso wrote:
[...]
>>>> On Sunday 2013-01-06 04:50, Born Without wrote:
>>>>>>> As I was missing those features in the ipset set listing capabilities:
>>>>>>>
>>>>>>> - show sum of set members
>>>>>>> - suppress listing of headers
>>>>>>> - choose a delimiter character for separating member entries
>>>>>>>
>>>>>>> I wrote a little wrapper script (for the bash shell) to support them.

[...]

> Suggestion: Some explicit header with licensing terms of your script
> is a good idea if you want to share things, otherwise the law in most
> countries defaults to "all right reserved".
>
> And if you use the same license than ipset, it may help Jozsef to
> consider adding that to some contrib directory. Or you can just
> publish it in your personal website.

Thank you for the suggestion.
I wasn't even thinking of license stuff...
This is just a simple helper script. Anybody can use it freely.
But no problem, I'll add some license :)
Don't know much about them.
But I guess GPL 3 will do?
Also for Jozsef, if he would consider adding it to contrib?

One thing still is missing, to make it more foolproof, there's no 
checking for supported ipset versions (i.e v2.x) in the script.
I only have 6.16.1 installed.
I don't know if the -v|--version option is persistent through ipset 
versions.
I don't know if the format of the version output is persistent through 
ipset versions.
I don't know from what version the \`list' action is valid (before it 
was -L i think?).
I don't know if the plain listing output (header - members) is 
persistent through ipset versions.

With this information I could incorporate version checking and 
eventually support older versions.

Best regards
