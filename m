From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: active interface?
Date: Thu, 21 Aug 2008 09:42:45 -0400 (EDT)
Message-ID: <alpine.LNX.1.10.0808210940420.9509@fbirervta.pbzchgretzou.qr>
References: <200808151255.44987.janklodvan@gmail.com> <48A7A94E.8070202@reptiliannature.org> <48A7B09E.4040403@riverviewtech.net> <200808211632.37656.janklodvan@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200808211632.37656.janklodvan@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Klod <janklodvan@gmail.com>
Cc: netfilter@vger.kernel.org


On Thursday 2008-08-21 09:32, Jan Klod wrote:

>I have an unanswered question: how active interface is determined in Linux? I 
>mean, interface, which is used by web / mail / ping (default) ?

Routing. You can obtain the kernel routing code's decision by

	ip route get $destination_address_here

There are a handful of parameters that influence the decision, such as 
TOS and fwmark.
