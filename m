From: Oskar Berggren <oskar.berggren@gmail.com>
Subject: Re: fwmark & iptables
Date: Thu, 28 Jan 2010 12:37:09 +0100
Message-ID: <33be4bb31001280337p1b863e12va27c12780e4198cd@mail.gmail.com>
References: <fcfe0b071001280237w56be822fo5fb896071faacc3b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=83Ftk6zgJQSQ2oJD3qr/JUsaOp5GaFK6TtrgfbUSkrk=;
        b=ILrPXN4Sqoc1cQxNEftMWED9PWEOgX2Ic8XmzBIaOO+CtLz9wd3C79qNy/VIDIF95u
         UCjZ9yGxU2VQxHxQoGR/WuRsLcz/pXoprFNPQSzqW0LQHrV0NXQ6885f7vBufcXR2+Bk
         YijFCqCYARFUln9f2h5eIi6D5xtlqYdgX9qe0=
In-Reply-To: <fcfe0b071001280237w56be822fo5fb896071faacc3b@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Matt Hakim <thepigs@gmail.com>
Cc: netfilter@vger.kernel.org

Since this is output (not forward) the first routing of the packet
takes place before iptables have had a change to mark it. After the
mark it is rerouted, but the source ip-address is taken from the
output interface that comes from the first routing. At least, this is
my understanding of it.

/Oskar


2010/1/28 Matt Hakim <thepigs@gmail.com>:
> Hi,
> I want to mark packets for a particular user (iptables -t mangle -A
> OUTPUT -mowner --uid-owner rtorrent -j MARK --set-mark 1), and then
> route these packets to a VPN (ip rule add fwmark 1 lookup 200; ip
> route add default dev ppp0 table 200). Unfortunately, after I do this
> tcpdump shows that the default interfaces source address is being put
> out on the ppp0 link which I don't understand, as I would have
> expected the ppp0 interface address to be the source address. Anyway
> it fails.
> Without using MARK and ip routing based on destination works OK thoug=
h
> (from all to 66.102.11.104 lookup 200; ip route add default dev ppp0
> table 200).
> Any tips? I'll hack around in the source now see what i can find.
> Thanks,
> Matt
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
