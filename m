From: Alessandro Vesely <vesely@tana.it>
Subject: Re: libnetfilter_queue quick question
Date: Wed, 14 Jul 2010 11:27:25 +0200
Message-ID: <4C3D82FD.3030202@tana.it>
References: <AANLkTinrAZdXVZhULjFkkDnEyiwo--NpwYWWc5eNLGfB@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tana.it; s=test;
	t=1279099646; bh=TPlx1wighFTsH14/j++F/inV0Q1hO3UNtPTM3FvkFxg=;
	l=492;
	h=Message-ID:Date:From:MIME-Version:To:References:In-Reply-To:
	 Content-Transfer-Encoding;
	b=aEcczyJp2lmYmYgcUH/sX+y8P1uLtcZCa0avFsP7DZevsB25jyKm3jU/iJc6NXhkC
	 oEeHnGWqjVDUIsaUTJJy6pW1xqtXeqL68lS0951SRwqU2K/tZyhRoAlvt7u8HHweol
	 u2S3xGQxSeBwNSefNwKyZv8zP3On/BnsDNEgh0LE=
In-Reply-To: <AANLkTinrAZdXVZhULjFkkDnEyiwo--NpwYWWc5eNLGfB@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 12/Jul/10 18:00, Edison Figueira wrote:
> The absence of the verdict like<RETURN>  on libnetfilter_queue is because it
> was not implemented or is not possible to implement?

Return what/where? Don't confuse tables with chains or queues...

> Has something like of<RETURN>  what can be make in the queue to have this
> effect?

Setting a mark and ACCEPT a packet from a table may be a handy way to 
return a value that can be tested by iptables rules of a further table.

HTH
