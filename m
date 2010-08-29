From: Tomasz Chmielewski <mangoo@wpkg.org>
Subject: Re: using iptables with tun/tap interfaces? no rule sees tun/tap
 interface traffic
Date: Sun, 29 Aug 2010 14:38:02 +0200
Message-ID: <4C7A54AA.5090909@wpkg.org>
References: <4C7A3E75.5020202@wpkg.org>	<20100829131559.23abd652@catus>	<4C7A4972.4020304@wpkg.org> <20100829142146.5c8119ed@catus>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=wpkg.org; h=message-id
	:date:from:mime-version:to:cc:subject:references:in-reply-to
	:content-type:content-transfer-encoding; s=default; bh=8iXxHT8o3
	uPW/I3SPzIV4+lsITg=; b=4ZcMLe6nCH8KfRvnVqp8UEwQRNBrDU2tzzWYfU6kj
	Zv+mhHWIA5S6LNjrsw0IZvHubHcVIBSyjwLNeOmSPoNZ6W4jLZPxM2sMp4Eu84EF
	zhPW8bwLQxsnKfaqtigDCOJgy440Ono2OgJ+wF89HOOqN5JHBIblX9zSPxTiieKh
	6c=
In-Reply-To: <20100829142146.5c8119ed@catus>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Marek Kierdelewicz <marek@piasta.pl>
Cc: netfilter@vger.kernel.org

On 29.08.2010 14:21, Marek Kierdelewicz wrote:
> Hi,
>
>> Using 2.6.35 kernel.
>> Should I use ebtables for this? iptables seem more flexible here.
>
> Iptables should work great. Try matching interface with
> physdev-in/physdev-out instead of -i/-o as described here:
> http://bwachter.lart.info/linux/bridges.html

It did the trick, thanks!


-- 
Tomasz Chmielewski
http://wpkg.org
