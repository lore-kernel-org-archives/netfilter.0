From: Christoph Paasch <christoph.paasch@gmail.com>
Subject: Re: Ping in ESTABLISHED
Date: Sun, 7 Dec 2008 11:56:24 +0100
Message-ID: <200812071156.24909.christoph.paasch@gmail.com>
References: <493ac3bf.14098e0a.4085.ffffcfe1@mx.google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:cc:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:message-id;
        bh=PDp7e7KPhxaUy3/e2kaWC69oObQCLtZDllfxOJq7X/Y=;
        b=aVh/U7It2WNeBE/F18HNXTV2mmFHLFtJBjba9t11cQYVA1HTKxGDc8WVbOfKTnXiHE
         /kZeton/0zHwEqD02U9YlY5py1xb1Wu2dslXiui8yF3JRpa6hQ2rWhLzTanPLkWmthbL
         /QTRk8jC5EPzmox8SdJTdIKycZZFfC2DdeC68=
In-Reply-To: <493ac3bf.14098e0a.4085.ffffcfe1@mx.google.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: Gilad Benjamini <gilad.benjamini@gmail.com>

Hi,

does your machine on the eth2 network always waits for the reply of the ping, 
before sending the next one?

After seeing the ECHO-REPLY passing, the connection tracker tries to delete 
the created connection, if all the ECHO-REQUESTS have been answered. As it may 
be possible, that there are several ECHO-REQUESTS passing before the ECHO-
REPLY deletes the connection, netfilter will put the state of the connection as 
ESTABLISHED.  And that's the reason, why you don't have any NEW connections 
anymore. This behaviour may be due to the fact that some ECHO-REPLY's are lost 
on their way, and a new ECHO-REQUEST was send, before the connection timed out 
in the connection tracker.


I hope, I was clear, and that it was correct what I told.

Have a nice day.

Christoph

2008-12-06, "Gilad Benjamini" <gilad.benjamini@gmail.com>:
> I have a situation where a continuous ping, expected to create a new
> connection each time, turns into a single connection in ESTABLISHED state
>
> Here are the details:
> - iptables runs on a bridge
> - The bridge connects eth1 and eth2
> - The iptables rules (minimized for the sake of this post)
>     -A FORWARD -p icmp -m physdev  --physdev-in eth1 --physdev-is-bridged
> -j ACCEPT
>     -A FORWARD -p icmp -m state --state ESTABLISHED -j ACCEPT
>     -A FORWARD -p icmp -m state --state NEW -j ACCEPT
>     -A FORWARD -j ACCEPT
> - A machine located on the eth2 network constantly sends a ping to a
> machine located in eth1 network
> - "iptables -L -v" shows the counters growing on rules #1 and #3. This is
> expected.
> - However, at some point, the counters start increasing on rule #2, and
> stop increasing on rule #3. This can happen after 200 pings, 400, or even
> 3000 in one overnight test.
>
> Any idea what's going on ?
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


--
Christoph Paasch

www.rollerbulls.be
--
