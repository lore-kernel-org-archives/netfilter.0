From: Jimmy Thrasibule <thrasibule.jimmy@gmail.com>
Subject: Re: SNAT using the same internal address multiple times
Date: Thu, 07 Feb 2013 17:56:16 +0100
Message-ID: <1360256176.2455.15.camel@BEWS005.euractiv.com>
References: <738ED808-0B35-4645-9D73-3CB3B5CBC4D7@alex.org.uk>
	 <1360147947.2455.0.camel@BEWS005.euractiv.com>
	 <F39A895F-6E7F-4B38-BC6E-738ABDB0F321@alex.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-type:x-mailer:mime-version
         :content-transfer-encoding;
        bh=VAVGV/BA97HVcS9d3mfN6jvX0LAU0Y6JWx89mSegZnU=;
        b=ganhTqynxzsUxMrclYPUseqC1KbwJsSqJfoTkReJ2wPMZ8L9DBl0koEodsWKtMLfBy
         T7zneCHOQxBfgTu14NeMplBvjMslD+rXFTW0GlKI8EdXSZ4xIqpBUsaL2sizBfovkyz4
         E7P5aIVCVNJFim3zzSsBIZ5NwZCo3EezAyo5TCznRaAWOQB6V66VcAMzdTLkXBCakYQY
         k6E7CPbdOwmQRgYsuFyyYUy5CQ1aFlAO/F6jA7gSm+77PgkCLcn8q3ngCR/g2IdInxOA
         4H/NHuxAgbHBnEOjLVwkY1eJOY74ihH7Lbj/ZHup3yYpfBNm9Z3KzAz52cjGuITscrxH
         17OQ==
In-Reply-To: <F39A895F-6E7F-4B38-BC6E-738ABDB0F321@alex.org.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alex Bligh <alex@alex.org.uk>
Cc: netfilter@vger.kernel.org

> A typical use case: consider all the downstream interfaces are veth
> interfaces into either a network container (separate namespaces) or
> bridge interfaces into a VM. Let's assume you want to number the
> ethernet interface in the container/VM with the same IP address (*)
> (10.0.1.1/24 in the above example) and the router will act both
> as default route and proxy ARP for things apparently on the same
> subnet. Assume the only requirement is for outbound connectivity
> through eth0.

OK, the problem here is to keep your interface MAC address when sending
a packet. You have the `bonding` driver to group interface but I don't
think it permits such a thing as it is more for load-balancing.

Maybe the team [1] driver can help here as you can script it.

[1] https://fedorahosted.org/libteam/

> There's no reason in theory (I think) why such a NAT should not
> work. Outbound packets get NATted to the IP of eth0 saving
> the inbound interface in the NAT table. Inbound packets are matched
> against the NAT table, have their destination rewritten to the
> original source address, and a routed directly out the interface
> from which the relevant inbound connection came, rather like a
> static interface route.
> 
> My question is does iptables support this?

As long as you give to iptables the interface or the IP address, the NAT
should be OK. Your problem is to group the interfaces and keep the MAC
addresses.

>(*) = why on earth would I want to do this? Suppose you have a huge
>number of VMs which can live migrate between physical machines. Without
>this, IP addressing needs to be globally unique across all VMs
>across all physical machines. This is somewhat tedious.

But in any case, how would you set up your virtual machines as they need
an IP address?


Jimmy


