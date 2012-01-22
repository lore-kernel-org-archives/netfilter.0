From: =?ISO-8859-2?Q?Marcin_Miros=B3aw?= <marcin@mejor.pl>
Subject: Re: [xtables-addons] memory usage in module geoip (probably)
Date: Sun, 22 Jan 2012 21:38:51 +0100
Message-ID: <4F1C73DB.5060503@mejor.pl>
References: <4F19928A.7050005@mejor.pl> <alpine.LNX.2.01.1201201800150.29700@frira.zrqbmnf.qr> <8b53c851c9391f9bc9ce3427acdbab4c@mejor.pl> <alpine.LNX.2.01.1201202156410.13241@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mejor.pl; s=cokolwiek;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Subject:CC:To:MIME-Version:From:Date:Message-ID; bh=PzL+mnK4jObrXYQFOXPQHpILQzvPc5LPur6eXidMyzc=;
	b=tLW9RRK/KcVYXAO3b8Q4KcGcZwd1Fhw6+UX3uXB0ZhU7MCIXmLWGoLmVHxw0gDTq2DMljxhtqFDnHwqwa10MtRfa0OFQLkXNPPm8Rqwe6UVdrnfk1gpn/VKF5NSakIq+;
In-Reply-To: <alpine.LNX.2.01.1201202156410.13241@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

W dniu 2012-01-20 22:00, Jan Engelhardt pisze:
> TARPIT does not have much of a use for random ports without any services
> because it is specific to clients sending data. You should use DELUDE at
> the end of the chain, also because it does not keep any connections
> around like tarpit.

Hello Jan.
Meseems TARPIT is what i need, i'd like to slow down (a little) bots 
looking for mssql and other MS specific soft.
I've made quick test, it looks when TARPIT is in chain then size of all 
three slabs (kmalloc-512/2048, skbuff_head_cache) slowly grow up. 
Without TARPIT its size is almost constant.
It appears on host:
domU, FV, 3.1.8-hardened (i have such situation since some time, with 
older kernels too) , x86_64, xtables-addons-1.37 and 1.39.
Other host doesn't suffer such problem:
bare metal, 3.1.5-hardened, i686, xtables-addons-1.37

How can i track down what is the reason of such situation?
Thank you.
