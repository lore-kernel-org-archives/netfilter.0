From: "Gilad Benjamini" <gilad.benjamini@gmail.com>
Subject: Re: FW: Reject on a Bridge
Date: Thu, 4 Sep 2008 10:00:10 -0700
Message-ID: <d95317090809041000p2324c9bfjb8da6bf2f4bdd626@mail.gmail.com>
References: <002801c90eae$9ae3f9a0$d0abece0$@com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=9B/Sj5y5wCWb8YqRH0xKAACrsn14VvIkWr47b+mwlP8=;
        b=HF/P0ivxrw0M+u/55NSTlxlzrQIuUmDZ0kamGDDBXTCzrlYs5v2iiFGBwJkSBoeDyb
         4Z5Ew9gG4r0X9cNSuCmhqGjF1nHhDwYHnJArzm6HQX9xfC55A6FDDAR4Nmjt5i2VieNh
         VIqssvEY/8K/vLuUtm3pcYmwCz7AJjZUms/68=
In-Reply-To: <002801c90eae$9ae3f9a0$d0abece0$@com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

>  On 09/03/08 17:41, Gilad Benjamini wrote:
>  > I am using iptables to run a firewall on a bridge. The bridge
>  > consists of eth1 and eth2. Neither interface, nor the bridge itself,
>  > have an IP address. eth0, which is not on the bridge, does have an IP
>  > address.
>  >
>  > Trying to use the REJECT target with --tcp-reset doesn't work. If I
>  > understand the code correctly, the route for the RST packet is
>  > determined through ip_route_me_harder in the send_reset function,
>  > implying in my case that the RST packet will leave through eth0,
>  > which is not the desired behavior. Theoretically, eth0 might be even
>  > physically disconnected from the bridged network.
>  >
>  > Am I missing something, or is this a real problem ?
>
>  I'm not sure where the rejection is going to come from.  At least as I
>  understand it the rejection comes from a system (with an IP) in the path
>  that is refusing to pass the packet.  Thus I don't see how the bridge
>  can reject the packet because there is no source IP to send the
>  rejection from.  Can you add an IP to the bridge interface that is with
>  in the subnet that is being bridged through it so that there is a source
>  IP for the rejection?
>
>
>
>  Grant. . . .

The way I see it, a firewall is allowed to "pretend" to be the end
point, without revealing itself as a separate entity. Network devices
do this in different scenarios; e.g. NAT, proxy-ARP, DHCP-relay.
In this case, the "pretending" part would be to send a RST packet with
reverse addresses. Actually, this is exactly what the send_reset
function does, including IP addresses, but excluding MAC addresses,
which are determined elsewhere (routing code ?)
