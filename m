From: Matt <mattmoran76@gmail.com>
Subject: ebtables on x86_64
Date: Sun, 26 Oct 2008 17:37:27 +0000
Message-ID: <68fea9390810261037le3a9453q9f1e256503265c94@mail.gmail.com>
References: <68fea9390810261036h41dd81cex8f47960c573a009a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=iPNPPxu3N95/Kb+zG248MV43exhhXqSC103Lskqrq6g=;
        b=QH/oEMh8OndsXnaHhkIER9aU6RIOne0PZUa1raEhCasFnNT+YVrvcMxSG2m31/+rhy
         ZisipO4M5zEmL7IjvxXXrchQRrxtIgdVLJrMfPmRjxohHGlOVvCUVhyoCqSkhS8MBKKN
         pT7N3BQC02pc6BD1O6Rau9K6Nso7QmaFWMqGc=
In-Reply-To: <68fea9390810261036h41dd81cex8f47960c573a009a@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

Installed - ebtables-2.0.8.2-1.el5.rf.x86_64.rpm on CentOS 5.2

I'm having trouble with ebtables - I get the following when calling
certain ebtables commands such as ebtables -X

"The kernel doesn't support a certain ebtables extension, consider
recompiling your kernel or insmod the extension."

Found little apart from that 2.0.6 is supposed to work, however i'm
having trouble compiling that for CentOS-5, anyone had similar issues?

Thanks,

Matt
