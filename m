From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: ebtables PREROUTING -drop
Date: Thu, 5 Aug 2010 17:09:48 +0530
Message-ID: <AANLkTi=zqyJu_TAAvK9WzGB=rLHr3B+BPWXBccwDri9e@mail.gmail.com>
References: <AANLkTikUczLiyxy3A5eVv7bg1XWhH-ggN1yUv2-EwLYM@mail.gmail.com>
	<alpine.LSU.2.01.1008041343200.32671@obet.zrqbmnf.qr>
	<AANLkTim_=pmLER7v=rePa=ikP2Fv0bKJkN4aafNXUTNo@mail.gmail.com>
	<alpine.LSU.2.01.1008051303550.30611@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=GQMyfSppNQMxXN70dYTomCZvoBfZ5WmcE3+m5s6Yhas=;
        b=qOv74/fVzaDHq4rVuj2Qu/yYaFVsQ7QsBwf2Ug7CG49VjcySW/5bhUM7L/4lhsU6Ob
         xV3HCq/WjxjAqPlP4qapkV1eplyt+09LpJNQq7yrjlIBSsWqCEQAJTA/KV3hOrBmCTAQ
         rPg3vMAH9SAIEk6f0O+7LZyYVA3rIp1cwvReM=
In-Reply-To: <alpine.LSU.2.01.1008051303550.30611@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: bridge@lists.linux-foundation.org, Netfilter mailing list <netfilter@vger.kernel.org>

On Thu, Aug 5, 2010 at 4:41 PM, Jan Engelhardt <jengelh@medozas.de> wro=
te:
> deep down below in source code, DROP just does that - drop.

1.  In ebtables Broute, if packet  gets  dropped , how it goes to ip
layer for further processing ?
2.  ip_route_input will be called on all frames hitting prerouting nat
table of ebtables . How it can decide where to route once it is past
prerouing hook (packet which are dropped on nat prerotuing of ebtables
) ?  /* i could be totally wrong here */


-Ratheesh


> On Thursday 2010-08-05 12:42, ratheesh k wrote:
>>>>
>>>>What will happen, =A0if we drop a packet at PREROUTING chain =A0of =
ebtables ?
>>>
>>> Depends on the table you are referring to.
>>
>>What is the difference between =A0droppin a Pkt in Brouting chain of
>>Broute table and =A0Drop a Pkt in =A0nat prerouing chain of ebtables =
=2E Or
>>are they having same effect ? .
>
> Generally, nat and broute are intended to be a configuration database=
s
> only, where special semantics to standard verdicts can apply, as it d=
oes
> for broute. To avoid confusion, the use of DROP in nat is not
> advised, and iptables checks for such attempts. Ebtables doesn't, but
> then again, it's the 4th-order-stepson of iptables only...
> deep down below in source code, DROP just does that - drop.
>
