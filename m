From: Alessandro Vesely <vesely@tana.it>
Subject: Re: Best way to kill a live TCP connection?
Date: Tue, 11 Jan 2011 17:21:08 +0100
Message-ID: <4D2C8374.70408@tana.it>
References: <4D2C4E92.6040902@tana.it> <alpine.LNX.2.01.1101111537180.8612@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tana.it; s=test;
	t=1294762868; bh=WxvlXlRQujILZy9KhKm6xLQFB4KUd4I2vfIc/9izc5M=;
	l=926;
	h=Message-ID:Date:From:MIME-Version:To:CC:References:In-Reply-To:
	 Content-Transfer-Encoding;
	b=hDVtzqX9rUAhmZEXTB8Wswd4jC80lBlxZCgySkpj3s4JVxUROgyB16WRjKvrfKrzc
	 ahBaZNUipiWz27YJHsKG/iLsCgyOYgan+JxjM+4bl5cxeVSCsZWXSL9MmPGYpjL659
	 yRB3VcRiriajhr48MrEi6E3NLFw96tcw6IZnt7VY=
In-Reply-To: <alpine.LNX.2.01.1101111537180.8612@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: support@iptables.info

On 11/Jan/11 15:41, Jan Engelhardt wrote:
> On Tuesday 2011-01-11 13:35, Alessandro Vesely wrote:
> 
>>Hi all,
>>this is clearly an overworked topic.  However, I haven't been able to
>>find definitive info about it.  Please help providing more insight.
>>In particular, if it is possible/convenient to design an RST injector
>>and how to attach it to iptables?
> 
> If you use a ruleset that emits RST for NEW connections that are picked 
> up rather than SYN-new,
> 
> -m conntrack --ctstate NEW -p tcp ! --syn --dport 22 -j REJECT 
> --reject-with tcp-reset
> 
> .. makes it possible to RST-kill connections using `conntrack -D`.

That's the most elegant method I've seen thus far.  Thanks a lot!

A generic rule like that (i.e. without --dport) is mentioned in the
tutorial http://www.iptables.info/en/iptables-problems.html#NEWNOTSYN
but I never realized it can be used this way.  (I CC this there.)
