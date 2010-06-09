From: "Umar Qureshey" <umar.qureshey@lantronix.com>
Subject: RE: CONFIG_BRIDGE_NETFILTER stops any traffic on wireless interface
Date: Wed, 9 Jun 2010 10:16:11 -0700
Message-ID: <F24C979D1AFD4E4292B911441CBA242407FD14@2putt.int.lantronix.com>
References: <F24C979D1AFD4E4292B911441CBA242407FCFB@2putt.int.lantronix.com> <AANLkTikBjPz7zSp7KpAsnhbyfP94TwsGrbIcXdjP2r6z@mail.gmail.com> <F24C979D1AFD4E4292B911441CBA242407FCFE@2putt.int.lantronix.com> <alpine.LSU.2.01.1006040850570.19959@obet.zrqbmnf.qr> <F24C979D1AFD4E4292B911441CBA242407FD13@2putt.int.lantronix.com> <alpine.LSU.2.01.1006091903040.3409@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: agashi shipora <gashipo@gmail.com>, netfilter@vger.kernel.org

Very true.  
I figured that since CONFIG_BRIDGE_NETFILTER is rendering the wireless
dead, this would 
be the most pertinent place to query about this peculiar behavior.
I realize this is a tough cookie to crack as it's a strange one.


-----Original Message-----
From: netfilter-owner@vger.kernel.org
[mailto:netfilter-owner@vger.kernel.org] On Behalf Of Jan Engelhardt
Sent: Wednesday, June 09, 2010 10:04 AM
To: Umar Qureshey
Cc: agashi shipora; netfilter@vger.kernel.org
Subject: RE: CONFIG_BRIDGE_NETFILTER stops any traffic on wireless
interface


On Wednesday 2010-06-09 18:56, Umar Qureshey wrote:

>*brctl showstp br0: I am using busybox version of brctl and it doesn't
>support the showstp parameter.  
>Besides, the wireless connection is dead before I create any bridge.

So it does not look like an ebtables problem. If wireless ain't
working without a bridge,  how is it supposed to with brdiging?
--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
 
**********************************************************************
This e-mail is the property of Lantronix. It is intended only for the person or entity to which it is addressed and may contain information that is privileged, confidential, or otherwise protected from disclosure. Distribution or copying of this e-mail, or the information contained herein, to anyone other than the intended recipient is prohibited.
