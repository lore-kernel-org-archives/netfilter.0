From: Jarek Poplawski <jarkao2@gmail.com>
Subject: Re: problem with IPoA (CLIP),  NAT, and VLANS
Date: Tue, 17 Feb 2009 12:20:52 +0000
Message-ID: <20090217122052.GB6130@ff.dom.local>
References: <20090216232016.GA4803@ami.dom.local> <499AA433.8070308@hiramoto.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:cc:subject
         :message-id:references:mime-version:content-type:content-disposition
         :in-reply-to:user-agent;
        bh=AV2R057UN4F7ptjtPXNtiZvdAJ6erYyoVNNip8cAOsI=;
        b=rexbEUnkqhEvAAOM3xfKl1aZ3lnwfA+fK0D3iXd9AqlD7KBz3TPsxyzbL7bgC4Rkc7
         aA0lRzfRW2jRLp0EgFo5ODzo2piV4fA0HFUbg8hgn5wgfXERqZ8r5m10ooo1aZIBKl76
         pwff/PtL9tLZVt92kg161sEvpAlE+LwD+19g0=
Content-Disposition: inline
In-Reply-To: <499AA433.8070308@hiramoto.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Karl Hiramoto <karl@hiramoto.org>
Cc: netdev@vger.kernel.org, netfilter@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, Feb 17, 2009 at 12:49:07PM +0100, Karl Hiramoto wrote:
...
> A side note:  so far the original patch i sent works in all cases i have
> tested, but fails with tcpdump.   I suspect its because the skb gets cloned.

If there is something readable from this tcpdump, it should be helpful
to see a packet for working and non-working case during such ping
(with -nXX option).

Jarek P.
