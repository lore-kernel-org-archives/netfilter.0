From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: question about esp and policy matching rule
Date: Wed, 21 Jul 2010 15:55:43 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1007211553420.4692@obet.zrqbmnf.qr>
References: <OFC79F2599.5D7A2E5E-ON85257765.0011E584-86257765.0013332D@us.ibm.com> <i21c1p$cl6$1@dough.gmane.org> <AANLkTimkhSedZPQcdaGeNfNTBkm9lJkGkau_4j72VCMo@mail.gmail.com> <i26tp0$4q3$1@dough.gmane.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <i26tp0$4q3$1@dough.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sergei Zhirikov <sfzhi@yahoo.com>
Cc: netfilter@vger.kernel.org

On Wednesday 2010-07-21 15:46, Sergei Zhirikov wrote:
> On 2010-07-20 18:56, ratheesh k wrote:
>>
>> After decapsulation , will the ip packet will traverse prerouting chain again
>> ?
>
> I don't know for sure, but I would think that yes. You could perform a simple
> experiment to know for sure.

As per http://jengelh.medozas.de/images/nf-packet-flow.png , yes it 
will. This also makes sense for transport mode, to strip the AH header 
or to decrypt ESP.
