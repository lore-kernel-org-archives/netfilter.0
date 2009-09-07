From: Anatoly Muliarski <x86ever@gmail.com>
Subject: Re: How to view blacklist ip ?
Date: Mon, 7 Sep 2009 21:37:33 +0300
Message-ID: <38db14850909071137l3b70e3ecp7eb4b21fd9bffcf6@mail.gmail.com>
References: <4AA4A0D4.3080109@infoservices.in>
	 <4AA4B741.7010209@plouf.fr.eu.org> <4AA4B9B3.6020409@infoservices.in>
	 <4AA4BD7D.3080405@infoservices.in> <4AA4C0E6.9050101@plouf.fr.eu.org>
	 <4AA4C3B8.7080309@infoservices.in> <4AA4D05E.5050909@infoservices.in>
	 <4AA4E1AD.4040200@plouf.fr.eu.org> <4AA4FA86.2020601@infoservices.in>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type;
        bh=WkehDZKlIK6M+0D2fpS16A4MHsFqdz/LFGcBEBh8Alg=;
        b=CwY8nOL6VdzwbNx6AOs6RDNZ8eSNKEHfXHlHCJiLNEEZf11sQnY45hH5lnqlKlcftG
         DzK31oenA0PHRn7NrmdiILbdgJPJcr/Ub41Gb7N374XF6sFtBsUFMCQY3C9DoFKXmIoL
         tEmvSliHo46eGjqAnoFeMlvonatgJBPE8jMZ8=
In-Reply-To: <4AA4FA86.2020601@infoservices.in>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "J. Bakshi" <joydeep@infoservices.in>
Cc: netfilter@vger.kernel.org

2009/9/7 J. Bakshi <joydeep@infoservices.in>:
> Could anyone suggest me how to get time in jiffies ? Tried with "date
> +%s" but it is not the jiffie value. Any clue please ?

You may use the first field in /proc/uptime - that gives you uptime in seconds.

IMHO, the recent module should be used for filtering purpose only not
for managing black lists.
The right way is ipset :)
And it does not require you to recompile your kernel - you may install
it as a module.
And yes, to use it you should recompile iptables if it does not
support it by default.

-- 
Best regards
Anatoly Muliarski
