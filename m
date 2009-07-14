From: Simion Onea <simionea@gmail.com>
Subject: Re: Forwarding packets over the same LAN
Date: Tue, 14 Jul 2009 21:50:49 +0300
Message-ID: <e1ba8dde0907141150y62e4e112t4bef1ae15c48711a@mail.gmail.com>
References: <1247493655.2316.104.camel@TestField.intranet.bem.md>
	 <1247494451.25529.52.camel@enterprise.ims-firmen.de>
	 <1247558286.7214.16.camel@TestField.intranet.bem.md>
	 <4A5CA53A.40703@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=lsNi4btx+p4BcOh4ewcnOzolJNArsNs7Exwl8vM4m+Q=;
        b=UdfCweflaHZKm+hrjid7Zdn3EwQtGF0mnMDV+m50u2B3SOttwjnWkYUx4QeebYjrpi
         fiPCocz1n3XwwrH1JTleHVgCx8+BkBvHitVGpllloTWcxY+lwnvdxENp57BKgdddGT0w
         vV0X2n0ay3/h61lxIJ9kdMobUBbVuRV8sZUM0=
In-Reply-To: <4A5CA53A.40703@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

2009/7/14 Pascal Hambourg <pascal.mail@plouf.fr.eu.org>:
> man iptables
> DNAT is a terminal target, so after a match the next rules in the chain are
> not examined.

Thanks for pointing that out. I didn't know about this.
