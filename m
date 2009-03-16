From: Andrew Beverley <andy@andybev.com>
Subject: Re: Creating an equivalent to ESFQ using flow classifier
Date: Mon, 16 Mar 2009 23:35:38 +0000
Message-ID: <8e76d4ceb304242debfb0a0c500976e3@localhost>
References: <328bad7c0259fd816ae31c8405313e1e@localhost> <1237140472.28333.10.camel@hakkenden>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=andybev.com; h=
	mime-version:date:from:to:cc:subject:in-reply-to:references:
	message-id:content-type:content-transfer-encoding; q=dns/txt; s=
	selector1; bh=EVPKlJhl1iIrXRqMQqLg7BNt/AA=; b=dCReJBHUgEuONE2pja
	BNBoHA8HDHAHrv2ShR0BLS08nj4xs/hqr8GimFMCB3Zl17IlaswWvszaVcc8XCYN
	9MmkFpB0y5FaKDT482oHoNqKB61GJI6nAxjd0AzumaIAzoNnkfewIVp1Hv9Eb0XD
	P9P2nssstjEPWgO5BgQQrnXNo=
In-Reply-To: <1237140472.28333.10.camel@hakkenden>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Nikolay S. Rybaloff" <nowhere@hakkenden.ath.cx>
Cc: netfilter@vger.kernel.org

> That's right, you have configured hashing based on src/dst address +
> src/dst port + protocol, which is almost classical SFQ hash. In your
> case you should try only nfct-src, which will create queues per source
> IP and service these queues fairly within htb class.

Thanks, that makes perfect sense now. I have to admit I didn't really
understand the rules I was writing!

I have tried it with just nfct-src for the ppp0 device going from the
server to the internet, and nfct-dst for the eth0 device going to the
individual machines. This seems to work a lot more as I would expect.

Thanks,

Andy Beverley

