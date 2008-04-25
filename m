From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: nfconntrack and asymmetric routing
Date: Fri, 25 Apr 2008 21:28:35 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804252128260.20150@fbirervta.pbzchgretzou.qr>
References: <BAY103-DAV1263F9F3556A592C04C847B2E30@phx.gbl> <alpine.LNX.1.10.0804251934090.20150@fbirervta.pbzchgretzou.qr> <BAY103-DAV111F37548D4281FB84FF29B2DD0@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BAY103-DAV111F37548D4281FB84FF29B2DD0@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marco Berizzi <pupilla@hotmail.com>
Cc: netfilter@vger.kernel.org


On Friday 2008-04-25 21:24, Marco Berizzi wrote:
>>>Is there a way to tell netfilter to delete
>>>these entries?
>> 
>> Would not it be better to disable connection tracking for
>> the asymmetrically routed packets?
>
>Is there a way to do it?

-j NOTRACK.
