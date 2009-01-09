From: "Richard Hartmann" <richih.mailinglist@gmail.com>
Subject: Re: (Ab)using iptables to record byte count per IP?
Date: Fri, 9 Jan 2009 13:47:07 +0100
Message-ID: <2d460de70901090447n21e725f5qe24752991edbd01e@mail.gmail.com>
References: <2d460de70901090327y625afd60g792467e843d3f1d@mail.gmail.com>
	 <49674499.30705@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=OxMKUPH5FsDKzZeXm9bhTHRmooRXwG2yDNJ89H7NPd0=;
        b=FlCCcLlCxY4lflF3elyKo6DBc09rG5SSib+FHPUwRdIDOntWKjK2FPAm5JmmGKo+sC
         hp2xsghnLpAhT0ufB6v8PYXxK47Y8aM92mBTod+uM3syN0fPH/IuqNaCrjf31ZbxyGOA
         r6tFk7PUFO3aJBwvAxy0oay0JMw9uRjc6P0FM=
In-Reply-To: <49674499.30705@netfilter.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

On Fri, Jan 9, 2009 at 13:35, Pablo Neira Ayuso <pablo@netfilter.org> wrote:

> Polling iptables does not look to me a good option. The way to go should be
> ulogd2 or or the conntrackd in its simple statistics mode.

Normally yes. But in this case, I need to use what's there and I know that
iptables is there :)


Richard
