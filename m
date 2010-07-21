From: Sergei Zhirikov <sfzhi@yahoo.com>
Subject: Re: question about esp and policy matching rule
Date: Wed, 21 Jul 2010 15:46:14 +0200
Message-ID: <i26tp0$4q3$1@dough.gmane.org>
References: <OFC79F2599.5D7A2E5E-ON85257765.0011E584-86257765.0013332D@us.ibm.com>	<i21c1p$cl6$1@dough.gmane.org> <AANLkTimkhSedZPQcdaGeNfNTBkm9lJkGkau_4j72VCMo@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTimkhSedZPQcdaGeNfNTBkm9lJkGkau_4j72VCMo@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 2010-07-20 18:56, ratheesh k wrote:
>
> After decapsulation , will the ip packet will traverse prerouting chain again ?
>

Do you mean the prerouting chain of "nat" table (as opposed to "mangle" or "raw" table)?

I don't know for sure, but I would think that yes. You could perform a simple experiment to know for sure.

When using tunnel mode the destination of an incoming encapsulated packet can be another host (usually in the local network), while the destination of the ESP packet is the machine where the IPSec tunnel ends, so those two are to be routed differently. I'm just thinking aloud based more on my general undertanding of IPSec rather than on the knowledge of the implementation.

And don't forget that only the first packed in a connection is visible in the prerouting chain of "nat" table.

--
Sergei.

