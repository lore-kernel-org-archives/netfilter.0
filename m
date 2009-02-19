From: "Gilad Benjamini" <gilad.benjamini@gmail.com>
Subject: RE: iptables - how to create a rule that expires automatically
Date: Thu, 19 Feb 2009 09:48:48 -0800
Message-ID: <499d9b99.20018e0a.361e.4b2b@mx.google.com>
References: <499D9292.902@colsmemory.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:references
         :in-reply-to:subject:date:message-id:mime-version:content-type
         :content-transfer-encoding:x-mailer:thread-index:content-language;
        bh=ucQAtZxMXXtiDZQTGWN79It/rtdMdWhi2SuFw5ViMnE=;
        b=ACEkKxD63ZWSZhR6vSRFiE/AnvEcAJF+x7IapzENoC3hvkPVIw7KutaTsCpgPqo/jC
         +hA+G5/G9rZg9GSzPHf3L8p+iVsGxC4bsg8DnZJIozwsQG5m+Y4gtizSldgzXwq86xZI
         cks/XXCT046W9EvdEoRgaAV1Om/dClpdKiw8Y=
In-Reply-To: <499D9292.902@colsmemory.co.uk>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Colin Davis' <col@colsmemory.co.uk>, netfilter@vger.kernel.org

A script, possibly with crontab or at, is your best bet.
For some scenarios it might be easier to use the "condition" match, and have
your script change the proc value rather than the actual chain.


> -----Original Message-----
> From: netfilter-owner@vger.kernel.org [mailto:netfilter-
> owner@vger.kernel.org] On Behalf Of Colin Davis
> Sent: Thursday, February 19, 2009 9:11 AM
> To: netfilter@vger.kernel.org
> Subject: iptables - how to create a rule that expires automatically
> 
> 
> Hi,
> 
> Not sure if this is possible. I wish to create a rule that once created
> will
> automatically expire (and be removed) after say 10 minutes.
> 
> Please
> 
> Many thanks,
> Colin.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

