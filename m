From: Christoph Paasch <christoph.paasch@gmail.com>
Subject: Re: INVALID state
Date: Fri, 14 Nov 2008 00:01:30 +0100
Message-ID: <200811140001.31179.christoph.paasch@gmail.com>
References: <491c6f1c.27b38c0a.7748.ffffe1d6@mx.google.com> <200811132331.08821.christoph.paasch@gmail.com> <491cab7d.27b38c0a.772a.42ee@mx.google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:cc:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:message-id;
        bh=WtLhfutfAHVUkzZ1M7IIF1OJ+pXjNKBG4PnVbx8H2Ug=;
        b=JrNiZ1qVKaiYiGC26UwH+3S8oNo49PknANQrjq6Lbrd8bSBF1zuw3B+gNXYk9hrsOo
         I3HImCWAj7nxdnV0sJSm1fCIyvna1UEuKxXMWIjZEvS/KIANQeDVqJ4kFDlUEU5XZSSZ
         A5vuNAiNIzxSvFWOkKxgQWe9yqZf1P9WxcEMc=
In-Reply-To: <491cab7d.27b38c0a.772a.42ee@mx.google.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Gilad Benjamini <gilad.benjamini@gmail.com>
Cc: netfilter@vger.kernel.org

On Thu November 13 2008, Gilad Benjamini wrote:
> Back to my original question then: what is the rule of thumb ?
> In other words, for a non-programmer reading proper documentation, how
> would the documentation describe INVALID ?

In the "Packet Filtering HOWTO" of netfilter.org, they say:

A packet which could not be identified for some reason: this includes running 
out of memoory and ICMP errors which don't correspond to any known connection.

By looking to the code, I would say, that a packet is invalid, if the 
connection tracker doesn't manages to create a proper connection-state for 
that packet (memory-errors while treating the packet, ...), or the tests 
defined by the specific protocol-handlers fail.

But I'm also asking me this question, because I have to implement shim6-
support in netfilter in the case of my Master Thesis. So does somebody can give 
me a reference which will explain me, what a firewall should check, and what 
not...? Should it check, if the packet respects the whole protocol (in case of 
shim6: nonces, cga/hba, ...)?

Thanks for your help, and sorry, if i'm running out of the topic of that 
thread.

--
Christoph Paasch

www.rollerbulls.be
--
