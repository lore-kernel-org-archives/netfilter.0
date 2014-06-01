From: dapiot holmp <dapiotholmp@gmail.com>
Subject: Re: ebtables not blocking arp (or anything). I am using knoppix
Date: Sun, 1 Jun 2014 15:11:53 +0100
Message-ID: <CAKBM6-M=HU4+FrQrtdX384yS9dQP7m9jwiqbtUCvbG=X=dvreA@mail.gmail.com>
References: <CAKBM6-PHW3C5r0v+KiFd1nuP7oUrZyw=T_AEs0Nea-1o38D2sg@mail.gmail.com>
	<538B2669.4010308@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=8dqg3QYBAs3MI9oRcIfc23CtP13EMVGKt/BHViY3nD8=;
        b=KWovmYWtK/O80LgpLMpu/3s+ohkVXVkqj7FZ6R5J7CnB2Sd2Diy/pcJUJuABSJUHAj
         y2N98y6MQQSW3+lXIeFAzjLrMAp+uQFKua479sKuoEnTohl7Tpy7ZSPVxwkRAnm960EL
         qSK9Dk0Ze7yCzP9faww/N3GXOh58E02+/Uaq2x+VRHFRvhSgaVuCq23K5cbgn5SaTE8w
         1P90O4SdmLkXj/XD94VmEjtkuHsV1uHgzBrsqTl7VVZBOXXnncbwNBYmF7qEAa7rGkNy
         Gn1YMdntzSVtIrHuQSZdBkdOpWDtzv39DOt6oJulj5ajYeRijrgUm4LBXBA5UQXKb2Ys
         BKTQ==
In-Reply-To: <538B2669.4010308@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

On Sun, Jun 1, 2014 at 2:11 PM, Pascal Hambourg <pascal@plouf.fr.eu.org=
> wrote:
> dapiot holmp a =C3=A9crit :
>> Hi
>>
>> I know what ARP does but for fun, and to see what ebtables can do, I
>> want to try to block ARP.
>
> Do you have a bridge ? ebtables acts only on packets received, sent o=
f
> forwarded through interfaces which are part of a bridge.
> --

It's not set up as a bridge.. so that explains it.   and it couldn't
be set up as a bridge properly as I only have one physical network
interface.

I suppose if I set my laptop with one physical network interface up as
a bridge(to get the benefit of ebtables)  brctl command, then i won't
be able to browse the web from it?

in which case ebtables can't do what I want in my case, and maybe I
should look at arptables.
