From: "Gergely Buday" <gbuday@gmail.com>
Subject: Re: VPN client from behind a firewall
Date: Tue, 24 Jun 2008 12:14:22 +0200
Message-ID: <90d975d30806240314q5e9f6c7cgd120a659fc044a3@mail.gmail.com>
References: <90d975d30806160444t7c9bbf21if9b0062e2e72ac56@mail.gmail.com>
	 <48565817.2040600@infolibre.net>
	 <alpine.LNX.1.10.0806161720190.6620@fbirervta.pbzchgretzou.qr>
	 <90d975d30806240136j5c54032awf4de9aa04598257d@mail.gmail.com>
	 <alpine.LNX.1.10.0806241057550.16957@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=fPzFqO0ZkuksAZaIZoyJOONu3/FC6OpWmGxUft/ylUg=;
        b=qtpWqeKvuN1jrTQOvwnZIvVi6wx3wbUDx/Cvptj+mwwFDiyNrT2Bm+B/iHfGfluCyf
         JOSqysoDqJg3R1Map77i4Yy68NgY9wzZpBBgfykourx6frE6uwFebk67H7IvQPbEHF+q
         KbrPxqqH0p0LnGLMPziNAoBRBG8szmwMjLKMM=
In-Reply-To: <alpine.LNX.1.10.0806241057550.16957@fbirervta.pbzchgretzou.qr>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: mathieu <mathieu@infolibre.net>, netfilter@vger.kernel.org

2008/6/24 Jan Engelhardt <jengelh@medozas.de>:
>
> On Tuesday 2008-06-24 10:36, Gergely Buday wrote:
>>> As such -p udp 500 and -p esp will be needed for a firewall;
>>> and only -p udp 4500 for a NAT.
>>
>>Thanks for your help. I made it work by adding "500" after -p udp in
>>the first command. Does this make a security risk?
>
> Rent a security guy who will talk you into it being either
> "yeah that's secure" or "well but that opens holes"? :-)

Oh, thanks. I thought that it was just me who did not understand security :-)

- Gergely
