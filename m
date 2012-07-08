From: Andrew Beverley <andy@andybev.com>
Subject: Re: iptables + local server via udp + conntracking + 2 uplinks =
 wrong source address for replies
Date: Sun, 08 Jul 2012 22:15:40 +0100
Message-ID: <1341782140.2557.10.camel@andylaptop>
References: <4FF05213.3020204@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4FF05213.3020204@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1341782454;
	bh=tsYdAOwAHL+3vPFY/ACV8NfMVB4PT3Y7YVDlSBE0SH0=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Mime-Version:Content-Transfer-Encoding;
	b=l5gUajAH/rnE8vkCHWU8Gm9vjtPDvMy7rhGoCBjXQAM8PisWuwgPDWJwSAhjYJag4
	 FsGfHAQlSZ9CGxrTQIwTUeATNeGaObR/SKLqBq4AtJrOtb53IR6DBn+UllCAUaKruM
	 xSse+s4wKjtMdch6PMVl2nQyRLY7H+YXt303B62M=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ValtsS@gmail.com
Cc: netfilter@vger.kernel.org

On Sun, 2012-07-01 at 16:35 +0300, Valts Silaputnins wrote:
<snip>
> However the source address was still wrong. Ok so I tried to fix that by
> adding SNAT to POSTROUTING chain. Only to realize that for some reason
> those packets don't hit it (checked by -j TRACE...).

What are your rules for this? As long as the packets are actually
hitting that chain then I don't see why they wouldn't be sent to the
SNAT target.

> So I started googling for reasons for this problem, however results seem
> to condradict each other, some say it (well for tcp I suppose) works
> fine, some say SNAT for OUTPUT doesn't work at all.

I don't see why it should be a problem, but you have to use SNAT in the
POSTROUTING chain not OUTPUT. From the man page:

 SNAT   This  target  is only valid in the nat table, in the POSTROUTING
chain.

Andy


