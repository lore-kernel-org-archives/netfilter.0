From: "Calin Onofrei" <Calin.Onofrei@cassidiancommunications.com>
Subject: RE: How to do NAT for an udp reply packet?
Date: Wed, 17 Aug 2011 15:38:06 -0400
Message-ID: <3173206D0F5F6B418F76F5997B2AE75201F164B6@gatex01.CMLnet.peinet.peinc.com>
References: <3173206D0F5F6B418F76F5997B2AE75201F164B3@gatex01.CMLnet.peinet.peinc.com> <alpine.LNX.2.01.1108172134000.14947@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
In-Reply-To: <alpine.LNX.2.01.1108172134000.14947@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

I need to change the source port for the udp reply packet.



-----Original Message-----
From: Jan Engelhardt [mailto:jengelh@medozas.de] 
Sent: August 17, 2011 15:36 PM
To: Calin Onofrei
Cc: netfilter@vger.kernel.org
Subject: Re: How to do NAT for an udp reply packet?

On Wednesday 2011-08-17 15:48, Calin Onofrei wrote:

>Hi netfilter list,
>I want to do NAT with specific rules for an udp reply packet.

nf_nat works on entire NFCT connections only.
It eludes me why you would want to merely change one reply packet, but 
you would need xt_RAW[S|D]NAT for that.
