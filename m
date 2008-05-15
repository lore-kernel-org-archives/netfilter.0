From: "=?ISO-8859-1?Q?J=FCrgen_Rochol?=" <juergen.rox@gmail.com>
Subject: Re: Netfiler REAL Rule Match Sequence
Date: Thu, 15 May 2008 11:32:17 -0300
Message-ID: <774cb3b60805150732o1ee9f5fao53537d46bec76ac2@mail.gmail.com>
References: <774cb3b60805141321l6b8ce420ia10b6e027c80dd74@mail.gmail.com>
	 <alpine.LNX.1.10.0805142328140.5292@fbirervta.pbzchgretzou.qr>
	 <774cb3b60805150610h6aad9517l86eb7079e75cfaf4@mail.gmail.com>
	 <774cb3b60805150611w292f88d1le77aece2ade7e934@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=A3bPeAkZd7fvLd/wA7jWLMrPBaJDfUJheRSiESmher8=;
        b=ER4O49y3U+n57nFvnVKM+NbWUrJsEl6UMEY5wXB4si99ftbe50tpjbEQPMC7cRvz2gvVMppyaukCDWeg2ooct+XthJaM9sbOrdOxknKofc3OZYdojW88jR/s/B8QS6Ikutmz+OI/hpU3ZLoA3JLVU3yNgf/JYw6uXTwn+IVLb34=
In-Reply-To: <774cb3b60805150611w292f88d1le77aece2ade7e934@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

Hi,

Now it goes my scenario.
What I found is that the same packet is evaluated not only by the
first match, but by ALL matches

Suppose you have two PCs (PC1 and PC2).

PC1 only sends continuously  ping packets (icmp echo request)  to PC2,
which answers it, depending on the rules.

So, if you have:

A) iptables -P OUTPUT DROP
* PC1 does not receive any answer -> Ok, no problem, this is the defaul=
t policy

B)  iptables -P OUTPUT DROP  and iptables -A OUTPUT -t filter  -p icmp
 -j ACCEPT
* PC1 receives the reply. This is because on the OUTPUT chain there's
a rule saying: Ok, accept it. And  this is the FIRST to be evaluated
on OUTPUT chain, so it is expected to be like this.

C)  iptables -P OUTPUT DROP  and iptables -A OUTPUT -t filter  -p icmp
 -j ACCEPT and iptables -t mangle -A POSTROUTING -p icmp -j TTL
--ttl-dec 10

What happens now?
* PC1 receives the reply.  This is the *first match* for this packet
(as in B). So thats ok.
* But other thing happens: PC1 receive the reply with TTL decremented.
So the 3rd rule above was also evaluated. That is, for a same packet,
2 rules were applied.

I thought that only the first match should be evaluated. Moreover, if y=
ou add:
 iptables -t mangle -A POSTROUTING -p icmp  -j TOS --set-tos 0x10

it will be also evaluted and PC1 will receive packets with ToS changed.

In short, for the same packet, what you have is:

1 evaluation in OUTPUT chain.
2 evaluations in POSTROUTING chain.

The experiments shows that netfiler/iptables evaluate all rules for a
single packet and execute all actions, and does stop on the first
match. But what I read everywhere is that *the evaluation stops at the
firts match*, what it seems to be wrong.

Am I getting it wrong? Is it suppose to be like this?

Thanks

J=FCrgen
