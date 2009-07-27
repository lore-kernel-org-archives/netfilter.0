From: Michael Mefford <meffordm@gmail.com>
Subject: Re: netfilter + perl payload mangling in userspace
Date: Mon, 27 Jul 2009 09:44:39 -0600
Message-ID: <4A6DCB67.7080004@gmail.com>
References: <1248667055.5801.355.camel@trixeee>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=VNF+/bWfP8InuO4eowTMymnCMesMXxdZKv+IwJPQKKA=;
        b=PHYze/rnnsrD/ZfMCki659hkITtZ6J6Xwr2Tl4V53GHJSBrG4HAlg2v/qWo1jQ/y6M
         d82ENVUSb6qcKordO7UnexzXvTmj7SlAfQJ8qHk8Q8OiEcOhPHf+S1rMeG+Dx/oi2X2A
         OxIacsBqZoSvt88LvWSyXDwRyYyzNvzMbwY2Y=
In-Reply-To: <1248667055.5801.355.camel@trixeee>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: trixter@0xdecafbad.com
Cc: netfilter@vger.kernel.org

Trixter aka Bret McDanel wrote:
> I wanted to modify the payload of packets in userspace, preferably with
> perl.  I have tried to google to find something, encountered some dead
> links.  I have not be able to get the example Net::Divert to work,
> however it appears that I am not able to divert properly.  I cant find
> any working examples of how to do the iptables command to divert.  
>
> Is there any other way to modify the payload of a packet from userspace,
> preferably with perl?
>
> can someone provide me with a working example of how to do iptables to
> divert?
>
>
> I have iptables 1.4.1.1 on eeebuntu (ubuntu base) and a kernel of 2.6.27
>
> Thank you
>   

Have you tried using NFQUEUE?  The queue is provided to 'queue' packets 
for userspace processing.  To use the queue, you'll need the 
libnetfilter_queue API.  Start here:

http://www.netfilter.org/projects/libnetfilter_queue/index.html

If you need more help, let me know.


Michael.

