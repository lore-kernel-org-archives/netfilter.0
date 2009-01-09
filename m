From: "Payam Chychi" <pchychi@gmail.com>
Subject: Re: (Ab)using iptables to record byte count per IP?
Date: Fri, 9 Jan 2009 07:23:16 -0800
Message-ID: <f08c15d10901090723h3c3f0edbhbc4dfe674fbd653b@mail.gmail.com>
References: <2d460de70901090327y625afd60g792467e843d3f1d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=Do3vSYM1prPEgDvoeHwoML9v2dch9L9MbneSALytJ2g=;
        b=Hj3YtfzJypEvcv4RicmzsD9owYdax5SBm/KxoY7P0qYyycKPhgVB/FdTI+PwxAIohr
         btFQVGeFUSPtyvybBvPMStauppXfGez0FWqlB8cHFdFOlRzmqUJ3c7gSgep59td1ARxN
         qlfixCGMLQzxskCi4Grso8SGEX5dlcUbUwJBw=
In-Reply-To: <2d460de70901090327y625afd60g792467e843d3f1d@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Richard Hartmann <richih.mailinglist@gmail.com>
Cc: netfilter@vger.kernel.org

Hi,

Thats possible by using the pre-nat table. You will need to place an
accept all rule for each individual /32 ip address that you want to do
accounting for ( I use accept so that I can see all traffic destined
for the ip)

-Payam


On Fri, Jan 9, 2009 at 3:27 AM, Richard Hartmann
<richih.mailinglist@gmail.com> wrote:
> Hi all,
>
> I need to log the traffic each local IP in a NAT'ed network generates
> per day.
>
> Unfortunately, the environment is rather restricted and compiling new
> software is not an option. Thus, I am wondering if I can abuse iptables,
> which is in use anyway, to log for me, as well.
>
> The end result should be a log which contains IP, date and traffic
> generated. I don't really care about the output format as I will perl it
> into the format I need, anyway.
>
>
> Thanks for all input,
> Richard
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>



-- 
Payam Tarverdyan Chychi
Network Security Specialist / Network Engineer
