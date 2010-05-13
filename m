From: Markus Feldmann <feldmann_markus@gmx.de>
Subject: Re: iptables NEW or SYN
Date: Thu, 13 May 2010 20:05:08 +0200
Message-ID: <hshf0k$ine$1@dough.gmane.org>
References: <hshbmv$547$1@dough.gmane.org> <alpine.LSU.2.01.1005131916320.9398@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.01.1005131916320.9398@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Jan Engelhardt schrieb:
> On Thursday 2010-05-13 19:08, Markus Feldmann wrote:
> 
>> I thought SYN is included in the state NEW, is that wrong?
> 
> There are cases where SYN can be INVALID, naturally. Furthermore, CTs 
> may be NEW even if the packet is not TCP SYN.
What are CTs?

