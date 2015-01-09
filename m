From: Feng Gao <gfree.wind@gmail.com>
Subject: Re: NFQUEUE and TCP retransmission
Date: Fri, 9 Jan 2015 22:44:34 +0800
Message-ID: <CA+6hz4rFOOWCGTy=JMSzYzb1si9VgayXyigAOjaW3EfMu235wg@mail.gmail.com>
References: <CAOb3iuj5sx3iaQDezPp7BLZk=-48mDGR0o_3Bab8qz9fOA_ppA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=I4/+noMU5sIGO804rSpTV+5Kf35y5DYPrN0ZMZla4bI=;
        b=FsHhXSybqXdDnRL6MMIqwG23QlWC9etDJETkKiL2Dz1tJl4pAPXcGwaqTclPHFYGiJ
         ADH2+BO54HE7NXbcQfaG6s+tw8031mqG0x1uwqpJ/WH1djw3V6R0vDKRJXLbdfuiA9Pl
         FhSRd7xUSdY8BDt14BOAsWh7VfRDAIj/U1rjL+7S+QKTIAG8a7vfK7/fG4MKR08hOjRq
         HyGDCxnT3M4M0/W2UJ9dHAXLJRAGkplleqGLqTaxIRDCNzpMYacsrdG8CTNpqJqtVyE1
         GoTKcE9rnYE79vLnUFPPIWpkiXXoIUZtyCYoRuBGhE0cKSvLgaP17ys9nrLl51qQINNX
         5iEg==
In-Reply-To: <CAOb3iuj5sx3iaQDezPp7BLZk=-48mDGR0o_3Bab8qz9fOA_ppA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?B?6YKT5bCn?= <torshie@gmail.com>
Cc: netfilter@vger.kernel.org

the userspace program will receive the retransmitted packet.

On Fri, Jan 9, 2015 at 10:28 AM, =E9=82=93=E5=B0=A7 <torshie@gmail.com>=
 wrote:
> Hi,
> When the following iptables rule is used:
> iptables -A INPUT -p tcp --dport 1234 -j NFQUEUE --queue-num 0
>
> If a TCP packet is retransmitted, will the userspace program receive
> the retransmitted packet ? or it just receive one packet, and the
> retransmitted one is dropped in kernel space ?
>
> Thanks
> Deng Yao
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
