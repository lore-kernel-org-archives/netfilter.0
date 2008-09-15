From: "Gilad Benjamini" <gilad.benjamini@gmail.com>
Subject: RE: Reject on a Bridge
Date: Mon, 15 Sep 2008 01:03:16 -0700
Message-ID: <48ce16ce.1c078e0a.726c.ffff8ef9@mx.google.com>
References: <d95317090809031541n396f4ddao29dbbfa196801f64@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:references
         :in-reply-to:subject:date:mime-version:content-type
         :content-transfer-encoding:x-mailer:thread-index:content-language
         :message-id;
        bh=sDy98Ezv4r1Zo5twLSPebmQkAorsB6KXqwZL2BrsrUQ=;
        b=IQtrYS3zLRFD8DGQhBVbnD/r+1+9XV4HO9Lx37NaOzJCmkIg+HuXfQBuDvTirsxsH8
         StlerpNUc2UiNKgORrXoUMNN7aPgv7fscLrMONX2wAe2qMBZ4kZACd9N2B/iHtptOJ3m
         CMUox6T5JpeBsXe1uu4z1LQgF3IhMhNDUZQS4=
In-Reply-To: <d95317090809031541n396f4ddao29dbbfa196801f64@mail.gmail.com>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Following the replies I got I understand this is not supported by the code.
I played around with the code and was able to make this work in some
scenarios but not in others.
If I understand correctly, my main obstacle is the call to
ip_route_me_harder, which is completely wrong for my case, as no routing is
involved.
Anyone has an idea for a simple patch that might solve this ?

In case I wasn't clear, the idea is simple; on the bridge, fake a RST packet
as if it came from the destination of the original packet.

Thanks for any help 

-----Original Message-----
From: netfilter-owner@vger.kernel.org
[mailto:netfilter-owner@vger.kernel.org] On Behalf Of Gilad Benjamini
Sent: Wednesday, September 03, 2008 3:41 PM
To: netfilter@vger.kernel.org
Subject: Reject on a Bridge

I am using iptables to run a firewall on a bridge.
The bridge consists of eth1 and eth2. Neither interface, nor the
bridge itself, have an IP address.
eth0, which is not on the bridge, does have an IP address.

Trying to use the REJECT target with --tcp-reset doesn't work.
If I understand the code correctly, the route for the RST packet is
determined through ip_route_me_harder in the send_reset function,
implying in my case that the RST packet will leave through eth0, which
is not the desired behavior. Theoretically, eth0 might be even
physically disconnected from the bridged network.

Am I missing something, or is this a real problem ?
--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

