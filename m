From: Giuseppe Longo <giuseppelng@gmail.com>
Subject: Compile iptables on Debian
Date: Wed, 9 Jan 2013 15:53:38 +0000
Message-ID: <CAFpD06RqLxuSibz77j5EoNWFOrgpV6XD5EGHETDapbLLsz=5tw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=gBjxhDTLZaYtmtlA7K//lPaFk3LR5q0c1MaT8mAYJ6U=;
        b=rN0SDDkmXP40TwTVEWMkIVQfE7/FDCgQvvYV4aqFfDl9OGjQ5q1dQ6wbv86zx8ntSb
         mTi5OfNG7PmCDMOfF1q3hF/LU8tQuKbo0R07KjkNWkNPGdnH2L4bD3TttSjNpH4zfrnz
         g/YGg4Zdt2ffniVVrW/36Abq0cVQE2hHKnbujCfZwg3nISP67X+nNg6qbiJN2dIfyCrd
         EEgExGnYOyz8uQavw2M124LnVCksvlF1trnyV8KFDmWa9DKEC/uHJY+lrK0q9gHxReor
         okLwnOcRGXHHkw1kkZTVfegaW90VdbKFCBNNyY8yXOUsrrJvVSe0FEI7XPFjZ5/mtda5
         a7fA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi list,
I'm trying to compile iptables-1.4.17 but when i run make command i
got this error:

/usr/bin/ld: cannt find -lip6tc

How can i fix it?

Thanks in advice,
Regards
