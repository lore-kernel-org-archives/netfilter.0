From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: How to do NAT for an udp reply packet?
Date: Wed, 17 Aug 2011 21:35:32 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1108172134000.14947@frira.zrqbmnf.qr>
References: <3173206D0F5F6B418F76F5997B2AE75201F164B3@gatex01.CMLnet.peinet.peinc.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <3173206D0F5F6B418F76F5997B2AE75201F164B3@gatex01.CMLnet.peinet.peinc.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Calin Onofrei <Calin.Onofrei@cassidiancommunications.com>
Cc: netfilter@vger.kernel.org

On Wednesday 2011-08-17 15:48, Calin Onofrei wrote:

>Hi netfilter list,
>I want to do NAT with specific rules for an udp reply packet.

nf_nat works on entire NFCT connections only.
It eludes me why you would want to merely change one reply packet, but 
you would need xt_RAW[S|D]NAT for that.
