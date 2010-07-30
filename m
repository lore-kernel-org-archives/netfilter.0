From: Lars Nooden <lars.curator@gmail.com>
Subject: Re: block network access for certain users/groups
Date: Fri, 30 Jul 2010 14:34:44 +0300
Message-ID: <4C52B8D4.30207@gmail.com>
References: <op.vgmcupy42qajpl@imac.local> <4C51D771.1080904@gmail.com> <alpine.LSU.2.01.1007301036310.27811@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :x-enigmail-version:openpgp:content-type:content-transfer-encoding;
        bh=+Cm2mggSpt4XHRRQRI1xiXnOqYD8m0JQopvS7cBu59Q=;
        b=lwINLngkw3xExnVk2mMy8cIBmRlYEhc+bMopc+WePrDCQ0/ylmq2jUb4dA5st5JsLU
         kHERS2sMxQKU1ayg3w7d2PYcEJz1Ex/b16+Z8Nc54nMKtkR2fVOFbAM8lyxloRQF7fA6
         7fOcrqSUmsoJMpTD+Dv8rNP+NZPqvDQpp8VJU=
In-Reply-To: <alpine.LSU.2.01.1007301036310.27811@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Elmar Stellnberger <estellnb@gmail.com>, netfilter@vger.kernel.org, peterb@chiark.greenend.org.uk, chris@chrisbrenton.org

On 07/30/2010 12:00 PM, Jan Engelhardt wrote:
>=20
> Ref: http://marc.info/?l=3Dnetfilter&m=3D128043201731932&w=3D2
>=20
> On Thursday 2010-07-29 21:33, Lars Nooden wrote:
>> On 7/29/10 10:09 PM, Elmar Stellnberger wrote:
>>> iptables -A mychain -m owner --gid-owner blockedusergroup -j DROP
>>
>> For starters, consider using the REJECT target instead of DROP if fo=
r no other
>> reason than that it will make your engineering easier:
>>
>> 	http://www.chiark.greenend.org.uk/~peterb/network/drop-vs-reject
>=20
> That page - especially the summary - is leaving out one essential fea=
ture
> G=C3=A1spar already mentioned it in another thread; the CHAOS target =
from
> Xtables-addons.

CHAOS and TARPIT look about the same as DROP in regards to the question
of REJECT vs DROP.  The same arguments apply about a quick response fro=
m
the filter or not.

 http://www.chrisbrenton.org/2009/07/why-firewall-reject-rules-are-bett=
er-than-firewall-drop-rules/

 http://www.chiark.greenend.org.uk/~peterb/network/drop-vs-reject


/Lars
