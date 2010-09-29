From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: macipmap (ipset) matching
Date: Wed, 29 Sep 2010 11:01:49 +0100
Message-ID: <4CA30E8D.8000606@googlemail.com>
References: <4CA25F3B.2070801@googlemail.com> <alpine.DEB.2.00.1009290912280.4241@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=T36IsqkRetLOJq+YBFZlpOPMF+NAHoJovAJuwILn7D0=;
        b=ubQ010shaALpl7dHYN3ayDJ/AVKTp9Ot+gOelk5JDbGbXr+unMTUITk4225TNaR6uD
         rCvrS0DvqoglTi0EKQZHUNv/VD8IEnRpW4Faxu/Au6bWnPTAyim8nprR1Eck95xMCSOD
         GCnRv6iv42vzVvfA21xHz0/tt1Aeuz4EDXpKo=
In-Reply-To: <alpine.DEB.2.00.1009290912280.4241@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org


>> I am trying to employ and use this, but am unable to get any match whatsoever.
>> I have registered my own (internal) network and the relevant mac addresses for
>> each interface, but no joy. What could be the problem? Has anybody actually
>> tried this?
>>     
>
> Could you describe exactly what do you try to do?
I am creating a match rule (I am using Shorewall), which matches both IP 
and mac addresses, but this match is never triggered, hence my initial 
query.

> The ipset source tree contains a testsuite with tests against all set 
> types.
>   
Thanks for that - I will look at it and see if I could use it here.

