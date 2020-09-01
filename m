From: Tomasz W <tomaszw104@gmail.com>
Subject: netfilter_queue tutorial
Date: Tue, 1 Sep 2020 13:04:22 +0200
Message-ID: <2519CEB2-FFCB-42DD-8C71-7077290831E3@gmail.com>
Mime-Version: 1.0 (1.0)
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=content-transfer-encoding:from:mime-version:date:subject:message-id
         :to;
        bh=FwsMaX9E5b1+VTQxbZnFWo3Iwb+8xoGB/Jkp4bq6aeg=;
        b=XBiQ59GWGGYisW2zQutWHJWZuT3vmjfJVwlnCaqvxet/xb2D1s/otR7UXSI6jnY2VX
         AceFtMLWuiy9JLWC0EIe/xnEyBV5FSQ4zUbTXvbCW4KfSwURWDSAwleTnhFF0rFpm5YB
         IZaUDGHcoCCMIiOMO/eQ8nI/LVTo7Bwt9vsfsSsO1QC/yDaoOLOuP+e9jEZrhpKydM5Q
         FvOrFWdBxbkcuyNzAdnflLyv/2SvvGWpYXJsMEsueXQIql8PpM5XuMoFgZrdhWekMFqz
         sNNY0tLpubUFK5YyvIfRK2tLOmvMmgcP0coABadb4zfnWZD6nLkVKAEpW/Ya5vmtw7sD
         zzJQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Good Morning,

can anyone, pretty please, guide me or provide me with a decent tutorial on m=
arking packets? Documents and example files are not very helpful. I am tryin=
g to integrate netfilter_queue with my software that capture packets with li=
bpcap and analyse those with nDPI.=
