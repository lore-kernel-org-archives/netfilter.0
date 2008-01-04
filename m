From: Ben Lentz <BLentz@channing-bete.com>
Subject: Re: conntrack accounting
Date: Thu, 03 Jan 2008 22:25:02 -0500
Message-ID: <477DA70E.5080301@channing-bete.com>
References: <477704CB.8030809@channing-bete.com> <477D0553.4010906@netfilter.org> <477D257B.4060901@channing-bete.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=channing-bete.com;
	s=smtp; t=1199417100; bh=RY97I/E48+x+mDtgitQ6xkvzzyf8KKsI3UZoT/BbPt
	c=; h=DomainKey-Signature:Message-ID:Date:From:User-Agent:
	 MIME-Version:To:CC:Subject:References:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-OriginalArrivalTime:X-Antivirus; b=bsS
	oDurWPoAjy+VcO38AayjyOMW2u/hIn/aonBNM6Ewy+oPRv9O7HRqjxN1HhsBqsR32gc
	Er/Sdz3BoEhMFOpg==
In-Reply-To: <477D257B.4060901@channing-bete.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org


> This sounds great! However, I appear to be having some trouble. I 
> checked out, built, and installed conntrack-tools 0.9.6 7164 and 
> libnetfilter_conntrack-0.0.87 7164 and am running conntrackd -S. I 
> still have libnfnetlink-0.0.30. I don't seem to be getting any 
> statistics logging either in Syslog mode or LogFile mode.
I've made some progress... it turns out that the statistics logging via 
LogFile mode works only if I start conntrackd with -C 
/etc/conntrackd/conntrackd.conf... for some reason, leaving the -C 
option off and defaulting to this configuration file doesn't work, even 
though a strace shows a successful open to the file upon initialization.

Syslog statistics mode still crashes... but only if I *disable* LogFile, 
too.

This works perfectly:
Stats {
        LogFile on
        Syslog on
}
This crashes:
Stats {
        LogFile off
        Syslog on
}

CentOS 5.0, kernel 2.6.18, no SELinux, liberal iptables configuration, 
sysklogd 1.4.1

Is there a more appropriate place to report this information?

Thanks for your work on this thus far, this looks like a great addition 
to conntrack-tools!
