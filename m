From: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Subject: Re: nftables dports/Multiport
Date: Wed, 25 Sep 2013 11:18:00 +0200
Message-ID: <CAOkSjBh9LuOUxOp-GLBpo=ZpY7wamcPZdAmekgDAovaBPO_4rg@mail.gmail.com>
References: <CAEyr1FS7WQD_H4vzC4-yqXrrwGrqkeodpBtrd5_g8GYpC-T_Ww@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=rWXYzIxu5G6p2Jg0unFlA+2J80ix14y9sgmd2VFzumo=;
        b=c4uoqSK505VBrueEvn+rssx8bb4hfPAKxjn4k+V3Xzlg3kfBCHL/89w3tGo0MDa4y5
         zAOLs7kSx8ff67+S9pPct84gf44vMiGgOIUHvDoSLQl1Xci3Eka7+9BIlh3cPqpAqCzE
         ZGyrkiOSMA80lD5W5nF6MP9kjancEtaRFxTYCRHFW+Rm9Oj5VRsHFu9CrPjlnyEMADkI
         pApoUwitaWvnaJmRn7Q22SAgPA9EP0+rNBgNn8Lde+Go1QaHGU4eVC4bGsvDQIvwCApJ
         IenlfScDGPOzrP/DrZSGPvdOMQ/CWGDCX9FV59liKAuf2TuOPbfFEqdZ/Xui4x+v5cGx
         FXgA==
In-Reply-To: <CAEyr1FS7WQD_H4vzC4-yqXrrwGrqkeodpBtrd5_g8GYpC-T_Ww@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Anand Raj Manickam <anandrm@gmail.com>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 25 September 2013 10:51, Anand Raj Manickam <anandrm@gmail.com> wrot=
e:
> How do i add a multiport rule
>  nft add rule ip filter output tcp dports 99,200 ip daddr 1.1.1.1
> counter meta oif eth0 fails.
>
>
> I see that the range works,
>  nft add rule ip filter output tcp dport 99-105 ip daddr 1.1.1.1
> counter meta oif eth0

Try with an anonymous set:

nft add rule filter output tcp dport {99 , 200} ip daddr 1.1.1.1
counter meta oif eth0


--=20
Arturo Borrero Gonz=E1lez
