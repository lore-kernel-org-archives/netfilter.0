From: Pieter Smit <mlist2010@vigor.co.za>
Subject: Re: Problem with NAT rule
Date: Sat, 24 Jul 2010 18:13:53 +0200
Message-ID: <AANLkTikGQe8B84fnL65qb32tkRrV6bTfye-fjGtsxQ9=@mail.gmail.com>
References: <AANLkTi=SSSJJJVO7J6PSW52F=yRxr+9mqvhSObX8qLdr@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:sender:received
         :in-reply-to:references:from:date:x-google-sender-auth:message-id
         :subject:to:cc:content-type:content-transfer-encoding;
        bh=8GYYAdE1SrvgYwbxrcy9UbBv7gi2enAKicV3jyWzdoc=;
        b=hLmFli/FaQtA19Sl7fKsnhTdng5dRIbBRf1sl6XZfeI4waNTpw5qouk/pER/ky2wKg
         yEeo/evnUFqsG/k+XBMbwwiDUAmLzWo0mOv2QO0r1t3rt/wh8xg/F0tbRD+ACBuKpEhG
         lfuZ97gqA/ecgaX6mNNRBIb9Hlh2ElLiT/9fM=
In-Reply-To: <AANLkTi=SSSJJJVO7J6PSW52F=yRxr+9mqvhSObX8qLdr@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pete Kay <petedao@gmail.com>
Cc: netfilter@vger.kernel.org

A couple of questions.

1. You have 3 devices, with the  FW with two interfaces 192.168.1.114
and 192.168.1.200 in each subnet ?

2. The two outside hosts will connect to udp ports on the FW device
that will be translated to the other device ?

3. Is the udp streams in one direction ?  Does it matter to the udp
receiver where the packet comes from or will it always send return
traffic to the FW ip ?

Cheers,
Pieter

On Sat, Jul 24, 2010 at 3:41 PM, Pete Kay <petedao@gmail.com> wrote:
> Hi,
>
> I would like to setup my iptable rules to forward udp packet from one
> device to another:
>
> 192.168.1.100:16385 =A0<---------> 192.168.1.114:29848 :: 192.168.1.2=
00
> :29850 =A0<----------> 192.168.1.300:10112
>
> What I want to do is forward all packets from 192.168.1.100:16385 to
> 192.168.1.300:10112 and all packets from 192.168.1.300:10112 to
> 192.168.1.100:16385
>
