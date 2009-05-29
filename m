From: Bruno Moreira Guedes <thbmatrix@gmail.com>
Subject: libnfqueue: What about performance?
Date: Fri, 29 May 2009 09:45:52 -0300
Message-ID: <3fdd6ce00905290545g527ca7fdv560afc6a8c383e10@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=hKcg+GX3Xb3jKWHZ5/npYy5zkzDwWS+PUVoYM9LnPEo=;
        b=tK8r2sYXZxP6DNi3PCUMklI04Bq19hpbvM/65AOZ2eCZ//suBFDtNZgoDFWjeAoNrp
         d8Xv3abyLpdq/UiLRGunQPR8Cm4E0XzZ6/7uLLMvgSG0njaP/Wxjlv2KEBNdHHtbcVeG
         GXHbKGXd190p1ZRDbCnzlZ8VhwlXP1uuv5+DQ=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Netfilter <netfilter@vger.kernel.org>

Hi all,

I want to know, just by curiosity, if somebody already have been done
some benchmarks on the libnfqueue, or even in libipq, in some
different cases, to check if there are some performance loss.
What I really want to know is, if I filter just the SYN packets on a
network firewall, will I feel some loss??
There are performance loss if I get the packet payload?

What do you think about it??

Thank you all
