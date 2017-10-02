From: Will Sewell <me@willsewell.com>
Subject: Re: Why are two hash tuples stored for each connection in the
 connection tracking system?
Date: Mon, 2 Oct 2017 13:07:32 +0100
Message-ID: <CAKMCqEJyaqmH5rnQGcmVYwxw=JxZYJd8gOHq-Wwuc375K+BuPw@mail.gmail.com>
References: <CAKMCqEL=UCUUn2=Ke7-4uJo-fij80k7u13zEOsHNh_AP_p2EKQ@mail.gmail.com>
 <0cc1bff1-b709-06ff-1dfa-5d4214397277@plouf.fr.eu.org> <6f1b85b3-4982-d14c-a7d0-9abca40489aa@plouf.fr.eu.org>
 <CAKMCqELnZLifhdEmbYEnPOX7SWAS4Y1L5KGBJ4YS_qT3QwkK=A@mail.gmail.com> <abe1f557-b3f7-1c41-ed15-5db7c7f5b1d0@plouf.fr.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=willsewell-name.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=LPNjNVBrMbIrkotCN0lbYVOZtx9oYFDEi/3Kxr9xWa0=;
        b=Nf9GYCYb4lS68IHj4SWNTFQ2tuBrKPx4nvp+631i3JJ+/5liy/4poBS+9b1ofs+bT+
         4/5jPQ0DRe3HjzXoOwa8uOQpHvMRDcEaRV92bZiFNoA2p8iBRH4CbF049Xnqe+O24Vcx
         G98i59r9uwWVJf+2bYw4wv8GDRV8zbnd/rN9v113nNKJst/iCAX0z79BXUt67GjNGBj5
         sfdOsDRVjNsxFIl+EKqffgA1K5F9KhIX0hWU6bPnU3uVyv1mfT1ohXCb/tspxFXrPY0G
         Y/0atgf7kHZ2CJcH5tXH8MQTZxJqoFcak71FOTt1qjkRCYHcvlt2MOlZFbCVZ98IZiko
         K4IA==
In-Reply-To: <abe1f557-b3f7-1c41-ed15-5db7c7f5b1d0@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

> I don't know the detail of conntrack data structures, but conntrack watches
> packets in two places :
> - when the packet enters netfilter (PREROUTING or OUTPUT)
> - when the packet leaves netfilter (POSTROUTING or INPUT)

Ah, I think my confusion came from the meaning of the "original" and
"reply" directions. I had assumed original packets were those packets
entering Netfilter from the outside network, and reply packets
entering Netfilter from the local machine and which are sent
externally. It sounds like you're saying original packets are what
what enters Netfiler, and reply packets are those which leave
Netfilter (after potentially being transformed) and are propagated up
the networking stack. In which case my previous goes away because
conntrack can hold a reference to the connection to the conntrack
struct while the packet is passing through Netfilter.

Thank you,
Will
