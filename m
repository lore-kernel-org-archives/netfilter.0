From: Markus Feldmann <feldmann_markus@gmx.de>
Subject: Re: iptables NEW or SYN
Date: Thu, 13 May 2010 20:09:17 +0200
Message-ID: <hshf8e$jpn$1@dough.gmane.org>
References: <hshbmv$547$1@dough.gmane.org> <alpine.LSU.2.01.1005131916320.9398@obet.zrqbmnf.qr> <hsheni$h51$1@dough.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <hsheni$h51$1@dough.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Markus Feldmann schrieb:
> Jan Engelhardt schrieb:
>>
>>> What is the difference between SYN and NEW?
>>
>> Kinda like the difference between "new" and "refurbished".
So NEW means the IP was never seen before and the SYN flag means, that a 
new connection begins? So the first packet from a source adress is NEW 
whether or nor it has the SYN flag set ?

Is that correct?

If this is the case, than i need only the SYN flag to let establish 
incoming connection to my apache-Server?

regards Markus

