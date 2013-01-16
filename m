From: Lazuardi Nasution <mrxlazuardin@gmail.com>
Subject: Restored Reply Packets Hook
Date: Thu, 17 Jan 2013 01:46:11 +0700
Message-ID: <CA+u3GuLxncZduNqdf09ZmoF22ZC2GVLsb0n8-0cWa46JPR3nOQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:date:message-id:subject:from:to
         :content-type;
        bh=lBR3db25CLxwpZ667wNdTApANYdJryeP64EVDf6X5Ds=;
        b=lh6f4rwN7UExv83lPHXCF4M4CNXO3b3kINhbQmI3tK9l7N9jYTcu4I7ME0ctkfkMBj
         f2tonp2y9HteaVuIfdufV0DfM/pBo4MaNypvbPC99lUYVRba3oLlnCXXiwz5ynbM8mpz
         Y0f4CdyJOzddeQNA0gBmVjHatObglIEmuHPGBBxKcdtfNUX3R5MOETNvcb8b40uz+/Nm
         2AMmJnCWFSQgcBxslQIHG1JVt6zyC3mFsAOVydgiZK2ie2KsHnV2iYzYLHTZsYwKjZ4L
         RhPuX9vFvAKQYvK1UY+E09C4SbHxTn2831Lc4nZOneOOo/NEMZU9FLAHGU+mx+sTeBi6
         R/tA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

Where conntrack restores the address/port to original address/port of
the reply packets before they leave outgoing interface? What is ip
tables rule to hook on that place? It should be related to POSTROUTING
but I have seen that the reply packets address/port on POSTROUTING NAT
hook have not been restored.

Best regards,
