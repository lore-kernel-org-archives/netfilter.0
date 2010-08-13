From: =?UTF-8?Q?Mamadou_Tour=C3=A9?= <e2ia.ci@gmail.com>
Subject: iptable and tproxy target
Date: Fri, 13 Aug 2010 13:41:02 +0000
Message-ID: <AANLkTikh647zs7Te95G7Yrf_Ys6rJTERTyg357574Yn+@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=TKtynLAi7bXqV8Q1o3Q9bD4uyKPKwdbolbntNaArRNM=;
        b=M0feV0k/eIiA4b2KEfO/Ur35rleUon4KJDPtYs1nqoaiDOHJ/4zyF8in01Egqlu6h9
         E9qMfQkIB2v/jHeEx71KH0bp6xajeNl82Q0EkccJtELCNgHVrLWDu6PDcHDFNyeMjOyV
         PNzzoTo4ZU2ssScHpzO5yLL9wlmtUl7gDtIyE=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,
all i'm using tproxy target in my iptable rule:
ex:
iptables -t mangle -A PREROUTING -p tcp --dport 80 -j TPROXY
--tproxy-mark 0x1/0x1 --on-port 3129

now in my mangle POSTROUTING i'd like make some action on packet mark
with --tproxy-mark 0x1/0x1.
for exemple ACCEPT all packet mark with --tproxy-mark 0x1/0x1.

How could i do that.
regards.
