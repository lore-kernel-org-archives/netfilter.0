From: Jarek Poplawski <jarkao2@gmail.com>
Subject: Re: problem with IPoA (CLIP),  NAT, and VLANS
Date: Thu, 19 Feb 2009 07:30:55 +0000
Message-ID: <20090219073055.GA4564@ff.dom.local>
References: <20090218210507.GA2698@ami.dom.local>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:cc:subject
         :message-id:mime-version:content-type:content-disposition
         :in-reply-to:user-agent;
        bh=OBRt8Pg14gf9pZJxUGpGhX/xkNdwQVFIuj++9v8HtVE=;
        b=sngPa7uXr7XyQhTUprPfKs/uRcIgXYUBbxPeqJSMtATYeT+QVspg27B2t7HgrAH/N/
         riZ3y4t0i7ZvzYSgIH4BbD3m9+zo+J3t5UoMu1Wt0qownD++xzSasLDk5TBuayXZ/UHK
         rk44bPXnY6VzUtI1/fv4RdSd7DV9lIH6eRuIg=
Content-Disposition: inline
In-Reply-To: <20090218210507.GA2698@ami.dom.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Karl Hiramoto <karl@hiramoto.org>
Cc: netdev@vger.kernel.org, netfilter@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On 18-02-2009 22:05, Jarek Poplawski wrote:
...
> depending on your config or even size of packets. So I guess, knowing
> this all, you should better try to hack this driver more yet.

...And the first step could be trying skb_copy() in the driver's
->hard_start_xmit() callback (of course, if you prefer data safety
over perfomance).

Jarek P.
