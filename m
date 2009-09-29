From: Bill Hendrickson <wjhendrickson@gmail.com>
Subject: Re: SSH Port Forwarding with iptables
Date: Tue, 29 Sep 2009 13:12:47 -0400
Message-ID: <a0017e7e0909291012q33a4edd4y6c5d063399e4fadc@mail.gmail.com>
References: <a0017e7e0909290816i35c5e55dw77ec8517232ef276@mail.gmail.com>
	 <4AC232F2.6050401@freemail.hu>
	 <a0017e7e0909290941h38aeafd3hda04418654bee004@mail.gmail.com>
	 <4AC23D3B.6050705@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=P6W189qxWd+0BbVpg38tAIcTDcKNGXo5Rwnx/dMKIkI=;
        b=p04mGYJQ58k3UMxfD+YXw1H91ps1PtMHP1sAxk7FWsCSTVSwkqw31GvCS37GBnoSdp
         RLT0RYAvTAiOx6m4gO3MeVeWyNTVV4Q6rzkiXxXJjIxWZT1NTj6tWOuKBugxdhl8Xanp
         +idcwWjibdfFn/J0ZjHh4AAN2TABc+RoRytcA=
In-Reply-To: <4AC23D3B.6050705@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?B?R+FzcOFyIExham9z?= <swifty@freemail.hu>
Cc: netfilter@vger.kernel.org

>
> Your welcome! :D
>
> FORWARD is the chain...
> MASQUERADING is a techique...
> But to answer your question:
> You are FORWARDing packets to and from your internal/external network=
s on
> the firewall/gateway.
> If you have fix external IP then you should SNAT every packet that le=
aves
> your network.
> If you have dynamic IP then you should MASQUERADE.
> Your first attempt was unsuccessful because the external client expec=
ted the
> packets from the gateway and not from an "internal" unknown IP.
>
> As of the manual:
>
> =A0MASQUERADE
> =A0 =A0 =A0This target is only valid in the nat table, in the POSTROU=
TING chain.
> =A0It should only be used with dynamically assigned IP (dialup) conne=
ctions:
> if you have a static IP
> =A0 =A0 =A0address, =A0you =A0should =A0use the SNAT target. =A0Masqu=
erading is equivalent
> to specifying a mapping to the IP address of the interface the packet=
 is
> going out, but also has
> =A0 =A0 =A0the effect that connections are forgotten when the interfa=
ce goes down.
> =A0This is the correct behavior when the next dialup =A0is =A0unlikel=
y =A0to =A0have
> =A0the =A0same =A0interface
> =A0 =A0 =A0address (and hence any established connections are lost an=
yway).
>
> Swifty
Excellent, I see.  You the man, Swifty.  Case closed.  Points awarded.
