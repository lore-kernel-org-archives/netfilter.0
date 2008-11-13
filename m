From: Christoph Paasch <christoph.paasch@gmail.com>
Subject: Re: INVALID state
Date: Thu, 13 Nov 2008 13:16:56 +0100
Message-ID: <200811131316.57097.christoph.paasch@gmail.com>
References: <491b53e3.2a528c0a.1c10.385b@mx.google.com> <1226574837.19007.19.camel@enterprise.ims-firmen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:cc:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:message-id;
        bh=ZofCZ13Y/uhQo2cqI1o2CabksP7fcCLayuKQdn7z1lU=;
        b=KOEjraJjULTq39/OG3YtHmRNsfsxNDLq+X9iSpUV7vH95689UFjPnkOppCndPWDfzu
         JaYesPjhGeg1wYVy2UDycyB1N3vGg8EWZeaSajepjIxmEwoySFXlbTQf6wyDy5goMPM7
         c++eoJRSfnhbSN+oI+qim3T5KVER4CmWrHVB0=
In-Reply-To: <1226574837.19007.19.camel@enterprise.ims-firmen.de>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Jacob <jacob@internet24.de>
Cc: Gilad Benjamini <gilad.benjamini@gmail.com>, netfilter@vger.kernel.org

Hi,

On Thu November 13 2008, Thomas Jacob wrote:
> For instance, if your ICMP echo request doesn't go through your
> firewall, how can the stateful inspection know
> about the echo reply to be expected? Also, if the firewall
> doesn't see the initial TCP SYN packet, but the SYN-ACK goes
> through the firewall, it clearly shouldn't allow that through.

as I'm currently trying to understand the netfilter implementation, I tried to 
find the point, where the ICMP-Echo-Reply gets filtered.

In xt_state.c->match(...) I saw, that it detects the state XT_STATE_INVALID if 
there is no connection associated to the packet (skb->nfct). But in the ICMP 
connection tracker I don't find the point, that it doesn't tracks the echo-
reply packets if no echo-request packet passed. I have the impression, that it 
will track the echo-reply as a NEW connection.

Could someone please point me to the code?

Thanks in advance,

--
Christoph Paasch

www.rollerbulls.be
--
