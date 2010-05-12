From: Mistick Levi <gmistick@gmail.com>
Subject: Fwd: iptable how many rule can manage iptable
Date: Wed, 12 May 2010 23:19:22 +0300
Message-ID: <AANLkTilxVDgX_tv6ggVxisuSNXI2FSYnwgxFumtkBLK0@mail.gmail.com>
References: <l2vf1cc03e01005121009j3ce0e30cj56ac615688a58916@mail.gmail.com>
	 <alpine.LSU.2.01.1005121925440.14663@obet.zrqbmnf.qr>
	 <m2sf1cc03e01005121105vc2bdb9fexd277eae9c4085061@mail.gmail.com>
	 <alpine.LSU.2.01.1005122116400.19854@obet.zrqbmnf.qr>
	 <AANLkTil4jAxQ-JvggsqWtLmAaasn9gb-CAsY-Pim1dXF@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=EPwWmCZ8zOHT1zFg2mdUeIHiKEDSi7q2Ezznylpu+F0=;
        b=nHH4EXYZrBtvY4PvrEeTOZb4QBsMlGBgdehjJ/d9giWNILB2LOx1uakEAZwDrntZ5Q
         7da1GFHakhIqgQxnU/vaYHtRdWPl2DNfB48v62IhVVuP0KRFr7HJW1vCLCeOBYtg+YwM
         TQp/pdW7O7kV1RKBSK93khwqCRSiPClwnjZNY=
In-Reply-To: <AANLkTil4jAxQ-JvggsqWtLmAaasn9gb-CAsY-Pim1dXF@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

---------- Forwarded message ----------
=46rom: Mistick Levi <gmistick@gmail.com>
Date: 2010/5/12
Subject: Re: iptable how many rule can manage iptable
To: Mamadou Tour=E9 <e2ia.ci@gmail.com>
Cc: netfilter@vger.kernel.org


Hi,
You could use the hosts files (/etc/hosts.deny .. hosts.allow ) in
order to do so,
Im not sure what will be a greater performance penalty, setting a tons
of rules or the hosts file,
because after you edit the hosts file , every query of dns will go
through this long list before going out to the dns server....
put it to the test?

2010/5/12 Jan Engelhardt <jengelh@medozas.de>
>
> On Wednesday 2010-05-12 20:05, Mamadou Tour=E9 wrote:
>
> >Hi thank you for your reply.
> >how could i evaluate the quantity of memories.
> >for example of 1 000 000 rules what quantity should i have a least.
>
> If you use `iptables -vvS`, you see:
>
> libiptc vlibxtables.so.4. 5332 bytes.
>
> Which is the size of the current table. Multiply that by NR_CPUS
> (from /proc/config) to get what it's taking up (we're on to reducing
> that).
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
