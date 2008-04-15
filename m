From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: Netfilter and IPSec
Date: Tue, 15 Apr 2008 19:22:28 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804151922110.13202@fbirervta.pbzchgretzou.qr>
References: <480423CD.3060707@lasige.di.fc.ul.pt> <alpine.LNX.1.10.0804151322470.13202@fbirervta.pbzchgretzou.qr> <200804151854.44347.netdev@axxeo.de>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <200804151854.44347.netdev@axxeo.de>
Sender: netdev-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Oeser <netdev@axxeo.de>
Cc: =?UTF-8?Q?F=C3=A1bio_Souto?= <fsouto@lasige.di.fc.ul.pt>, netfilter@vger.kernel.org, netdev@vger.kernel.org


On Tuesday 2008-04-15 18:54, Ingo Oeser wrote:
>Jan Engelhardt schrieb:
>> It kinda brings me the question why the ipsec transformation is
>> not done with an xtables target instead; that would also give
>> handy access to connection tracking if needed.
>
>And simplify firewalling A LOT :-)
>
>BTW: Anybody has a working ipsec match these days or is this known broken?

-p esp, -m policy, take your pick :-)
