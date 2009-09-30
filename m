From: Richard Horton <arimus.uk@googlemail.com>
Subject: Re: Using iptables to anonymize incoming IP addresses
Date: Wed, 30 Sep 2009 15:45:03 +0100
Message-ID: <56378e320909300745w5f5e5bfew722210f149e8b470@mail.gmail.com>
References: <Pine.LNX.4.58.0909301456490.29957@virt1.netstat-a.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type;
        bh=CrRtv93sa5MsJONxSCzOD6oSRkulEVIi/q0ZysFZlkQ=;
        b=GDtoHRX5heE6SxDLV2/5rzkHulTMEKos9VEnUu8syO5cH8UYhskYReWcyw2CXCmttQ
         Q0THdEbz06BKgPyPIlT4qDUjM2vOtN9sAceVBwfNuvhCpf707QacF0+eYVUEvEyY3GzE
         PNzS+7JQ9MAZ/AjvTIhMpTlF2bDCCV3GTEckc=
In-Reply-To: <Pine.LNX.4.58.0909301456490.29957@virt1.netstat-a.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: andy@time-domain.co.uk
Cc: netfilter@vger.kernel.org

2009/9/30 andy thomas <tds@virt1.netstat-a.net>
[snip]
>
> But, I want all the packets received by the webserver to appear to be
> coming from the address 192.168.1.1, not the external public IP address
> they really came from, eg the apache logs will show all page requests as
> coming from 192.168.1.1. Can this be done with iptables?

Look at the SNAT target...


--
Richard Horton
Users are like a virus: Each causing a thousand tiny crises until the
host finally dies.
http://www.solstans.co.uk - Solstans Japanese Bobtails and Norwegian Forest Cats
http://www.pbase.com/arimus - My online photogallery
