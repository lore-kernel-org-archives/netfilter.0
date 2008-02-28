From: "Marc Franquesa" <marc.franquesa@gmail.com>
Subject: Re: iptables error limit match: invalid size
Date: Fri, 29 Feb 2008 00:59:23 +0100
Message-ID: <5db5e03e0802281559o664729d9oc4da4f5ecc40c67a@mail.gmail.com>
References: <5db5e03e0802200617t9bf4d03ufe27fec5c80bf0bd@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=fWFIn71w67OjQ9f+bQQl7LjDQ1eTKJoeljRcKh1GyLs=;
        b=J5EYGdQmn0TfDIkf6X7+P2438QEu8xfW/2hkS/um3ewQhH/5o7c02D7Ala2Ss71Y/wGlrJdLbNmOHxGdw9GCQ85GULj1GOq1EgjQi1mgXSRtW0+7O18bOBQ22X7Yzg9IaHo5TAeRLdh9jwq3sxC3mjOQnqgdDIDX6xAe9srsBNU=
In-Reply-To: <5db5e03e0802200617t9bf4d03ufe27fec5c80bf0bd@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

2008/2/20, Marc Franquesa <marc.franquesa@gmail.com>:

>  idoru:~# iptables -I INETIN -p icmp --icmp-type 8 -m limit --limit
>  1/sec --limit-burst 5 -j ACCEPT
>  iptables: Invalid argument
>  ip_tables: limit match: invalid size 40 !=3D 32

Sorry to be too insistent, but I asked the same question in other
forums/mailing lists and no answer. I belive that here is the last
resort. =BFAnyone has some clue about what's happening?

Thank you.
