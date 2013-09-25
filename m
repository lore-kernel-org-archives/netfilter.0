From: Anand Raj Manickam <anandrm@gmail.com>
Subject: nftables tcp-flags
Date: Wed, 25 Sep 2013 18:27:24 +0530
Message-ID: <CAEyr1FSjdWA2ec84GDK+bdmXQMVTv7ugCzwBBUauEu6AcEQYsg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=X0XWilfclYovJH2zoMQxt0xMurN1Lz6UJwe/dnnLoMA=;
        b=uYhZnn6EzZ9olcKQDVLPEazP19HDHEpzqppXr3TOx8Olk34tnx5efdKFqX71f/AWYB
         tO3/KhQsekxadEyp5SX0nh+s5X1ZzOlsQ6i3rwU19YIfb9v4l460HBtSwIBqU0elAS9E
         /0hVszRaqZIMiZLjMHPN3X0AYG84LM8LnEfb5HgVL6+M7ZViceRSjQlN6jTwLW+/uK/P
         inVP0uf6kpJYhf690THLt/85AhQqJWk52JzdYWBZvd/XS6JKesjB6UvIO4ML6ne/qdRL
         A3iaYw2NCUGvtWalABHqsCcqSpAOqgWwkXlXOt1ezO/6Snv8F0W2IpRyyC9xMFx8f8WD
         5zWg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

How do i set tcp flags ?
I tried
 nft add rule filter output tcp flags {syn,rst} counter
but failed ... also can some point me to valid syntaxes ..
